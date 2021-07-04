import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/utils/Colors.dart';
import 'package:flutter_nur_assignment/widget/CustomButton.dart';
import 'package:flutter_nur_assignment/widget/CustomSphere.dart';
import 'package:flutter_nur_assignment/widget/CustomTextField.dart';
import 'package:flutter_nur_assignment/widget/GlassMorphismContainer.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'signup-controller.dart';

class GMSignUpPage extends StatelessWidget {

  // final SignUpController controllerName = Get.find(); This will find the instace of
  // That getx controller
  @override
  Widget build(BuildContext context) {
    Provider.of<SignupController>(context, listen: false);
    return Consumer<SignupController>(
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
                      Row(
                        children: [
                          SizedBox(width: Get.width * 0.075),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: GlassMorphismContainer(
                              height: 60.0,
                              width: 60.0,
                              borderRadius: 10.0,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          GlassMorphismContainer(
                            height: 60.0,
                            width: 60.0,
                            borderRadius: 10.0,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.075),
                        ],
                      ),
                      GlassMorphismContainer(
                        height: Get.height * 0.65,
                        width: Get.width * 0.8,

                        child: Column(
                          children: [
                            Spacer(),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Spacer(),
                            CustomTextField(

                              hintText: "Name",
                              prefixIcon: Icons.person,
                            ),
                            CustomTextField(
                              controller: provider.emailtext,
                              hintText: "ex: someone@solarunited.net",
                              prefixIcon: Icons.email,

                            ),
                            CustomTextField(
                              hintText: "Password",
                              prefixIcon: Icons.email,
                              controller: provider.passwordtext,
                              suffixIcon: Icons.remove_red_eye,
                              onTap: () {},
                            ),
                            SizedBox(height: 10.0),
                            CustomButton(
                              buttonName: "Sign In",
                              paddingH: 35.0,
                              onPress: ()async{
                                await provider.createAccount();
                                print("account created");
                                Navigator.pop(context);



                              },
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Text(
                        "By Signing Up, you are accepting our terms and conditions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
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
