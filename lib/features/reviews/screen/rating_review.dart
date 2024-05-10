import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/reviews/controller/controller.dart';
import 'package:furnigo/models/review_model.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';
import '../../splash/screen/splash_screen.dart';

class rating extends ConsumerStatefulWidget {
  final String image;
  final String name;
  final int price;
 final String productId;
  final String categoryId;
  const rating(  {super.key, required this.image, required this.name,required this.productId,required this.categoryId,required this.price});

  @override
  ConsumerState<rating> createState() => _ratingState();
}

class _ratingState extends ConsumerState<rating> {
  TextEditingController reviewController=TextEditingController();
  int starRate=0;
  List reviews=[];
  userReviewAdding(){
    ref.watch(addingReviweControllsProvider).userReviewContro(id: userDocId, name: widget.name, image: widget.image, review: reviewController.text, date:DateTime.now().toString().substring(0,10) , rating: 1, price: widget.price);
  }
  addTotelReviews(){

    ref.watch(addingReviweControllsProvider).totelReviewContr(catId: widget.categoryId, proId: widget.productId, name: userName, image: userProfile, review: reviewController.text, date: DateTime.now().toString().substring(0,10), star: starRate);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.all(w*0.05),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(IconConst.arrowback)),
        ),
        title: Text("Rating & Review",style: GoogleFonts.gelasio(fontSize: w*0.055,fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          Container(
            height: h*0.18,
            width: w*1,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(w*0.04),
                  child: Container(
                    width: w*0.3,
                    height: h*0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,style: TextStyle(fontSize: w*0.05),),
                    Row(
                      children: [
                        SvgPicture.asset(IconConst.yellowStar,width: w*0.08,),
                        SizedBox(
                          width: w*0.02 ,
                        ),
                        Text("4.5",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.08
                        ),),
                      ],
                    ),
                    Text("10 reviews",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.055
                    ),)
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            indent: w*0.03,
            endIndent:w* 0.03,
          ),
          ref.watch(totelRevProvider(jsonEncode({
            "catId":widget.categoryId,

            "proId":widget.productId,
          }))).when(
              data: (data) {
                List reviewData=data.productReview;
                return  Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: w*1,
                        height: h*0.35,
                        child: Stack(
                            children: [
                              Center(
                                child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(w*0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(reviewData[index]["name"],style: TextStyle(
                                                  fontWeight: FontWeight.w700
                                              ),),
                                              Text(reviewData[index]["date"],style: TextStyle(
                                                  color: Colors.grey.shade500
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: w*0.03),
                                          child: StarRating(
                                            value: reviewData[index]["star"],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(w*0.03),
                                          child: Text(reviewData[index]["review"]),
                                        )
                                      ],
                                    ),
                                    height: h*0.26,
                                    width: w*0.9,
                                    decoration:BoxDecoration(
                                        color: ColorConst.secondaryColor,
                                        borderRadius: BorderRadius.circular(w*0.03),
                                        boxShadow: [
                                          BoxShadow(
                                              color:Colors.grey.shade200,
                                              blurRadius: 5,
                                              spreadRadius: 5,
                                              offset: Offset(0, 6)
                                          )
                                        ]
                                    )
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(
                                    top:w*0.04,
                                    left: w*0.43),
                                child: CircleAvatar(
                                  radius: w*0.07,
                                  backgroundImage: NetworkImage(reviewData[index]["image"].toString()),
                                ),
                              )
                            ]
                        ),

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox();
                    },
                    itemCount:reviewData.length,

                  ),
                ) ;
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              }),

        ],
      ),
      floatingActionButton:
      ref.watch(streamedReviewProvider(userDocId)).when(
          data: (data) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        elevation: 0,
                        content: Container(
                            width: w*1,
                            height: h*0.5,
                            padding: EdgeInsets.all(w*0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: w*0.07,
                                          backgroundImage: NetworkImage(data.image.toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.name,style: TextStyle(
                                            fontWeight: FontWeight.w700
                                        ),),
                                        Text(DateTime.now().toString().substring(0,10),style: TextStyle(
                                            color: Colors.grey.shade500
                                        ),)
                                      ],
                                    ),
                                    StarRating(
                                      onChanged: (index) {
                                        starRate=index;
                                      },
                                    ),
                                    TextFormField(
                                        controller: reviewController,
                                        keyboardType:TextInputType.multiline ,
                                        textInputAction: TextInputAction.newline,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                            fillColor: ColorConst.whit,
                                            filled: true,
                                            hintText: "Pleas enter your review",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(w*0.03)
                                            )
                                        )
                                    ),
                                    SizedBox(
                                      height: h*0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            child: Center(child: Text("Cancel",style: TextStyle(
                                                color: ColorConst.whit
                                            ),)),
                                            width: w*0.2,
                                            height: h*0.04,
                                            decoration: BoxDecoration(
                                                color: ColorConst.primaryColor,
                                                borderRadius: BorderRadius.circular(w*0.03)
                                            ),

                                          ),
                                        ),

                                        InkWell(
                                          onTap: () {
                                            userReviewAdding();

                                            addTotelReviews();
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Text("Submit",style: TextStyle(
                                                  color: ColorConst.whit
                                              ),),
                                            ),
                                            width: w*0.2,
                                            height: h*0.04,
                                            decoration: BoxDecoration(
                                                color: ColorConst.primaryColor,
                                                borderRadius: BorderRadius.circular(w*0.03)
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )

                        )
                    );
                  },);
              },
              child: Container(
                width: w*0.9,
                height: h*0.074,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(0, 6)
                      )
                    ],
                    borderRadius: BorderRadius.circular(w*0.03),
                    color: ColorConst.primaryColor
                ),
                child: Center(
                  child: Text("Write a review",style: TextStyle(
                      color: ColorConst.secondaryColor,fontSize: w*0.06
                  ),),
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return CircularProgressIndicator();
          }
      ),
    );
  }
}
