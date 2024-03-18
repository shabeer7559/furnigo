import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/homescreen/screen/favorite.dart';
import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/features/homescreen/screen/notification.dart';

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


];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConst.primaryColor,
        unselectedItemColor: ColorConst.secondaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap:(value) {
          selectedIndex=value!;
          setState(() {
          });
        },
        items:[
          BottomNavigationBarItem(
            label: "",
              icon: SvgPicture.asset(IconConst.homeIcon)),
          BottomNavigationBarItem(
            label: "",
              icon: SvgPicture.asset(IconConst.savedIcon)),
          BottomNavigationBarItem(
            label: "",
              icon: SvgPicture.asset(IconConst.notifIcon)),
          BottomNavigationBarItem(
            label: "",
              icon: SvgPicture.asset(IconConst.profileIcon)),
        ],)
    );
  }
}
