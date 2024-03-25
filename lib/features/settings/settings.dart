import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool switch1=true;
  bool switch2=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_sharp,color: ColorConst.primaryColor,)),
        title: Text(
          "Setting",
          style: GoogleFonts.aBeeZee(
            fontSize: w*0.045   ,
              color: ColorConst.primaryColor,
              fontWeight: FontWeight.w700,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h*0.9,
          margin: EdgeInsets.only(left: w*0.04,right: w*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        color: ColorConst.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: w * 0.04),
                  ),
                  SvgPicture.asset(IconConst.editIcon)
                ],
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
                   ),
                 ]
               ),
               child: Padding(
                 padding:  EdgeInsets.only(left: w*0.03),
                 child: TextFormField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: ColorConst.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: w * 0.04),
                  ),
                  SvgPicture.asset(IconConst.editIcon),
                ],
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
                    obscureText: true,
                    style: TextStyle(
                        fontSize: w*0.045,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.primaryColor
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: w*0.045,
                          color: ColorConst.grey
                      ),
                    ),
                  ),
                ),
              ),
              Text("Notification",
              style:TextStyle(
                  color: ColorConst.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.04),),
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
                  padding:  EdgeInsets.only(right: w*0.02,left: w*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sales",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.045,
                        color: ColorConst.primaryColor
                      ),),
                      CupertinoSwitch(
                          value: switch1, onChanged: (value) {
                            switch1=value;
                            setState(() {

                            });
                          },)
                    ],
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
                  padding:  EdgeInsets.only(right: w*0.02,left: w*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Arrivals",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.045,
                        color: ColorConst.primaryColor
                      ),),
                      CupertinoSwitch(
                          value: switch2, onChanged: (value) {
                            switch2=value;
                            setState(() {

                            });
                          },)
                    ],
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
                  padding:  EdgeInsets.only(right: w*0.02,left: w*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Status Change ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.045,
                        color: ColorConst.primaryColor
                      ),),

                    ],
                  ),
                ),
              ),
              Text("Help Centre",
                style:TextStyle(
                    color: ColorConst.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.04),),
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
                  padding:  EdgeInsets.only(right: w*0.02,left: w*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("FAQ ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.045,
                            color: ColorConst.primaryColor
                        ),),
                      Icon(Icons.arrow_forward_ios_outlined,color: ColorConst.primaryColor,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
