import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/profile/screen/profile_page.dart';
import 'package:furnigo/features/profile/screen/settings.dart';
var h;
var w;
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap:  () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        home: settings(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
