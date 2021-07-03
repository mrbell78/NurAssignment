
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
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.domain),
                          title: Text("${provider.responseDomainlist.hydraMember[index].domain}"),
                        ),
                      ),

                    );
                  })

            ],
          ),
        );
      },

    );
  }

}