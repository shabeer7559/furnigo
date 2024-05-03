import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';

import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/features/homescreen/screen/notification.dart';
import 'package:furnigo/features/profile/screen/profile_page.dart';

import '../../../main.dart';
import '../../cart/screen/favorite.dart';

class bottomNavi extends StatefulWidget {
  const bottomNavi({super.key});

  @override
  State<bottomNavi> createState() => _bottomNaviState();
}

class _bottomNaviState extends State<bottomNavi> {
int selectedIndex=0;
List pages=[
  home(),
  favorite(),
  notification(),
  profile_page()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar:BottomBarDefault(
        iconSize: w*0.065,
        indexSelected: selectedIndex,
        onTap: (index) {
          selectedIndex=index!;
          setState(() {

          });
        },
          items: [
            TabItem(icon: Icons.home_outlined),
            TabItem(icon: Icons.bookmark_border_outlined),
            TabItem(icon: Icons.notifications_none),
            TabItem(icon: Icons.person_outline),
          ],
          backgroundColor: ColorConst.secondaryColor,
          color: ColorConst.grey,
          colorSelected: ColorConst.primaryColor
      ),
    );
  }
}
