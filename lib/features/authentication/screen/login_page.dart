import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnigo/features/authentication/screen/foget_password.dart';
import 'package:furnigo/features/authentication/screen/signup_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool password=true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            endIndent: w * 0.01,
                            indent: w * 0.03,
                          ),
                        ),
                      Image.asset(IconConst.sofa1Icon,width: w*0.17,),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            indent: w * 0.01,
                            endIndent: w * 0.07,
                          ),
                        ),
                      ],
                    ),
                   Text("Hello !",
                   style: GoogleFonts.merriweather(
                     fontSize:w*0.08,
                     color: ColorConst.grey,
                     fontWeight: FontWeight.w400
                   ),),
                   Text("WELCOME BACK",
                   style: GoogleFonts.merriweather(
                     fontSize:w*0.08,
                     color: ColorConst.primaryColor,
                     fontWeight: FontWeight.w400
                   ),),
                  ],
                ),
              ),
              Container(
                height: h*0.6,
                width: w*0.9,
                decoration: BoxDecoration(
                    color: ColorConst.secondaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.shadow,
                          offset: Offset(0, 7),
                          blurRadius: w*0.04
                      )]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your Email",
                        constraints: BoxConstraints(
                            maxWidth: w*0.8
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      obscureText: password?false:true,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(onTap: () {
                          password=!password;
                          setState(() {

                          });
                        },
                            child: Icon(password==true?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined)),
                        labelText: "Password",
                        hintText: "Enter Your Password",
                        constraints: BoxConstraints(
                            maxWidth: w*0.8
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ForgetPassword(),));
                      },
                      child: Text("Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.045
                        ),),
                    ),
                    InkWell(
                      onTap: () {

                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavi(),), (route) => false);
                      },
                      child: Container(
                        height: h*0.06,
                        width: w*0.7,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                  color: ColorConst.primaryColor.withOpacity(0.25)
                              )
                            ],
                            color: ColorConst.primaryColor,
                            borderRadius: BorderRadius.circular(w*0.02)
                        ),
                        child: Center(
                          child: Text("Log in",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.05
                            ),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      },
                      child: Text("SIGN UP",
                        style: TextStyle(
                            fontSize: w*0.06,
                            fontWeight: FontWeight.w600
                        ),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
