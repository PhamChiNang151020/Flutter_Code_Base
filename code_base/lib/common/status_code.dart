// ignore_for_file: constant_identifier_names

class StatusCode {
  static const int OK = 200;

  //* Client Error 4xx
  static const int BAD_REQUEST = 400;
  static const int UNAUTHENTICATED = 401;
  static const int NOT_FOUND = 404;

  //* Server Error 5xx
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
}
