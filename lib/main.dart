import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/authentication/screen/signup_page.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:furnigo/features/homescreen/screen/check_in.dart';
import 'package:furnigo/features/homescreen/screen/cart.dart';
import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/features/homescreen/screen/product_details.dart';
import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
        theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
