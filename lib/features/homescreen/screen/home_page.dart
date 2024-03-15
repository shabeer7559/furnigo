import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SvgPicture.asset(IconConst.searchIcon,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("Make home",
                style: GoogleFonts.gelasio(color: ColorConst.grey),),
                Text("BEAUTIFUL",
                  style:GoogleFonts.gelasio(color:ColorConst.primaryColor) ,),
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
            height:h*0.1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: w*0.25,
                      height: w*0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: ColorConst.containergrey
                      ),
                      child: Container(
                          width:w*0.05,
                          height:h*0.05,child: SvgPicture.asset(suggessions[index]["icon"])),
                    ),
                    Text(suggessions[index]["text"])
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
              },
              itemCount: suggessions.length,
            ),
          )
        ],
      ),
    );
  }
}
