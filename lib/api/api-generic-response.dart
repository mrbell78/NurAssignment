import 'package:flutter/cupertino.dart';

class ApiResponse<T> {
  int httpCode;
  String message;
  T data;

  ApiResponse({
    @required this.httpCode,
    this.message,
    this.data,
  });
}