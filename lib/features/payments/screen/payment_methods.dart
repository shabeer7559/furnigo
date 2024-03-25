import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/payments/screen/add_newcard.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../main.dart';

class paymentMethod extends StatefulWidget {
  const paymentMethod({super.key});

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  bool check = false;
  bool check1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => addNewcard(),));
            },
        child: Icon(CupertinoIcons.plus),backgroundColor: ColorConst.secondaryColor,
      ),

      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w * 0.05),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
              child: SvgPicture.asset(IconConst.backIcon)),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Payment Method",
          style: GoogleFonts.merriweather(),
        ),
      ),
      body: Container(
        height: h * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
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
                        left: w * 0.07,
                        top: w * 0.06,
                        child: Image(
                          image: AssetImage(ImageConst.mastercard),
                          width: w * 0.14,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.23),
                      child: Text(
                        "* * * *  * * * *  * * * *  3947",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.05),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.33),
                      child: Text(
                        "Card Holder Name",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.4),
                      child: Text(
                        "Jennyfer Doe",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.55, top: w * 0.33),
                      child: Text(
                        "Expiry Date",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.55, top: w * 0.4),
                      child: Text(
                        "05/23",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(w * 0.01),
                  ),
                  side: BorderSide(
                      color: ColorConst.primaryColor, width: w * 0.0037),
                  activeColor: ColorConst.primaryColor,
                  value: check,
                  onChanged: (value) {
                    setState(() {
                      check = value!;
                    });
                  },
                ),
                Text("Use as default payment method")
              ],
            ),
            Center(
              child: Container(
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
                    color: ColorConst.grey,
                    borderRadius: BorderRadius.circular(w * 0.04)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.06),
                      child: Image(
                        image: AssetImage(ImageConst.visa),
                        width: w * 0.14,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.23),
                      child: Text(
                        "* * * *  * * * *  * * * *  3947",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.05),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.33),
                      child: Text(
                        "Card Holder Name",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.07, top: w * 0.4),
                      child: Text(
                        "Jennyfer Doe",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.55, top: w * 0.33),
                      child: Text(
                        "Expiry Date",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.55, top: w * 0.4),
                      child: Text(
                        "05/23",
                        style: TextStyle(
                            color: ColorConst.secondaryColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(w * 0.01),
                  ),
                  side: BorderSide(
                      color: ColorConst.primaryColor, width: w * 0.0037),
                  activeColor: ColorConst.primaryColor,
                  value: check1,
                  onChanged: (value) {
                    setState(() {
                      check1 = value!;
                    });
                  },
                ),
                Text("Use as default payment method")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
