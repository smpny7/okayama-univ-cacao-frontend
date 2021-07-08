import 'dart:typed_data';

import 'package:nfc_manager/platform_tags.dart';

readFelicaOnAndroid(NfcF nfcf) async {
  var poll = _polling([0xFE, 0x00]);
  var pollingRes = await nfcf.transceive(data: poll);
  var targetIDm = pollingRes.sublist(2, 10); // System0 IDm
  var req = _readWithoutEncryption(targetIDm, 1, [0x1A, 0x8B]);
  var res = await nfcf.transceive(data: req);
  var data = _parse(res);

  var studentIDArray =
      data[0].sublist(2, 10).map((code) => String.fromCharCode(code));
  return studentIDArray.reduce((curr, next) => curr + next);
}

readFelicaOniOS(FeliCa felica) async {
  // Request Service
  List<Uint8List> serviceCode = [
    new Uint8List.fromList([(0x8B).toInt(), (0x1A).toInt()])
  ];
  felica.requestService(nodeCodeList: serviceCode);

  // Read Without Encryption
  List<Uint8List> blockList = [
    new Uint8List.fromList([(0x80).toInt(), (0x00).toInt()])
  ];
  var res = await felica.readWithoutEncryption(
      serviceCodeList: serviceCode, blockList: blockList);

  try {
    if (res.statusFlag1 != 0 || res.statusFlag2 != 0)
      throw Exception('Felica Read Failed.');
    var blockData = List.from(res.blockData[0]);
    var studentIDArray =
        blockData.sublist(2, 10).map((code) => String.fromCharCode(code));
    return studentIDArray.reduce((curr, next) => curr + next);
  } catch (e) {
    print('$e');
    print('statusFlag1: ${res.statusFlag1}');
    print('statusFlag2: ${res.statusFlag2}');
    print('blockData: ${res.blockData}');
    return null;
  }
}

Uint8List _polling(systemCode) {
  List<int> bout = [];

  bout.add(0x00); // tmp
  bout.add(0x00); // request command
  bout.add(systemCode[0]);
  bout.add(systemCode[1]);
  bout.add(0x01); // respond code
  bout.add(0x0f); // time slot

  Uint8List msg = Uint8List.fromList(bout);
  msg[0] = msg.length; // data length
  return msg;
}

_readWithoutEncryption(targetIDm, size, targetServiceCode) {
  List<int> bout = [];

  bout.add(0); // tmp
  bout.add(0x06); // request code
  bout.addAll(targetIDm);
  bout.add(1);

  bout.add(targetServiceCode[1]);
  bout.add(targetServiceCode[0]);
  bout.add(size.toInt());

  for (var i = 0; i < size; i++) {
    bout.add(0x80);
    bout.add(i);
  }

  var msg = Uint8List.fromList(bout);
  msg[0] = msg.length; // data length
  return msg;
}

_parse(res) {
  if (res[10] != 0x00) throw Exception('Felica Read Failed.');

  int size = res[12];
  var data = List.generate(
    size,
    (_) => Uint8List.fromList(List.generate(16, (_) => 0)),
  );
  for (var i = 0; i < size; i++) {
    var tmp = Uint8List.fromList(List.generate(16, (_) => 0));
    int offset = 13 + i * 16;
    for (int j = 0; j < 16; j++) tmp[j] = res[offset + j];
    data[i] = tmp;
  }
  return data;
}
