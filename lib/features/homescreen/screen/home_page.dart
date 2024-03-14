import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';

import '../../../main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
            width: w*0.05,
            child: SvgPicture.asset(IconConst.searchIcon)),
        title: Column(
          children: [
            Text("Make home",
            style: TextStyle(color: ColorConst.grey),),
            Text("BEAUTIFUL"),
          ],
        ),
      ),
    );
  }
}
