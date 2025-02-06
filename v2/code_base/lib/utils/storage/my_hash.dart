// * flutter pub global activate encrypt
// * secure-random -> gen to _key
// * Use AES -> secure-random -l 16 (with 16 Bytes)
import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final _key = Key.fromUtf8('${dotenv.env['KEY_SECURITY']}');

final iv = IV.fromLength(16);

String encryptStringWithAES(String plainText) {
  try {
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  } catch (e) {
    throw e;
  }
}

String decryptStringWithAES(String encryptedText) {
  try {
    final encrypter = Encrypter(AES(_key));

    final decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  } catch (e) {
    throw e;
  }
}
