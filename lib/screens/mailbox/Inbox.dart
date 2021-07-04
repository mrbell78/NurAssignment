
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/utils/Colors.dart';
import 'package:flutter_nur_assignment/utils/api-const.dart';
import 'package:flutter_nur_assignment/widget/CNetworkImage.dart';
import 'package:flutter_nur_assignment/widget/CustomButton.dart';
import 'package:flutter_nur_assignment/widget/GlassMorphismContainer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'inbox-controller.dart';

class Inbox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Provider.of<InboxController>(context, listen: false).getMessages();
    return Consumer<InboxController>(
      builder: (context,provider,child){
        return Scaffold(

          body: Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:[purpleBack, blueBack],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),
            ),

            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Column(

                        children: [
                          ClipRect(
                            child: BackdropFilter(

                              filter:ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                margin: EdgeInsets.only(left: 10, top: 10, right: 10,),

                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors:[Colors.white.withOpacity(0.10), Colors.white.withOpacity(0.15),]
                                  ),

                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:Container(
                                  margin: EdgeInsets.only( top: 7,left: 10 ),
                                  child: Row(
                                    children: [

                                      ClipOval(
                                        child: CNetworkImage(
                                          url: ApiConstant.BASE_URL,
                                          height: 38,
                                          width: 38,
                                          placeholderWidget: Center(
                                            child: Text(
                                                "${provider.responsemessages.hydraMember[index].from.name.substring(0, 1).toUpperCase()}"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5,),


                                      Text("${provider.responsemessages.hydraMember[index].subject}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )

                        ],
                      );
                    },
                    itemCount:provider.responsemessages?.hydraMember?.length??0,
                  ),
                )

              ],
            ),
          ),

        );
      },

    );

  }
}