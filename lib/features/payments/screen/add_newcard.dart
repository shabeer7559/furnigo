import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/payments/controller/controller.dart';
import 'package:furnigo/features/payments/screen/payment_methods.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:furnigo/models/cardModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';
import '../../constants/image_const.dart';

class addNewcard extends ConsumerStatefulWidget {
  const addNewcard({super.key});

  @override
  ConsumerState<addNewcard> createState() => _addNewcardState();
}

class _addNewcardState extends ConsumerState<addNewcard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  paymentAdding(){
ref.watch(paymentControllerPro).addingPaymentController(docId: userDocId, cardModels: CardModels(
    cdName: nameController.text,
    cdNumber: cardNumController.text,
    cdCvv: cvvController.text, cdDate: dateController.text));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w * 0.05),
          child: InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => paymentMethod(),));
            },
              child: SvgPicture.asset(IconConst.backIcon)),
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
                          padding: EdgeInsets.only(left: w*0.06,top: h*0.03),
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
                            cardNumController.text,
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
                            nameController.text,
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
                            dateController.text,
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
                                cvvController.text,
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
                       TextFormField(
                         onChanged: (value) {
                           setState(() {

                           });
                         },
                        controller: nameController,
                        decoration: InputDecoration(

                            hintText: "Card Holder Name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConst.grey.withOpacity(0.15)
                                )),
                            constraints: BoxConstraints()),
                      ),
                    TextFormField(
                      maxLength: 16,
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      controller: cardNumController,
                      decoration: InputDecoration(
                        counterText: "",
                          hintText: "Card Number",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConst.grey.withOpacity(0.15)
                              )),
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
                            border:Border.all(
                                color: ColorConst.primaryColor.withOpacity(0.6)) ),
                            child:TextFormField(
                              maxLength: 3,
                              onChanged: (value) {
                                setState(() {

                                });
                              },
                                controller: cvvController,
                                decoration:
                                InputDecoration(
                                  counterText: "",
                                    hintText: "CVV", border: InputBorder.none),
                              ),

                          ),
                          Container(
                            height: h * 0.08,
                            width: w * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                border: Border.all(
                                    color: ColorConst.primaryColor.withOpacity(0.6))),
                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: TextFormField(
                                maxLength: 5,
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  setState(() {

                                  });
                                },
                                controller: dateController,
                                decoration: InputDecoration(
                                  counterText:"",
                                    hintText: "Experation Date",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {

                  Navigator.push(context, CupertinoPageRoute(builder: (context) => paymentMethod(),));
                  paymentAdding();
                },
                child: Container(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
