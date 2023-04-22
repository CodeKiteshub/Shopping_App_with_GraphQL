import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( body : SingleChildScrollView(
        child: Column(
          children: [
      Stack(children: [
   variables.attributeimg == "" ? Container()  : Container(
                constraints: BoxConstraints(minHeight: 
   MediaQuery.of(context).size.height * 0.6,
                minWidth: MediaQuery.of(context).size.width,
                ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                   image: DecorationImage(image: NetworkImage(variables.attributeimg),
                   fit: BoxFit.fill)
                  ),
                ),
          Positioned(
right: 20,
            top: 70,
            child: Image.network(
                              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/share.png")
                          .onInkTap(() {
                   //    Share.share(apiClients.user!.user.digitalProfile!.profileUrl,
                      //  );
                      }),
          )
      ],)   ,
            15.heightBox,
           Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(variables.attributename,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'dmsans',
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),),
                      10.heightBox,
                         Container(width: MediaQuery.of(context).size.width ,
                           child: Text(variables.attributenote,
                                               style: TextStyle(
                                                 fontSize: 12,
                                                 fontFamily: 'dmsans',
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.w400
                                               ),),
                         ),
                    ],).marginAll(20)
      
          ],
        )
      
      )
          
          
          
          .box
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .width(double.infinity)
          .make(),

    );
  }
}