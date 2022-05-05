import 'package:cacao/state/qrcode_scan_state.dart';
import 'package:cacao/ui/pages/qrcode_scan_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final qrCodeScanViewModelProvider =
    StateNotifierProvider<QRCodeScanViewModel, QRCodeScanState>(
        (ref) => QRCodeScanViewModel());
