import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold();
  }
}
