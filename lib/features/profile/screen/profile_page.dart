import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/authentication/screen/signup_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/orders/my_orders.dart';
import 'package:furnigo/features/payments/screen/payment_methods.dart';
import 'package:furnigo/features/reviews/screen/my_review.dart';
import 'package:furnigo/features/settings/settings.dart';
import 'package:furnigo/features/shipping/screen/shipping_address.dart';
import 'package:furnigo/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../../main.dart';
import '../../../main.dart';
import '../../../main.dart';
import '../../../main.dart';
import '../../splash/screen/splash_screen.dart';

class profile_page extends StatefulWidget {

  profile_page({super.key,});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  List orders = [
    {"text": "My orders", "text1": "Already have 10 orders","page":MyOrders()},
    {"text": "Shipping Addresses", "text1": "03 Addresses","page":shippingAddress()},
    {"text": "Payment Method", "text1": "You have 2 cards","page":paymentMethod()},
    {"text": "My reviews", "text1": "Reviews for 5 items","page":MyReview()},
    {"text": "Setting", "text1": "Notification, Password, FAQ, Contact","page":settings()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(w * 0.04),
          child: SvgPicture.asset(
            IconConst.searchIcon,color: ColorConst.primaryColor,
            width: w * 0.04,
            height: h * 0.04,
          ),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.merriweather(
               fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () async {
               SharedPreferences prefs=await SharedPreferences.getInstance();
               prefs.clear();
              Navigator.pushAndRemoveUntil(
                  context, CupertinoPageRoute(
                builder: (context) => LoginPage(),), (route) => false);
            },
            child: Padding(
              padding:  EdgeInsets.all(w*0.04),
              child: SvgPicture.asset(
                IconConst.logoutIcon,color: ColorConst.primaryColor,
                width: w * 0.1,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: w * 1,
            height: h * 0.1,
            margin: EdgeInsets.all(w*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: w * 0.12,
                    backgroundImage: NetworkImage(imgurl),),
                SizedBox(width: w*0.03,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName
                      ,
                      style: TextStyle(
                        fontSize: w*0.045,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(userId.toString(),
                    style: TextStyle(
                      color: ColorConst.grey
                    ),)
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => orders[index]["page"],));
                  },
                  child: Container(
                    width: w * 0.9,
                    height: h*0.11,
                    margin: EdgeInsets.only(left: w*0.02,right: w*0.02),
                    decoration: BoxDecoration(
                        color: ColorConst.whit, boxShadow: [
                      BoxShadow(
                        color: ColorConst.primaryColor.withOpacity(0.25),
                        blurRadius: 3,
                        spreadRadius: 1,

                        offset: Offset(0, 4),

                      )
                    ]),
                    child: ListTile(
                        title: Text(
                          orders[index]["text"],
                          style: TextStyle(
                            fontSize: w*0.045,
                              color: ColorConst.primaryColor,
                              fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(orders[index]["text1"],
                        style: TextStyle(
                          color: ColorConst.grey
                        ),),
                        trailing: SvgPicture.asset(IconConst.arrowIcon)),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: h * 0.03,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
