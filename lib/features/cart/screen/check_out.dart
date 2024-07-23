import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/cart/screen/cart.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/payments/screen/customWidget.dart';
import 'package:furnigo/features/shipping/screen/shipping_address.dart';
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
  void initState() {
    getAddress();
    // TODO: implement initState
    super.initState();
  }
  bool check=true;
  List address=[];
  Map<String,dynamic> userAddress={};
  Future<void> getAddress() async {
    DocumentSnapshot doc =await FirebaseFirestore.instance.collection("users").doc(userDocId).get();
    userAddress =doc.data() as Map<String,dynamic> ;
      address.add(userAddress["address"][0]);
      setState(() {

      });
  }
  bookingAdd(){
    ref.watch(addingCartControllerProvider).bookingRepo(BookingModel(
        cartModels: widget.cartModel,
        userName: userName,
        address: address,
        payment: "card Payment",
        orderAmount: widget.totel,
        deliveryCharge: 5,
        total: widget.totel+5,
        status: 0,
        time: DateTime.now().toString().substring(11,19),
        date: DateTime.now().toString().substring(0,10),
        id: ""));
  }
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => MyCart(),));
                },
                child: Icon(Icons.arrow_back_ios_sharp)),
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
              height: h*0.22,
              width: w*1,
              child: address.isEmpty?Center(child: InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => shippingAddress(),));
                },
                child: Text("Please Add Your Shipping Address",
                  style: TextStyle(
                  fontSize: w*0.04
                ),),
              )):
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustView(index: index, Address: address, check1: check);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: address.length),
            ),
            // Container(
            //   height: h*0.18,
            //   width: w*0.9,
            //   decoration: BoxDecoration(
            //     color: ColorConst.secondaryColor,
            //     boxShadow:[
            //       BoxShadow(
            //           color:Colors.grey.shade200,
            //           blurRadius: 5,
            //           spreadRadius: 5,
            //           offset: Offset(0, 6)
            //       )]),
            //   child: Padding(
            //     padding:  EdgeInsets.all(w*0.05),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("999999999",style: TextStyle(
            //           fontWeight: FontWeight.w700,
            //           fontSize: w*0.05
            //         ),),
            //         Divider(
            //           color:Colors.grey.shade100,
            //           height: w*0.1,
            //         ),
            //         Text("25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
            //         style: TextStyle(
            //           fontSize: w*0.035,
            //           color: ColorConst.grey
            //         ),)
            //       ],
            //     ),
            //   ),
            // ),
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
