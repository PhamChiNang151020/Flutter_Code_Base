// ignore_for_file: constant_identifier_names

class AppConfigUrl {
  static const HOST = DEV;

  //* HOST_NAME
  static const HOST_NAME = HOST == DEV
      ? "DEV - $VERSION"
      : HOST == QAT
          ? "QAT - $VERSION"
          : HOST == UAT
              ? "UAT - $VERSION"
              : "";

  //* BASE URL
  static const BASE_URL = "$HOST/";
  //* ENV
  static const DEV = 'https://code_base_dev';
  static const QAT = 'https://code_base_qat';
  static const UAT = 'https://code_base_uat';
  static const PROD = 'https://code_base_prod';

  // * ===== VERSION =====
  static const VERSION = "0.1.0";

  //? LIST URL API

  // * ===== REGISTER | LOGIN =====
  static const SIGN_UP = "auth/signup";
  static const LOGIN = "auth/login";
}
