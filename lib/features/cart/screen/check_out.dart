import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:furnigo/models/booking_model.dart';
import 'package:furnigo/models/cartModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';
import '../controller/controller.dart';



class checkOut extends ConsumerStatefulWidget {
  final List cartModel;
  final int totel;
  const checkOut( {super.key,required this.cartModel,required this.totel});

  @override
  ConsumerState<checkOut> createState() => _checkOutState();
}

class _checkOutState extends ConsumerState<checkOut> {
  int delivery=5;
  @override
  Widget build(BuildContext context) {
    bookingAdd(){
      ref.watch(addingCartControllerProvider).bookingRepo(BookingModel(
          cartModels: widget.cartModel,
          userName: userName,
          address: "shabeer,konnakkattil house malappuram kerala ",
          payment: "card Payment",
          orderAmount: widget.totel,
          deliveryCharge: 5,
          total: widget.totel+5,
          status: 0,
          time: DateTime.now().toString().substring(11,19),
          date: DateTime.now().toString().substring(0,10),
          id: ""));
    }
    return InternetChecker(
      placeHolder: Lottie.asset(
          ImageConst.internetcheck,width: w*0.7
      ),
      internetConnectionText: "Please Check Your Internet Connection",
      child: Scaffold(
        appBar:  AppBar(
          centerTitle: true,
          leading: Padding(
            padding:  EdgeInsets.all(w*0.05),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(IconConst.arrowback)),
          ),
          title:
              Text("Check out",style: GoogleFonts.merriweather(
                fontSize: w*0.045,
                fontWeight: FontWeight.w700,
                color: ColorConst.primaryColor

              ),),
        ),
        body: Column(
          children: [Padding(
            padding:  EdgeInsets.all(w*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Address",style: TextStyle(
                  color: ColorConst.grey,
                  fontSize: w*0.04
                ),),
                SvgPicture.asset(IconConst.editIcon,
                  width: w*0.04,
                  color: ColorConst.primaryColor,)
              ],
            ),
          ),
            Container(
              height: h*0.18,
              width: w*0.9,
              decoration: BoxDecoration(
                color: ColorConst.secondaryColor,
                boxShadow:[
                  BoxShadow(
                      color:Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0, 6)
                  )]),
              child: Padding(
                padding:  EdgeInsets.all(w*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bruno Fernandes",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: w*0.05
                    ),),
                    Divider(
                      color:Colors.grey.shade100,
                      height: w*0.1,
                    ),
                    Text("25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
                    style: TextStyle(
                      fontSize: w*0.035,
                      color: ColorConst.grey
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment",style: TextStyle(
                      color: ColorConst.grey,
                      fontSize: w*0.04
                  ),),
                  SvgPicture.asset(IconConst.editIcon,
                    width: w*0.04,
                    color: ColorConst.primaryColor,)
                ],
              ),
            ),
            Container(
              height: h*0.08,
              width: w*0.9,
              decoration: BoxDecoration(
                color: ColorConst.secondaryColor,
                boxShadow: [
                  BoxShadow(
                      color:Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0, 6)
                  )]
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(w*0.05),
                    child: Image.asset(ImageConst.masterCard),
                  ),
                  Text("**** **** **** "),
                  Text("3944 "),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery method",style: TextStyle(
                      color: ColorConst.grey,
                      fontSize: w*0.04
                  ),),
                  SvgPicture.asset(IconConst.editIcon,
                    width: w*0.04,
                    color: ColorConst.primaryColor,)
                ],
              ),
            ),
            Container(
              height: h*0.08,
              width: w*0.9,
              decoration: BoxDecoration(
                  color: ColorConst.secondaryColor,
                  boxShadow: [
                    BoxShadow(
                        color:Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 6)
                    )]
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(w*0.05),
                    child: Image.asset(ImageConst.dhl),
                  ),
                  Text("Fast "),
                  Text("(2-3days) "),
                ],),),
            Container(
              margin: EdgeInsets.all(w*0.03),
              height: h*0.18,
              width: w*0.9,
              decoration: BoxDecoration(
                  color: ColorConst.secondaryColor,
                  boxShadow:[
                    BoxShadow(
                        color:Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 6)
                    )]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(w*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order:",style: TextStyle(
                          color: ColorConst.grey,
                          fontSize: w*0.045
                        ),),
                        Text("${widget.totel}",
                        style: TextStyle(
                            fontSize: w*0.045
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(w*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery:",style: TextStyle(
                          color: ColorConst.grey,
                          fontSize: w*0.045
                        ),),
                        Text("${delivery}",
                        style: TextStyle(
                            fontSize: w*0.045
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(w*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total:",style: TextStyle(
                          color: ColorConst.grey,
                          fontSize: w*0.045
                        ),),
                        Text("${widget.totel+delivery}",
                        style: TextStyle(
                            fontSize: w*0.045
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {

                bookingAdd();
                Navigator.push(context, CupertinoPageRoute(builder: (context) => Success(),));
              },
              child: Container(
                height: h*0.08,
                width: w*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  color: ColorConst.primaryColor
                ),
                child: Center(
                  child: Text("SUBMIT ORDER",
                  style: TextStyle(
                    color: ColorConst.secondaryColor,
                    fontSize: w*0.05
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
