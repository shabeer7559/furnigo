import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/authentication/screen/email_otp.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: h*0.4,
                      width: w*1,
                      child: Image.asset(ImageConst.lockpassword,fit: BoxFit.fill,),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(w*0.03),
                      child: Text("Enter the email details should we use to reset your password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.045,
                        color: ColorConst.grey
                      ),),
                    ),
                    Container(
                      height: h*0.07,
                      width: w*0.9,
                      decoration: BoxDecoration(
                          color: ColorConst.secondaryColor,
                          borderRadius: BorderRadius.circular(w*0.02),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: w*0.03,
                                color: ColorConst.shadow.withOpacity(0.25)
                            ),
                          ]
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: w*0.03),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.primaryColor
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: w*0.045,
                                color: ColorConst.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => EmailOtp(),));
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
                    child: Text("Continue",
                      style: TextStyle(
                          fontSize: w*0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.secondaryColor
                      ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
