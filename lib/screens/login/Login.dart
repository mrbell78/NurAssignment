

import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/screens/login/loginController.dart';
import 'package:flutter_nur_assignment/screens/mailbox/Inbox.dart';
import 'package:flutter_nur_assignment/screens/signup/GMSignUpPage.dart';
import 'package:flutter_nur_assignment/utils/Colors.dart';
import 'package:flutter_nur_assignment/widget/CustomButton.dart';
import 'package:flutter_nur_assignment/widget/CustomSphere.dart';
import 'package:flutter_nur_assignment/widget/CustomTextField.dart';
import 'package:flutter_nur_assignment/widget/GlassMorphismContainer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginController>(context, listen: false);
    return Consumer<LoginController>(
      builder: (context,provider,child){
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    purpleBack,
                    blueBack,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -50,
                    top: Get.height * 0.1,
                    child: CustomSphere(
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Positioned(
                    right: -50,
                    bottom: Get.height * 0.075,
                    child: CustomSphere(
                      height: 225,
                      width: 225,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
                        child: GlassMorphismContainer(
                          height: 60.0,
                          width: 60.0,
                          borderRadius: 10.0,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GlassMorphismContainer(
                        height: Get.height * 0.65,
                        width: Get.width * 0.8,
                        child: Column(
                          children: [
                            Spacer(),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            CustomTextField(

                              hintText: "Email",
                              prefixIcon: Icons.email,
                              controller: provider.emailtextlogin,
                            ),
                            CustomTextField(

                                hintText: "Password",
                                prefixIcon: Icons.email,
                                controller: provider.passwordtextlogin,
                                suffixIcon: Icons.remove_red_eye,
                                onTap: () {}
                            ),

                            SizedBox(height: 10.0),
                            CustomButton(
                              buttonName: "Sign In",
                              paddingH: 35.0,
                              onPress: ()async{
                                await provider.login();
                                if(provider.gettoken.token!=null){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Inbox()));
                                }
                              },
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GMSignUpPage()));
                        },
                        child: GlassMorphismContainer(
                          height: 50.0,
                          width: Get.width * 0.8,
                          borderRadius: 10.0,
                          child: Center(
                            child: Text(
                              "Donot Have Account, CLICK HERE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }

}