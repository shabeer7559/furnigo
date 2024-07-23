import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:furnigo/features/payments/controller/controller.dart';
import 'package:furnigo/features/payments/screen/add_newcard.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../main.dart';

class paymentMethod extends ConsumerStatefulWidget {
  const paymentMethod({super.key});

  @override
  ConsumerState<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends ConsumerState<paymentMethod> {
  bool check = false;
  bool check1 = true;
  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      placeHolder: Lottie.asset(
          ImageConst.internetcheck,width: w*0.7
      ),
      internetConnectionText: "Please Check Your Internet Connection",
      child: Scaffold(
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
                Navigator.push(context, CupertinoPageRoute(builder: (context) => bottomNavi(),));
              },
                child: Icon(Icons.arrow_back_ios_sharp)),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Payment Method",
            style: GoogleFonts.merriweather(),
          ),
        ),
        body: Column(
          children: [
            ref.watch(cardStreamPro(userDocId)).when(
                data: (data) {
                 List carddData=data.payment;
                  return
                      Expanded(
                        child: carddData.isEmpty?Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Please Add Your Payment Method",
                                style: TextStyle(
                                    fontSize: w*0.04
                                ),),
                              Container(
                                height: h*0.5,
                                width: w*0.6,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(ImageConst.curvedarrow))
                                ),
                              )
                            ],
                          ),
                        ):ListView.separated(
                          shrinkWrap: true,
                            itemBuilder: (context, index) {
                          return Container(
                            height: h * 0.4,
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
                                                Padding(
                                                  padding:  EdgeInsets.only(
                                                    left: w*0.4
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return CupertinoAlertDialog(
                                                              content: Text("Are you sure Want to Remove this Card?"),
                                                              actions: [
                                                                CupertinoActionSheetAction(
                                                                    onPressed: () {
                                                                      ref.watch(paymentControllerPro).deleteCard(
                                                                          id: userDocId,
                                                                          carddData: carddData,index: index);
                                                                      Navigator.pop(context);
                                                                    }, child: Text("Yes")),
                                                                CupertinoActionSheetAction(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    }, child:Text("No"))
                                                              ],
                                                            );
                                                          },);

                                                    },
                                                    child: Icon(Icons.delete_outline,
                                                    color: Colors.white,),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: w * 0.07, top: w * 0.23),
                                            child: Text(
                                              carddData[index]["cdNumber"],
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
                                              carddData[index]["cdName"],
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
                                              carddData[index]["cdDate"],
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
                                                  carddData[index]["cdCvv"],
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

                              ],
                            ),
                          );
                        },
                            separatorBuilder: (context, index) {
                            return  SizedBox();
                            },
                            itemCount: carddData.length),
                      );
                }, error: (error, stackTrace) {
                  return Text(error.toString());
                }, loading: () {
                  return CircularProgressIndicator();
                },),

          ],
        ),
      ),
    );
  }
}
