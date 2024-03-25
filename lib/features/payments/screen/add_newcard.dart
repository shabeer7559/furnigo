import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';
import '../../constants/image_const.dart';

class addNewcard extends StatefulWidget {
  const addNewcard({super.key});

  @override
  State<addNewcard> createState() => _addNewcardState();
}

class _addNewcardState extends State<addNewcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w * 0.05),
          child: SvgPicture.asset(IconConst.backIcon),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Payment Method",
          style: GoogleFonts.merriweather(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: GestureFlipCard(
                  frontWidget: Container(
                    width: w * 0.9,
                    height: h * 0.25,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                              color: ColorConst.primaryColor.withOpacity(0.25))
                        ],
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(w * 0.04)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(ImageConst.mastercard),
                                width: w * 0.14,
                              ),
                              SizedBox(
                                width: w * 0.04,
                              ),
                              Image(
                                image: AssetImage(ImageConst.visa),
                                width: w * 0.14,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.07, top: w * 0.23),
                          child: Text(
                            "* * * *  * * * *  * * * *  XXXX",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontSize: w * 0.05),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.07, top: w * 0.33),
                          child: Text(
                            "Card Holder Name",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.07, top: w * 0.4),
                          child: Text(
                            "XXXXXX",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.55, top: w * 0.33),
                          child: Text(
                            "Expiry Date",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.55, top: w * 0.4),
                          child: Text(
                            "XX/XX",
                            style: TextStyle(
                                color: ColorConst.secondaryColor,
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backWidget: Container(
                    width: w * 0.9,
                    height: h * 0.25,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                              color: ColorConst.primaryColor.withOpacity(0.25))
                        ],
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(w * 0.04)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: w * 0.15,
                          left: w * 0.03,
                          child: Row(
                            children: [
                              Container(
                                width: w * 0.6,
                                height: h * 0.04,
                                color: ColorConst.secondaryColor,
                              ),
                              Text(
                                "314",
                                style:
                                    TextStyle(color: ColorConst.secondaryColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: w * 0.9,
                height: h * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: w * 0.9,
                      height: h * 0.08,
                      decoration: BoxDecoration(
                          color: ColorConst.grey.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(w * 0.02)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "CardHolder Name",
                            border: InputBorder.none,
                            constraints: BoxConstraints()),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Card Number",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConst.grey.withOpacity(0.15))),
                          constraints: BoxConstraints()),
                    ),
                    Container(
                      width: w * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: h * 0.08,
                            width: w * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                color: ColorConst.grey.withOpacity(0.25)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "CVV", border: InputBorder.none),
                            ),
                          ),
                          Container(
                            height: h * 0.08,
                            width: w * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                border: Border.all(
                                    color: ColorConst.grey.withOpacity(0.15))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Experation Date",
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: w * 0.9,
                height: h * 0.08,
                decoration: BoxDecoration(
                    color: ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(w * 0.02),
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.primaryColor.withOpacity(0.25),
                          offset: Offset(0, 4),
                          spreadRadius: 1,
                          blurRadius: 3)
                    ]),
                child: Center(
                    child: Text(
                  'ADD NEW CARD',
                  style: TextStyle(
                      color: ColorConst.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.045),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
