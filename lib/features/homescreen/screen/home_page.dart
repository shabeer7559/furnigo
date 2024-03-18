import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List<Map<String,dynamic>>suggessions=[
    { "icon":IconConst.starIcon,
      "text":"Popular"
  },
    {
   "icon":IconConst.chairIcon,
      "text":"Chair"
    },
    {
   "icon":IconConst.tabeIcon,
      "text":"Table"
    },
    {
   "icon":IconConst.sofaIcon,
      "text":"Sofa"
    },
    {
   "icon":IconConst.bedIcon,
      "text":"Bed"
    },
  ];
  List items=[
    {"products":ImageConst.lamp,
      "name":"Black Simple Lamp",
      "price":"\$12"
    },
    {"products":ImageConst.minimalStand,
      "name":"Minimal Stand",
      "price":"\$25"
    },
    {"products":ImageConst.coffieChair,
      "name":"Coffie Chair",
      "price":"\$20"
    },
    {"products":ImageConst.simpleDesk,
      "name":"Simple Desk",
      "price":"\$50"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(w*0.05),
          child: SvgPicture.asset(IconConst.searchIcon,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Make home",
                style: GoogleFonts.gelasio(color: ColorConst.grey),),
                Text("BEAUTIFUL",
                  style:GoogleFonts.gelasio(color:ColorConst.primaryColor,) ,),
              ],
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(IconConst.cartIcon),
          SizedBox(
            width: w*0.05,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: w*1,
            height:h*0.15,
            color: Colors.grey,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: w*0.2,
                      height: w*0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: ColorConst.containerGrey
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(w*0.05),
                        child: SvgPicture.asset(suggessions[index]["icon"]),
                      ),
                    ),
                    Text(suggessions[index]["text"])
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: w*0.03,);
              },
              itemCount: suggessions.length,
            ),
          ),
          Container(
            height: h*0.45,
            width: w*0.5,
            color: Colors.red,
            child: Column(
               crossAxisAlignment:CrossAxisAlignment.start ,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h*0.35,
                  width: w*0.5,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                    image: DecorationImage(image: AssetImage(ImageConst.lamp))
                    
                  ) ,
                ),
                Text("Lamp"),
                Text("22")
              ],
            ),
            ),


        ],
      ),
    );
  }
}
