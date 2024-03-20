import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool password=true;
  bool password1=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h*0.98,
          child: Padding(
            padding:  EdgeInsets.all(w*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Text("WELCOME",
                style: GoogleFonts.merriweather(
                  color: ColorConst.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.08,
                ),),
                Container(
                  height: h*0.7,
                  width: w*0.9,
                   margin: EdgeInsets.only(left: w*0.025),
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
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Your Name",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
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
                          suffixIcon: InkWell(
                            onTap: () {
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
                      TextFormField(
                        obscureText: password1?false:true,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              password1=!password1;
                              setState(() {

                              });
                            },
                              child: Icon(password1==true?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined)),
                          labelText: "ConfirmPassword",
                          hintText: "Confirm Your Password",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => bottomNavi(),));
                        },
                        child: Container(
                          height: h*0.06,
                          width: w*0.7,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: w*0.1,
                                    color: ColorConst.shadow
                                )
                              ],
                              color: ColorConst.primaryColor,
                              borderRadius: BorderRadius.circular(w*0.02)
                          ),
                          child: Center(
                            child: Text("SIGN UP",
                              style: TextStyle(
                                  color: ColorConst.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w*0.05
                              ),),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorConst.grey,
                            fontSize: w*0.035
                          ),),
                          Text("SIGN IN",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorConst.primaryColor,
                            fontSize: w*0.035
                          ),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
