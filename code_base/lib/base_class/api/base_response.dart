// ignore_for_file: dangling_library_doc_comments

// {
//   "code": "0",
//   "message": "Success",
//   "data": {}
// }

import 'dart:convert';

class BaseResponse<T> {
  String? code;
  String? message;
  Map<String, dynamic> data = {};
  BaseResponse(this.code, this.message, this.data);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = code;
    data['message'] = message;
    data['data'] = json.encode(this.data);
    return data;
  }

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    message = json['message'];
    if (json['data'] != null) {
      if (jsonEncode(json['data']).startsWith("[")) {
        data = json;
      } else {
        data = json['data'];
      }
    }
  }
}
