import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';

import '../../main.dart';



class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     leading: SvgPicture.asset(IconConst.arrowleft),
        title:Text("Setting",style:
          TextStyle(fontWeight: FontWeight.w700,
          fontFamily: 'Merriweather'),) ,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text("Personal Information",style: TextStyle(
                 color: ColorConst.darkgrey,
                 fontWeight: FontWeight.w600,
                 fontSize: w*0.04

               ),),
              SvgPicture.asset(IconConst.editIcon)
            ],
          ),
          ListTile(
              title: Text("Name",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ColorConst.darkgrey
              ),),
            subtitle: Text("Bruno Pham",style:
              TextStyle(
                fontWeight: FontWeight.w600
              ),),
          )
        ],
      ),
    );
  }
}
