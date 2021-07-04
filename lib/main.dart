import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/screens/homepage/home-page-controller.dart';
import 'package:flutter_nur_assignment/screens/homepage/home-page.dart';
import 'package:flutter_nur_assignment/screens/login/Login.dart';
import 'package:flutter_nur_assignment/screens/login/loginController.dart';
import 'package:flutter_nur_assignment/screens/mailbox/inbox-controller.dart';
import 'package:flutter_nur_assignment/screens/signup/signup-controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'locator/locator.dart';
import 'screens/mailbox/Inbox.dart';

void main() async {

  await setupLocator();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageController()),
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => InboxController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
      ],

      child: MaterialApp(
        title: 'Raiseup',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:Login(),
      ),
    );
  }
}


