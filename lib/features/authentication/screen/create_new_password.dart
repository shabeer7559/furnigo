import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool password=true;
  bool password1=true;
  bool remember=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp,color: ColorConst.primaryColor,)),
        title: Text("Create New Password",
          style: GoogleFonts.merriweather(
              fontSize: w*0.045,
              fontWeight: FontWeight.w700
          ),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: w*0.7,
            height: h*0.025,
            margin: EdgeInsets.only(left: w*0.07),
            child: Text("Create Your New Password",
              style: TextStyle(
                  fontSize: w*0.05,
                  fontWeight: FontWeight.w500
              ),),
          ),
          Container(
            height: h*0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.01)),
                      side: BorderSide(color:ColorConst.green ),
                      activeColor: Colors.green,
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember=value!;
                        });
                      },),
                    Text("Remember me",
                      style: TextStyle(
                          color: ColorConst.green,
                          fontSize: w*0.045,
                          fontWeight: FontWeight.w500
                      ),),


                  ],
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(),));
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
