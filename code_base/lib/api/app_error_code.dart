// ignore_for_file: constant_identifier_names, unused_local_variable

class AppErrorCode {
  static const String SOMETHING_WENT_WRONG = "-1";
  static const String SUCCESS = "0";
  static const String TOKEN_INVALID = "401";
  static const String SERVER_ERROR = "404";

  static const String INTERNET_NOT_CONNECTION = "02";
  static const String REQUEST_URL_EMPTY = "03";
  static const String CONNECTION_TIME_OUT = "04";

  //* API response code
  static const String EMAIL_IS_EXIST = "00001";

  static String getMessageError(String errorCode) {
    String message = "";
    switch (errorCode) {
      case AppErrorCode.EMAIL_IS_EXIST:
        message = "Email is already exist";
        break;
      case AppErrorCode.CONNECTION_TIME_OUT:
        message = "CONNECTION TIME OUT";
        break;
      case AppErrorCode.SERVER_ERROR:
        message = "Server error";
        break;
      case AppErrorCode.INTERNET_NOT_CONNECTION:
        message = "Please check your network connection and try again";
        break;
      default:
        message = "SOME THING WENT WRONG";
        break;
    }
    return message;
  }
}
