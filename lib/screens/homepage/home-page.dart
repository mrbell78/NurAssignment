
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/screens/homepage/home-page-controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageController>(context, listen: false).getDomain();

    return Consumer<HomePageController>(
      builder: (context,provider,child){
        return Scaffold(
          body: Column(
            children: [


            ],
          ),
        );
      },

    );
  }

}