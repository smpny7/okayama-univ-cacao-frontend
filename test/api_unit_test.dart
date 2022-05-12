import 'dart:io';

import 'package:cacao/model/credential.dart';
import 'package:cacao/model/status.dart';
import 'package:cacao/model/token.dart';
import 'package:cacao/repository/remote_data_source/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  await dotenv.load(fileName: ".env");

  late MockWebServer _server;

  setUp(() {
    _server = new MockWebServer();
    _server.start();

    SharedPreferences.setMockInitialValues({
      "access_token":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2Y1ZTQ4Nzk4YWUwZWRkZWNhMzYwMWM3MDlmY2U2Zjg1ODI5MGMyNDkyNzRmZmJiNGUyZTQ3NzhhYWM3MGI3M2M5YmVmZjMxMDdiOTlkYmQiLCJpYXQiOjE2NTIyNTU5MDIuMDkyMjU5LCJuYmYiOjE2NTIyNTU5MDIuMDkyMjYyLCJleHAiOjE2ODM3OTE5MDIuMDc4NjAyLCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.qBi6iRhZH4v2uewPDEu2rfKZ0zi-pioQoML65giaMpomC5evLdeTBq_13A0N0HtyzICUbXBkiZoDGRl7K6IrY_QdvXIoO3mQlDDZ021W8heOf2t716BxmPtloQoMMzP_QUwiVYb6luJNwLYPvv187YY8Mibenpkvv_ssri2XKuibm2s4GsMRT3wcAG-okIIX82hu9Y5fiCPpnSGTEJF1qi5AdTb9g1iNUNrvWSxFhvV6vArDdhSEzf7Y0nVD8RIdI46imgPaP02FmS2KIFbfgDqC05jI_GWGdOhthw3Nlv5JAUD2OnNBquFxVoDValaUEFG_ayeQ9bXUqYuQpR8PSIpEFLYyOEm3yO_cL38QSYfzIdaQzDKzGCkqnc5dQE0Y6vzByLbRLVCOyd818eEojIerixyRqZGe9BIODVgfFcqKq1owlw3_qGvBJXmy4fZnpDzJY8deGvljkE60jvmmIids2dHMo_-0oe0NLaqb6jpR339e9NwSkbGQRelxBLXOAjCuDRZp_eFlGeanDZnTRLTcKbRVF8YGunryb5cgMtfCB76NmYDJLBFlICIS_wJ3bnsUhQIetoKToB6IekazIM3BJGfDbD_Hv8N-aukzOiixMX2dz9-4k1grExQKO60IEMFQ_5noaeC9nL0fLVcy4ZfLNVX55gmjsiITi-J8T6I",
      "refresh_token":
          "def5020058467fa82303ac481c1784b464dd8639f91a99ef2642739597c7ba0540e421bafcd61005b6787d0efc56b525bcc405840b85e2a94bf4e903c02661441ee7a08fe3f3c8b72a295bd623929faf7e0bb55491f591d2bd416526009113302d35ef4f05500f9fec94d35649496e4c316e127b9b4c018bd2ecd26c6dfe1c34628efbd7be729d707d5ff1832585715f155ff55dd6b2dca1bcd275a0cf05b3c01d5619153afefd5f46a9f28df6e86b9d3273dc42cb653560d597a4234a999f26d62b0f446e1ad3d4dee0677e448593929c9048411f2e85d8bbd3f34bb1aba47dad281dde17d9f83e5227e571549029975a43d3c77c599a421fbf53c72ebeb5a04b4a61432e722c5e83afdd4f766d2c7a6c8cceb2f699d93dc66686246249f266000125fc423c2c7a6db49bef576a615eea6c1098f006f21079b77724b48763d439f6bce2e3877f1351202a477a17bcbb89e58b0c8eed8b644dfcbb7c549eac68bdee1c69fe136711901c862451ec954eaa3b56b785c1ffec03f33ac333d706d76c523c1197a0ef4c22"
    });
  });

  tearDown(() => _server.shutdown());

  group('Model Test', () {
    test('Credential Model Assertion', () {
      expect(
          () => Credential(
              username: "987WJTzXrHmhJMg%", password: "ZmJwTp9vbc0CvNJ"),
          throwsAssertionError);
    });

    test('Credential Model Assertion', () {
      expect(
          () => Credential(
              username: "987WJTzXrHmhJMg", password: "ZmJwTp9vbc0CvNJ\$"),
          throwsAssertionError);
    });

    test('Token fromJson', () {
      expect(
        Token.fromJson(<String, dynamic>{
          "token_type": "Bearer",
          "expires_in": 31536000,
          "access_token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODhkOTg4NmIwZGMzNmMxMTc1NWVkYmE2MjU4OTFiYWRkOWE4MjhlOTZlYzRkYTEyOTE3ZmFiNDNlODA1MGJlZTE0NzkxNzI5ZjRiMTE4M2EiLCJpYXQiOjE2NTIwNzQ5MjcuNzYyNDI4LCJuYmYiOjE2NTIwNzQ5MjcuNzYyNDMzLCJleHAiOjE2ODM2MTA5MjcuNzQ0Mzc1LCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.n7PiT_A3FaYRwEjTrFAgb9pfR_HYl0Hl3x8v9v-uWvmED4-Wz64Xcu2HFw70tM0-mjqhTmcaw856I26dRg8j245G5effJADq4O5aviW9RO92r2OaKm3DI_YVaogezOavCl6sKTUtyQa2Bq1Yz14gfVQffmWpbtykAeef82wKHHTL4GvrpNkAbMYWO2sSOuydQT1qmEWpaX61-toNwHPMslH80q-TujatBMIhsqKRCqPdz7pk9wDXf3WwPHrNev83nU6z8gk00hiPa5h7aE8TKqc6LyhtoIeZkKcW8aTGVLRhWs6ywQVO6-rRzkX1SsFr6Vs6n_zt5poEBi2pD4fb9X0wl7dEJbYn1_kGoHuSy_Uywm_4fBgUjlGSDcvCwPD3n7Tqseahx_0oJo0DCDQUUP5xjo7iPx5u3ySVczl3mY2SQxUia_VKQHOMP99Xd4wlAzOiP8lcTYtSv1wV6YGXM7WmKEXL_usBqFc9FjZtIdHRwvKlPpM8bTz2JGFmledNCBOwY93OyXLDonzLIVjiWCyLTLnSGYmPa-mMODBcvT6ccF2GehXmaOygEEs8mNA_AoD3H4I4zuQJYKdxyIOsCB5FPY__nftQrq0UoJTR49ewhxnfMLkbvpnX2xqN05kSBHpBYPxd2pcyJhHP8rOb40MH9fk35Gh845mZx1xwzkY",
          "refresh_token":
              "def502008fe5947da41fbf4423e439fde4c925ed0864bc0d870595dc08bf8bd78df4b2954d86b282f9a0741dc4a6051cd446bcf2cdb50c6b9b3cbd672d1b7cd7b8a19c509c7317d0df7c131d63f33a195f894f17215fcfed4c34a57a71bd4b939c561ee14bfa173d7ad8d7439e44666ecbaa33e5f99a940cd64a7e4db068dbcc3ef812dcdb2d6ca4c2320cab23e638cabfdf89ee3244b2cfd7a46fb19402f6310238d64ba58a31fdd8aa924f8e82457abd93ded4257e4c001c4faae8f67ffd71903cc17f752f051bc5ac0fec910405b50805b2dec6667a2b8a0fa7337ed9e5537b4ef224c0732f889b66906a7c9b1ce63dc4d236c24cd7017c7abbdb13e3d87442616b4e6273ca71ee28a4727883afe150e54f6fa84fd4689df19ac035ef9f0950c03bca2ef05a290c8f1356a78ccf676c505c1ed6db83b24fa754f8be8036f262ed027c790850d74ea98a1c80644fd81aed2d18213ea2d3f20e86933dc272968d8644807ad383171374bb7d5d269302b144e222d6a31b670af06be9333113a23eb8835d4eade74ed9"
        }),
        Token(
            tokenType: "Bearer",
            expiresIn: 31536000,
            accessToken:
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODhkOTg4NmIwZGMzNmMxMTc1NWVkYmE2MjU4OTFiYWRkOWE4MjhlOTZlYzRkYTEyOTE3ZmFiNDNlODA1MGJlZTE0NzkxNzI5ZjRiMTE4M2EiLCJpYXQiOjE2NTIwNzQ5MjcuNzYyNDI4LCJuYmYiOjE2NTIwNzQ5MjcuNzYyNDMzLCJleHAiOjE2ODM2MTA5MjcuNzQ0Mzc1LCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.n7PiT_A3FaYRwEjTrFAgb9pfR_HYl0Hl3x8v9v-uWvmED4-Wz64Xcu2HFw70tM0-mjqhTmcaw856I26dRg8j245G5effJADq4O5aviW9RO92r2OaKm3DI_YVaogezOavCl6sKTUtyQa2Bq1Yz14gfVQffmWpbtykAeef82wKHHTL4GvrpNkAbMYWO2sSOuydQT1qmEWpaX61-toNwHPMslH80q-TujatBMIhsqKRCqPdz7pk9wDXf3WwPHrNev83nU6z8gk00hiPa5h7aE8TKqc6LyhtoIeZkKcW8aTGVLRhWs6ywQVO6-rRzkX1SsFr6Vs6n_zt5poEBi2pD4fb9X0wl7dEJbYn1_kGoHuSy_Uywm_4fBgUjlGSDcvCwPD3n7Tqseahx_0oJo0DCDQUUP5xjo7iPx5u3ySVczl3mY2SQxUia_VKQHOMP99Xd4wlAzOiP8lcTYtSv1wV6YGXM7WmKEXL_usBqFc9FjZtIdHRwvKlPpM8bTz2JGFmledNCBOwY93OyXLDonzLIVjiWCyLTLnSGYmPa-mMODBcvT6ccF2GehXmaOygEEs8mNA_AoD3H4I4zuQJYKdxyIOsCB5FPY__nftQrq0UoJTR49ewhxnfMLkbvpnX2xqN05kSBHpBYPxd2pcyJhHP8rOb40MH9fk35Gh845mZx1xwzkY",
            refreshToken:
                "def502008fe5947da41fbf4423e439fde4c925ed0864bc0d870595dc08bf8bd78df4b2954d86b282f9a0741dc4a6051cd446bcf2cdb50c6b9b3cbd672d1b7cd7b8a19c509c7317d0df7c131d63f33a195f894f17215fcfed4c34a57a71bd4b939c561ee14bfa173d7ad8d7439e44666ecbaa33e5f99a940cd64a7e4db068dbcc3ef812dcdb2d6ca4c2320cab23e638cabfdf89ee3244b2cfd7a46fb19402f6310238d64ba58a31fdd8aa924f8e82457abd93ded4257e4c001c4faae8f67ffd71903cc17f752f051bc5ac0fec910405b50805b2dec6667a2b8a0fa7337ed9e5537b4ef224c0732f889b66906a7c9b1ce63dc4d236c24cd7017c7abbdb13e3d87442616b4e6273ca71ee28a4727883afe150e54f6fa84fd4689df19ac035ef9f0950c03bca2ef05a290c8f1356a78ccf676c505c1ed6db83b24fa754f8be8036f262ed027c790850d74ea98a1c80644fd81aed2d18213ea2d3f20e86933dc272968d8644807ad383171374bb7d5d269302b144e222d6a31b670af06be9333113a23eb8835d4eade74ed9"),
      );
    });

    test('Token toJson', () {
      expect(
        Token(
                tokenType: "Bearer",
                expiresIn: 31536000,
                accessToken:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODhkOTg4NmIwZGMzNmMxMTc1NWVkYmE2MjU4OTFiYWRkOWE4MjhlOTZlYzRkYTEyOTE3ZmFiNDNlODA1MGJlZTE0NzkxNzI5ZjRiMTE4M2EiLCJpYXQiOjE2NTIwNzQ5MjcuNzYyNDI4LCJuYmYiOjE2NTIwNzQ5MjcuNzYyNDMzLCJleHAiOjE2ODM2MTA5MjcuNzQ0Mzc1LCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.n7PiT_A3FaYRwEjTrFAgb9pfR_HYl0Hl3x8v9v-uWvmED4-Wz64Xcu2HFw70tM0-mjqhTmcaw856I26dRg8j245G5effJADq4O5aviW9RO92r2OaKm3DI_YVaogezOavCl6sKTUtyQa2Bq1Yz14gfVQffmWpbtykAeef82wKHHTL4GvrpNkAbMYWO2sSOuydQT1qmEWpaX61-toNwHPMslH80q-TujatBMIhsqKRCqPdz7pk9wDXf3WwPHrNev83nU6z8gk00hiPa5h7aE8TKqc6LyhtoIeZkKcW8aTGVLRhWs6ywQVO6-rRzkX1SsFr6Vs6n_zt5poEBi2pD4fb9X0wl7dEJbYn1_kGoHuSy_Uywm_4fBgUjlGSDcvCwPD3n7Tqseahx_0oJo0DCDQUUP5xjo7iPx5u3ySVczl3mY2SQxUia_VKQHOMP99Xd4wlAzOiP8lcTYtSv1wV6YGXM7WmKEXL_usBqFc9FjZtIdHRwvKlPpM8bTz2JGFmledNCBOwY93OyXLDonzLIVjiWCyLTLnSGYmPa-mMODBcvT6ccF2GehXmaOygEEs8mNA_AoD3H4I4zuQJYKdxyIOsCB5FPY__nftQrq0UoJTR49ewhxnfMLkbvpnX2xqN05kSBHpBYPxd2pcyJhHP8rOb40MH9fk35Gh845mZx1xwzkY",
                refreshToken:
                    "def502008fe5947da41fbf4423e439fde4c925ed0864bc0d870595dc08bf8bd78df4b2954d86b282f9a0741dc4a6051cd446bcf2cdb50c6b9b3cbd672d1b7cd7b8a19c509c7317d0df7c131d63f33a195f894f17215fcfed4c34a57a71bd4b939c561ee14bfa173d7ad8d7439e44666ecbaa33e5f99a940cd64a7e4db068dbcc3ef812dcdb2d6ca4c2320cab23e638cabfdf89ee3244b2cfd7a46fb19402f6310238d64ba58a31fdd8aa924f8e82457abd93ded4257e4c001c4faae8f67ffd71903cc17f752f051bc5ac0fec910405b50805b2dec6667a2b8a0fa7337ed9e5537b4ef224c0732f889b66906a7c9b1ce63dc4d236c24cd7017c7abbdb13e3d87442616b4e6273ca71ee28a4727883afe150e54f6fa84fd4689df19ac035ef9f0950c03bca2ef05a290c8f1356a78ccf676c505c1ed6db83b24fa754f8be8036f262ed027c790850d74ea98a1c80644fd81aed2d18213ea2d3f20e86933dc272968d8644807ad383171374bb7d5d269302b144e222d6a31b670af06be9333113a23eb8835d4eade74ed9")
            .toJson(),
        <String, dynamic>{
          "token_type": "Bearer",
          "expires_in": 31536000,
          "access_token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODhkOTg4NmIwZGMzNmMxMTc1NWVkYmE2MjU4OTFiYWRkOWE4MjhlOTZlYzRkYTEyOTE3ZmFiNDNlODA1MGJlZTE0NzkxNzI5ZjRiMTE4M2EiLCJpYXQiOjE2NTIwNzQ5MjcuNzYyNDI4LCJuYmYiOjE2NTIwNzQ5MjcuNzYyNDMzLCJleHAiOjE2ODM2MTA5MjcuNzQ0Mzc1LCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.n7PiT_A3FaYRwEjTrFAgb9pfR_HYl0Hl3x8v9v-uWvmED4-Wz64Xcu2HFw70tM0-mjqhTmcaw856I26dRg8j245G5effJADq4O5aviW9RO92r2OaKm3DI_YVaogezOavCl6sKTUtyQa2Bq1Yz14gfVQffmWpbtykAeef82wKHHTL4GvrpNkAbMYWO2sSOuydQT1qmEWpaX61-toNwHPMslH80q-TujatBMIhsqKRCqPdz7pk9wDXf3WwPHrNev83nU6z8gk00hiPa5h7aE8TKqc6LyhtoIeZkKcW8aTGVLRhWs6ywQVO6-rRzkX1SsFr6Vs6n_zt5poEBi2pD4fb9X0wl7dEJbYn1_kGoHuSy_Uywm_4fBgUjlGSDcvCwPD3n7Tqseahx_0oJo0DCDQUUP5xjo7iPx5u3ySVczl3mY2SQxUia_VKQHOMP99Xd4wlAzOiP8lcTYtSv1wV6YGXM7WmKEXL_usBqFc9FjZtIdHRwvKlPpM8bTz2JGFmledNCBOwY93OyXLDonzLIVjiWCyLTLnSGYmPa-mMODBcvT6ccF2GehXmaOygEEs8mNA_AoD3H4I4zuQJYKdxyIOsCB5FPY__nftQrq0UoJTR49ewhxnfMLkbvpnX2xqN05kSBHpBYPxd2pcyJhHP8rOb40MH9fk35Gh845mZx1xwzkY",
          "refresh_token":
              "def502008fe5947da41fbf4423e439fde4c925ed0864bc0d870595dc08bf8bd78df4b2954d86b282f9a0741dc4a6051cd446bcf2cdb50c6b9b3cbd672d1b7cd7b8a19c509c7317d0df7c131d63f33a195f894f17215fcfed4c34a57a71bd4b939c561ee14bfa173d7ad8d7439e44666ecbaa33e5f99a940cd64a7e4db068dbcc3ef812dcdb2d6ca4c2320cab23e638cabfdf89ee3244b2cfd7a46fb19402f6310238d64ba58a31fdd8aa924f8e82457abd93ded4257e4c001c4faae8f67ffd71903cc17f752f051bc5ac0fec910405b50805b2dec6667a2b8a0fa7337ed9e5537b4ef224c0732f889b66906a7c9b1ce63dc4d236c24cd7017c7abbdb13e3d87442616b4e6273ca71ee28a4727883afe150e54f6fa84fd4689df19ac035ef9f0950c03bca2ef05a290c8f1356a78ccf676c505c1ed6db83b24fa754f8be8036f262ed027c790850d74ea98a1c80644fd81aed2d18213ea2d3f20e86933dc272968d8644807ad383171374bb7d5d269302b144e222d6a31b670af06be9333113a23eb8835d4eade74ed9"
        },
      );
    });
  });

  group('API Test', () {
    test('Get Token With Password', () async {
      var body =
          "{\"token_type\":\"Bearer\",\"expires_in\":31536000,\"access_token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2Y1ZTQ4Nzk4YWUwZWRkZWNhMzYwMWM3MDlmY2U2Zjg1ODI5MGMyNDkyNzRmZmJiNGUyZTQ3NzhhYWM3MGI3M2M5YmVmZjMxMDdiOTlkYmQiLCJpYXQiOjE2NTIyNTU5MDIuMDkyMjU5LCJuYmYiOjE2NTIyNTU5MDIuMDkyMjYyLCJleHAiOjE2ODM3OTE5MDIuMDc4NjAyLCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.qBi6iRhZH4v2uewPDEu2rfKZ0zi-pioQoML65giaMpomC5evLdeTBq_13A0N0HtyzICUbXBkiZoDGRl7K6IrY_QdvXIoO3mQlDDZ021W8heOf2t716BxmPtloQoMMzP_QUwiVYb6luJNwLYPvv187YY8Mibenpkvv_ssri2XKuibm2s4GsMRT3wcAG-okIIX82hu9Y5fiCPpnSGTEJF1qi5AdTb9g1iNUNrvWSxFhvV6vArDdhSEzf7Y0nVD8RIdI46imgPaP02FmS2KIFbfgDqC05jI_GWGdOhthw3Nlv5JAUD2OnNBquFxVoDValaUEFG_ayeQ9bXUqYuQpR8PSIpEFLYyOEm3yO_cL38QSYfzIdaQzDKzGCkqnc5dQE0Y6vzByLbRLVCOyd818eEojIerixyRqZGe9BIODVgfFcqKq1owlw3_qGvBJXmy4fZnpDzJY8deGvljkE60jvmmIids2dHMo_-0oe0NLaqb6jpR339e9NwSkbGQRelxBLXOAjCuDRZp_eFlGeanDZnTRLTcKbRVF8YGunryb5cgMtfCB76NmYDJLBFlICIS_wJ3bnsUhQIetoKToB6IekazIM3BJGfDbD_Hv8N-aukzOiixMX2dz9-4k1grExQKO60IEMFQ_5noaeC9nL0fLVcy4ZfLNVX55gmjsiITi-J8T6I\",\"refresh_token\":\"def5020058467fa82303ac481c1784b464dd8639f91a99ef2642739597c7ba0540e421bafcd61005b6787d0efc56b525bcc405840b85e2a94bf4e903c02661441ee7a08fe3f3c8b72a295bd623929faf7e0bb55491f591d2bd416526009113302d35ef4f05500f9fec94d35649496e4c316e127b9b4c018bd2ecd26c6dfe1c34628efbd7be729d707d5ff1832585715f155ff55dd6b2dca1bcd275a0cf05b3c01d5619153afefd5f46a9f28df6e86b9d3273dc42cb653560d597a4234a999f26d62b0f446e1ad3d4dee0677e448593929c9048411f2e85d8bbd3f34bb1aba47dad281dde17d9f83e5227e571549029975a43d3c77c599a421fbf53c72ebeb5a04b4a61432e722c5e83afdd4f766d2c7a6c8cceb2f699d93dc66686246249f266000125fc423c2c7a6db49bef576a615eea6c1098f006f21079b77724b48763d439f6bce2e3877f1351202a477a17bcbb89e58b0c8eed8b644dfcbb7c549eac68bdee1c69fe136711901c862451ec954eaa3b56b785c1ffec03f33ac333d706d76c523c1197a0ef4c22\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      var token = await API(baseUrl: _server.url).getTokenWithPassword(
          Credential(username: "987WJTzXrHmhJMg", password: "ZmJwTp9vbc0CvNJ"));

      expect(
        token,
        Token(
            tokenType: "Bearer",
            expiresIn: 31536000,
            accessToken:
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2Y1ZTQ4Nzk4YWUwZWRkZWNhMzYwMWM3MDlmY2U2Zjg1ODI5MGMyNDkyNzRmZmJiNGUyZTQ3NzhhYWM3MGI3M2M5YmVmZjMxMDdiOTlkYmQiLCJpYXQiOjE2NTIyNTU5MDIuMDkyMjU5LCJuYmYiOjE2NTIyNTU5MDIuMDkyMjYyLCJleHAiOjE2ODM3OTE5MDIuMDc4NjAyLCJzdWIiOiIwYzE0YmZhMC1jN2JlLTExZWMtYmZjZC1kZjdiMzQzYTI0MGIiLCJzY29wZXMiOlsiKiJdfQ.qBi6iRhZH4v2uewPDEu2rfKZ0zi-pioQoML65giaMpomC5evLdeTBq_13A0N0HtyzICUbXBkiZoDGRl7K6IrY_QdvXIoO3mQlDDZ021W8heOf2t716BxmPtloQoMMzP_QUwiVYb6luJNwLYPvv187YY8Mibenpkvv_ssri2XKuibm2s4GsMRT3wcAG-okIIX82hu9Y5fiCPpnSGTEJF1qi5AdTb9g1iNUNrvWSxFhvV6vArDdhSEzf7Y0nVD8RIdI46imgPaP02FmS2KIFbfgDqC05jI_GWGdOhthw3Nlv5JAUD2OnNBquFxVoDValaUEFG_ayeQ9bXUqYuQpR8PSIpEFLYyOEm3yO_cL38QSYfzIdaQzDKzGCkqnc5dQE0Y6vzByLbRLVCOyd818eEojIerixyRqZGe9BIODVgfFcqKq1owlw3_qGvBJXmy4fZnpDzJY8deGvljkE60jvmmIids2dHMo_-0oe0NLaqb6jpR339e9NwSkbGQRelxBLXOAjCuDRZp_eFlGeanDZnTRLTcKbRVF8YGunryb5cgMtfCB76NmYDJLBFlICIS_wJ3bnsUhQIetoKToB6IekazIM3BJGfDbD_Hv8N-aukzOiixMX2dz9-4k1grExQKO60IEMFQ_5noaeC9nL0fLVcy4ZfLNVX55gmjsiITi-J8T6I",
            refreshToken:
                "def5020058467fa82303ac481c1784b464dd8639f91a99ef2642739597c7ba0540e421bafcd61005b6787d0efc56b525bcc405840b85e2a94bf4e903c02661441ee7a08fe3f3c8b72a295bd623929faf7e0bb55491f591d2bd416526009113302d35ef4f05500f9fec94d35649496e4c316e127b9b4c018bd2ecd26c6dfe1c34628efbd7be729d707d5ff1832585715f155ff55dd6b2dca1bcd275a0cf05b3c01d5619153afefd5f46a9f28df6e86b9d3273dc42cb653560d597a4234a999f26d62b0f446e1ad3d4dee0677e448593929c9048411f2e85d8bbd3f34bb1aba47dad281dde17d9f83e5227e571549029975a43d3c77c599a421fbf53c72ebeb5a04b4a61432e722c5e83afdd4f766d2c7a6c8cceb2f699d93dc66686246249f266000125fc423c2c7a6db49bef576a615eea6c1098f006f21079b77724b48763d439f6bce2e3877f1351202a477a17bcbb89e58b0c8eed8b644dfcbb7c549eac68bdee1c69fe136711901c862451ec954eaa3b56b785c1ffec03f33ac333d706d76c523c1197a0ef4c22"),
      );

      final request = _server.takeRequest();
      expect(request.uri.path, '/token');
    });

    test('Get Room Name', () async {
      var body = "{\"success\": true,\"data\": \"サンプル部\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(await API(baseUrl: _server.url).getRoomName(), "サンプル部");

      final request = _server.takeRequest();
      expect(request.uri.path, '/getRoomName');
    });

    test('Get Room Name Error', () {
      var body =
          "<!doctype html><html lang=\"ja\"><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><!-- CSRF Token --><meta name=\"csrf-token\" content=\"nvZFlQLJF2lzXhVfGsapfEEV0DlsjSQESyC9RZp9\"><title>cacao</title><!-- Scripts --><script src=\"http://127.0.0.1:8000/js/app.js\" defer></script><!-- Fonts --><link rel=\"dns-prefetch\" href=\"//fonts.gstatic.com\"><link href=\"https://fonts.googleapis.com/css?family=Nunito\" rel=\"stylesheet\"><!-- Styles --><link href=\"http://127.0.0.1:8000/css/app.css\" rel=\"stylesheet\"><link href=\"http://127.0.0.1:8000/css/index.css\" rel=\"stylesheet\"><!-- Icons --><link rel=\"icon\" type=\"image/png\" href=\"http://127.0.0.1:8000/img/icon.png\"><link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"http://127.0.0.1:8000/img/icon.png\"></head><body><div id=\"app\"><header-component:is-logged-in=\"false\":csrf=\"&quot;nvZFlQLJF2lzXhVfGsapfEEV0DlsjSQESyC9RZp9&quot;\"></header-component><main class=\"py-4\"><div class=\"container text-gray-600 body-font px-5 py-24 mx-auto\"><form method=\"POST\" action=\"http://127.0.0.1:8000/login\"class=\"lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col m-auto w-full mt-10 md:mt-0\"><input type=\"hidden\" name=\"_token\" value=\"nvZFlQLJF2lzXhVfGsapfEEV0DlsjSQESyC9RZp9\"><h2 class=\"text-gray-900 text-lg font-medium title-font mb-5\">ログイン</h2><div class=\"relative mb-4\"><label for=\"login_id\" class=\"leading-7 text-sm text-gray-600\">ID</label><input type=\"text\" id=\"login_id\" name=\"login_id\"value=\"\" required autofocusclass=\" w-full bg-white rounded border border-gray-300 focus:border-pink-500 focus:ring-2 focus:ring-pink-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out\"></div><div class=\"relative mb-4\"><label for=\"password\" class=\"leading-7 text-sm text-gray-600\">パスワード</label><input type=\"password\" id=\"password\" name=\"password\"class=\" w-full bg-white rounded border border-gray-300 focus:border-pink-500 focus:ring-2 focus:ring-pink-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out\"></div><div class=\"block mt-2\"><label class=\"flex justify-start items-start\"><divclass=\"bg-white border rounded border-gray-300 w-5 h-5 flex flex-shrink-0 justify-center items-center mr-2\"><input type=\"checkbox\" class=\"opacity-0 absolute\" ><svg class=\"fill-current hidden w-3 h-3 text-themeColor pointer-events-none\"viewBox=\"0 0 20 20\"><path d=\"M0 11l2-2 5 5L18 3l2 2L7 18z\"/></svg></div><div class=\"select-none text-sm text-gray-700 tracking-wide\">ログイン情報を記憶する</div></label></div><button type=\"submit\"class=\"text-white bg-themeColor border-0 mt-10 py-2 px-8 focus:outline-none rounded text-lg\">ログイン</button></form></div></main></div></body></html>";
      var headers = new Map<String, String>();
      headers["content-type"] = "text/html; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(() => API(baseUrl: _server.url).getRoomName(),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Has Valid Token', () async {
      var body = "{\"success\": true,\"data\": \"サンプル部\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(await API(baseUrl: _server.url).hasValidAccessToken(), true);

      final request = _server.takeRequest();
      expect(request.uri.path, '/getRoomName');
    });

    test('Get Room Name From ID', () async {
      var body = "{\"success\": true,\"data\": \"サンプル部\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(
          await API(baseUrl: _server.url)
              .getRoomNameFromID("0b74a8d0-c7be-11ec-9623-2de4b879cf1e"),
          "サンプル部");

      final request = _server.takeRequest();
      expect(request.uri.path, '/getRoomNameFromID');
      expect(request.body,
          "{\"room_id\":\"0b74a8d0-c7be-11ec-9623-2de4b879cf1e\"}");
    });

    test('Get Room Name From ID Error', () {
      var body =
          "{\"success\":false,\"errors\":{\"room_id\":[\"room idは必ず指定してください。\"]}}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 400
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(
          () => API(baseUrl: _server.url)
              .getRoomNameFromID("0b74a8d0-c7be-11ec-9623-2de4b879cf1e"),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Get Student Status (In Room)', () async {
      var body =
          "{\"success\": true,\"data\": {\"active_room\": \"0c14bfa0-c7be-11ec-bfcd-df7b343a240b\",\"is_my_room\": true}}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(
          await API(baseUrl: _server.url).getStudentStatus("12345678"),
          StatusData(
              activeRoom: "0c14bfa0-c7be-11ec-bfcd-df7b343a240b",
              isMyRoom: true));

      final request = _server.takeRequest();
      expect(request.uri.path, '/status');
      expect(request.body, "{\"student_id\":\"12345678\"}");
    });

    test('Get Student Status (Not In Room)', () async {
      var body =
          "{\"success\": true,\"data\": {\"active_room\": null,\"is_my_room\": false}}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(await API(baseUrl: _server.url).getStudentStatus("12345678"),
          StatusData(activeRoom: null, isMyRoom: false));

      final request = _server.takeRequest();
      expect(request.uri.path, '/status');
      expect(request.body, "{\"student_id\":\"12345678\"}");
    });

    test('Get Student Status Error', () {
      var body =
          "{\"success\": false,\"errors\": {\"student_id\": [\"student idは必ず指定してください。\"]}}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 400
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(() => API(baseUrl: _server.url).getStudentStatus("12345678"),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Enter Room', () async {
      var body = "{\"success\": true}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      await API(baseUrl: _server.url).enterRoom("12345678", 36.5);

      final request = _server.takeRequest();
      expect(request.uri.path, '/enter');
      expect(
          request.body, "{\"student_id\":\"12345678\",\"body_temp\":\"36.5\"}");
    });

    test('Enter Room Error', () async {
      var body = "{\"success\": false,\"errors\":\"Bad request.\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 400
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(() => API(baseUrl: _server.url).enterRoom("12345678", 36.5),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Leave Room', () async {
      var body = "{\"success\": true}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 200
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      await API(baseUrl: _server.url).leaveRoom("12345678");

      final request = _server.takeRequest();
      expect(request.uri.path, '/leave');
      expect(request.body, "{\"student_id\":\"12345678\"}");
    });

    test('Leave Room Error', () async {
      var body = "{\"success\": false,\"errors\":\"Bad request.\"}";
      var headers = new Map<String, String>();
      headers["content-type"] = "application/json; charset=UTF-8";
      var mockResponse = new MockResponse()
        ..httpCode = 400
        ..body = body
        ..headers = headers;

      _server.enqueueResponse(mockResponse);

      expect(() => API(baseUrl: _server.url).leaveRoom("12345678"),
          throwsA(TypeMatcher<Exception>()));
    });
  });
}
