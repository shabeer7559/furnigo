
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/cart/controller/controller.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

import '../../splash/screen/splash_screen.dart';
import 'check_out.dart';

class MyCart extends ConsumerStatefulWidget {
  const MyCart({super.key});

  @override
  ConsumerState<MyCart> createState() => _MyCartState();
}

class _MyCartState extends ConsumerState<MyCart> {
  List cartData=[];
  List cartItems=[];
  dynamic sum=0;
    sumItems() {
      FirebaseFirestore.instance.collection("users").doc(userDocId).get().then((value) {
        cartItems=value["cartItems"];
      });

sum=0;
for(int i=0;i<cartItems.length;i++){
  var c=cartItems[i];
  sum=c["price"]*c["quantity"];
}
setState(() {

});
print(cartItems.toString());

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_sharp)),
        title: Text(
          "My cart",
          style: GoogleFonts.merriweather(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.05,
              color: ColorConst.primaryColor),
        ),
      ),
      floatingActionButton: Container(
        height: h * 0.2,
        width: w * 1,
        color: ColorConst.secondaryColor,
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.06, right: w * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your promo code",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.05,
                            color: ColorConst.grey),
                        constraints: BoxConstraints(
                          maxWidth: w * 0.6,
                          maxHeight: w * 0.1,
                        )),
                  ),
                  Container(
                    height: h * 0.055,
                    width: w * 0.13,
                    decoration: BoxDecoration(
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(w * 0.03)),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorConst.secondaryColor,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w700,
                        color: ColorConst.grey),
                  ),
                  Text(
                    "${sum.toString()}",
                    style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w700,
                        color: ColorConst.primaryColor),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => checkOut(),
                      ));
                },
                child: Container(
                  height: h * 0.08,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: w * 0.05,
                            color: ColorConst.shadow)
                      ],
                      borderRadius: BorderRadius.circular(w * 0.03)),
                  child: Center(
                    child: Text(
                      "Check Out",
                      style: TextStyle(
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.secondaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          ref.watch(cartStreamProvider(userDocId)).when(
            data: (data) {
               cartData = data.cartItems;
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        height: h * 0.2,
                        width: w * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: h * 0.18,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          cartData[index]["image"].toString()),
                                      fit: BoxFit.fill),
                                  borderRadius:
                                  BorderRadius.circular(w * 0.03)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  cartData[index]["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: w * 0.05,
                                      color: ColorConst.grey),
                                ),
                                Text(
                                  "\$  ${cartData[index]["price"] * cartData[index]["quantity"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: w * 0.05,
                                      color: ColorConst.primaryColor),
                                ),
                                Container(
                                  height: h * 0.045,
                                  width: w * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
sumItems();
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(userDocId)
                                              .get()
                                              .then((value) {
                                            List cart = value['cartItems'];

                                            cart[index]['quantity'] = cart[index]['quantity'] + 1;

                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(userDocId)
                                                .update({'cartItems': cart});
                                          });





                                          setState(() {


                                          });

                                        },
                                        child: Container(
                                          height: h * 0.045,
                                          width: w * 0.1,
                                          decoration: BoxDecoration(
                                              color: ColorConst.containerGrey,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  w * 0.03)),
                                          child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: ColorConst.primaryColor,
                                              )),
                                        ),
                                      ),
                                      Text(
                                        cartData[index]["quantity"].toString(),
                                        style: TextStyle(
                                            fontSize: w * 0.045,
                                            fontWeight: FontWeight.w700,
                                            color: ColorConst.primaryColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          sumItems();
                                          // cartItems[index]["qty"]<=0?0: cartItems[index]["qty"]--;
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(userDocId)
                                              .get()
                                              .then((value) {
                                            List cart = value['cartItems'];

                                            cart[index]['quantity'] =
                                                cart[index]['quantity'] == 1
                                                    ? 1
                                                    : cart[index]['quantity'] -
                                                        1;

                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(userDocId)
                                                .update({'cartItems': cart});
                                          });

                                       setState(() {

                                       });


                                        },
                                        child: Container(
                                          height: h * 0.045,
                                          width: w * 0.1,
                                          decoration: BoxDecoration(
                                              color: ColorConst.containerGrey,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  w * 0.03)),
                                          child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: ColorConst.primaryColor,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          content: Text(
                                              "Are you Sure You Want to remove this item ?"),
                                          actions: [
                                            CupertinoActionSheetAction(
                                                onPressed: () {
                                                  ref
                                                      .watch(
                                                      addingCartControllerProvider)
                                                      .deleteCartContro(
                                                      id: userDocId,
                                                      index: index,
                                                      cartData: cartData);

                                                  Navigator.pop(context);
                                                },
                                                child: Text("Yes")),
                                            CupertinoActionSheetAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No")),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: h * 0.06,
                                    width: w * 0.15,
                                    child: Padding(
                                      padding: EdgeInsets.all(w * 0.025),
                                      child:
                                      SvgPicture.asset(IconConst.closeIcon),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: h * 0.03,
                      );
                    },
                    itemCount: cartData.length),
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: h * 0.2,
          )
        ],
      ),
    );
  }
}
