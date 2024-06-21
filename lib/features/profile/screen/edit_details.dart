import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/features/profile/screen/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../splash/screen/splash_screen.dart';

class Edit_details extends StatefulWidget {
  const Edit_details({super.key});

  @override
  State<Edit_details> createState() => _Edit_detailsState();
}

class _Edit_detailsState extends State<Edit_details> {
  TextEditingController nameControoler=TextEditingController();
  TextEditingController emailControoler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white
      ),
      body: Column(
        children: [
          Container(
            height: h*0.25,
          margin: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Update Information"),
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
                            color: ColorConst.shadow
                        ),
                      ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: w*0.03),
                    child: TextFormField(
                      controller: nameControoler,
                      style: TextStyle(
                          fontSize: w*0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.primaryColor
                      ),

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Name",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w*0.045,
                            color: ColorConst.grey
                        ),
                      ),
                    ),
                  ),
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
                            color: ColorConst.shadow
                        )
                      ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: w*0.03),
                    child: TextFormField(
                      controller: emailControoler,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: ()  async {
                  FirebaseFirestore.instance.collection("users").doc(userDocId).update(
                   {
                     "name":nameControoler.text,
                     "email":emailControoler.text
                   }
                  );
                  SharedPreferences prefs=await SharedPreferences.getInstance();
                  prefs.clear();
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailControoler.text, password: userPass);
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(),)).then((value) async {
                    SharedPreferences prefs=await SharedPreferences.getInstance();
                    prefs.setString("name", nameControoler.text.toString());
                    prefs.setString("email", emailControoler.text.toString());
                  });
                },
                child: Container(
                  height: h*0.06,
                  width: w*0.3,
                  decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.03),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: w*0.1,
                            color: ColorConst.shadow
                        )
                      ]
                  ),
                  child: Center(
                    child: Text("Update ",style: TextStyle(
                        fontSize: w*0.05,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.secondaryColor
                    ),),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => profile_page(),));
                },
                child: Container(
                  height: h*0.06,
                  width: w*0.3,
                  decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.03),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: w*0.1,
                            color: ColorConst.shadow
                        )
                      ]
                  ),
                  child: Center(
                    child: Text("Cancel",style: TextStyle(
                        fontSize: w*0.05,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.secondaryColor
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
