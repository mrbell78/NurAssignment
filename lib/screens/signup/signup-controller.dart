
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-create-account.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';

class SignupController extends ChangeNotifier{

  var _apiService = locator<ApiService>();

  ResponseCreateAccount responseCreateAccount;


}