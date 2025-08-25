import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

class EncryptService {
  final String _publicKeyPem = '''-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDllAEPNkAouxLkUWdzgdJHrG7X
E3uslq7tKqFuJCg7Enr1FC8wYt6Qjmd1/QBpCPWdVVHppflZXLZoKfCaoCcs7DHm
0G8KOmbAcokZs8a8XXJC3EOPrpIz60pxRfPNaE/1ZHw4ZfoTzxFiz4p81CS9Y7L8
v49N0Q88YP6rbu64AQIDAQAB
-----END PUBLIC KEY-----''';
  late final RSAPublicKey _publicKey;

  EncryptService() {
    _publicKey = parsePublicKeyFromPem(_publicKeyPem);
  }

  String encrypt(String data) {
    final encrypter = Encrypter(
      RSA(
        publicKey: _publicKey,
        encoding: RSAEncoding.PKCS1
      ),
    );
    return encrypter.encrypt(data).base64;
  }

  RSAPublicKey parsePublicKeyFromPem(String pem) {
    final parser = RSAKeyParser();
    return parser.parse(pem) as RSAPublicKey;
  }
}
