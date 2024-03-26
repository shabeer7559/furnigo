import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: h*0.1,
              child: Center(
                child: Text("SUCCESS!",
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.08,
                  color: ColorConst.primaryColor
                ),),
              ),
            ),
         Container(
           height: h*0.3,
           width: w*1,
         margin: EdgeInsets.all(w*0.04),
         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage(ImageConst.success),fit: BoxFit.fill)
         ),
         ),
            Center(
              child: Container(
                height: h*0.07,
                width: w*0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImageConst.tickmark),fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.11),
              child: Container(
                height: h*0.1,
                width: w*0.8,
                child: Text("Your order will be delivered soon. Thank you for choosing our app!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: w*0.045,
                  color: ColorConst.grey
                ),),
              ),
            ),
            Container(
              height: h*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h*0.08,
                    width: w*0.8,
                   decoration: BoxDecoration(
                     color: ColorConst.primaryColor,
                       boxShadow: [
                         BoxShadow(
                             offset: Offset(0, 4),
                             blurRadius: 3,
                             spreadRadius: 1,
                             color: ColorConst.primaryColor.withOpacity(0.25)
                         )
                       ],
                     borderRadius: BorderRadius.circular(w*0.03)
                   ),
                    child: Center(
                      child: Text("Track your orders",
                      style: TextStyle(
                        fontSize: w*0.045,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.secondaryColor
                      ),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavi(),), (route) => false);
                      setState(() {

                      });
                    },
                    child: Container(
                      height: h*0.08,
                      width: w*0.8,
                     decoration: BoxDecoration(
                       border: Border.all(color: ColorConst.primaryColor),
                       borderRadius: BorderRadius.circular(w*0.03)
                     ),
                      child: Center(
                        child: Text("BACK TO HOME",
                        style: TextStyle(
                          fontSize: w*0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.primaryColor
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
