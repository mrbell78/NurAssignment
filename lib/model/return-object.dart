import 'package:flutter/material.dart';

class ReturnObj<T> {
  bool success;
  String message;
  T data;



  ReturnObj({
    @required this.success,
    this.message,
    this.data,
  });

}