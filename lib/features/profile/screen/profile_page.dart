import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';

import '../../../main.dart';

class profile_page extends StatefulWidget {

  profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  List  orders=[
    {
      "text":"My orders",
      "text1":"Already have 10 orders"
    },
    {
      "text":"Shipping Addresses",
      "text1":"03 Addresses"
    },
    {
      "text":"Payment Method",
      "text1":"You have 2 cards"
    },
    {
      "text":"My reviews",
      "text1":"Reviews for 5 items"
    },
    {
      "text":"Setting",
      "text1":"Notification, Password, FAQ, Contact"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:Padding(
          padding: EdgeInsets.all(w*0.03),
          child: SvgPicture.asset(IconConst.searchIcon,width: w*0.04,height: h*0.04,),
        ),
     title: Text("Profile",
     style: TextStyle(
       fontFamily: 'Merriweather',
       fontWeight: FontWeight.w700
     ),),
        actions: [SvgPicture.asset(IconConst.logoutIcon,width: w*0.1,)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: h*0.23,
            width: w*1,
            child: Container(
              padding: EdgeInsets.only(right: w*0.2),
              width: w*0.04,
              height: h*0.08,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: w*0.12,
                    backgroundImage:AssetImage(ImageConst.person)
                  ),
                  SizedBox(width: w*0.03,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bruno Pham",
                        style: TextStyle(
                        fontFamily: "Nunito Sans",
                        fontWeight: FontWeight.w700
                      ),),
                      Text("bruno203@gmail.com")
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
             shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount:orders.length,
             itemBuilder: (BuildContext context, int index) {
               return Container(
                 width: w*0.9,
                 decoration: BoxDecoration(
                     color: ColorConst.whit,
                     boxShadow: [BoxShadow(color: Colors.grey,
                       blurRadius: w*0.05,
                     )]
                 ),
                 child: ListTile(
                     title: Text(orders[index]["text"],
                       style: TextStyle(fontWeight: FontWeight.w700),),
                     subtitle: Text(orders[index]["text1"]),
                     trailing:SvgPicture.asset(IconConst.arrowIcon)
                 ),
               );
             },

             separatorBuilder: (BuildContext context, int index) {
               return SizedBox(height: h*0.03,);
             },

                     ),
          ),
          
        ],
      ),
    );
  }
}
