import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
// String userId='';
String userName='';
String userEmail='';
String userProfile="";
String userDocId='';
String userPass='';
class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login = false;
  getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getBool("login") ?? false;
    userEmail= prefs.getString("email")??"";
    userName = prefs.getString("name")??"";
    userDocId = prefs.getString("id")??"";
    userProfile =  prefs.getString("image")??"https://cdn.vectorstock.com/i/1000v/51/05/male-profile-avatar-with-brown-hair-vector-12055105.jpg";
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(
            builder: (context) =>
            login==false?LoginPage() : bottomNavi()), (route) => false) );
  }
  void initState() {
    getLoggedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      placeHolder: Lottie.asset(
          ImageConst.internetcheck,width: w*0.7
      ),
      internetConnectionText: "Please Check Your Internet Connection",
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 1,
                  width: w * 1,
                  child: Image.asset(
                    ImageConst.sofa,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: w * 0.4,
                  left: w * 0.1,
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "MAKE YOUR",
                                style: GoogleFonts.gelasio(
                                    color: ColorConst.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: w * 0.08),
                              ),
                              Text(
                                "HOME BEAUTIFUL",
                                style: GoogleFonts.gelasio(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: w * 0.08),
                              ),
                              Text(
                                "The best simple place where you discover most wonderful furnitures and make your home beautiful",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: ColorConst.grey,
                                    fontSize: w * 0.05),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.75,
                  left: w * 0.25,
                  child: InkWell(
                    onTap: () {
                      getLoggedIn();

                    },
                    child: Container(
                      height: h * 0.06,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                          color: ColorConst.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: w * 0.1,
                                color: ColorConst.shadow)
                          ],
                          borderRadius: BorderRadius.circular(w * 0.02)),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.gelasio(
                              color: ColorConst.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.06),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}