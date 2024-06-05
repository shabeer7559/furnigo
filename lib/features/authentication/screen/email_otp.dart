import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnigo/features/authentication/screen/create_new_password.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class EmailOtp extends StatefulWidget {
  final String email;
  const EmailOtp({super.key, required this.email});

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      placeHolder: Lottie.asset(
          ImageConst.internetcheck,width: w*0.7
      ),
      internetConnectionText: "Please Check Your Internet Connection",
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_sharp,color: ColorConst.primaryColor,)),
          title: Text("Forget Password",
            style: GoogleFonts.merriweather(
                fontSize: w*0.045,
                fontWeight: FontWeight.w700
            ),),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: h*0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h*0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h*0.35,
                        width: w*0.8,
                        margin: EdgeInsets.all(w*0.06),
                        child: Image.asset(ImageConst.security,fit: BoxFit.fill,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Code has been sent to ",style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.grey
                          ),),
                        ],
                      ),

                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => NewPassword(),));
                  },
                  child: Container(
                    height: h*0.08,
                    width: w*0.8,
                    decoration: BoxDecoration(
                        color: ColorConst.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 20,

                              color: ColorConst.primaryColor.withOpacity(0.25)
                          )
                        ],
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: Center(
                      child: Text("Verify",
                        style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.secondaryColor
                        ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
