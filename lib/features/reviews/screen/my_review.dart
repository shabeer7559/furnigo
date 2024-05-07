import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/reviews/controller/controller.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import 'package:givestarreviews/givestarreviews.dart';

class MyReview extends ConsumerStatefulWidget {
  const MyReview({super.key});

  @override
  ConsumerState<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends ConsumerState<MyReview> {
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
        title: Text("My Reviews",
        style: GoogleFonts.merriweather(
          fontWeight: FontWeight.w700,
          fontSize: w*0.05,
          color: ColorConst.primaryColor
        ),),
      ),
      body: Column(
        children: [
          ref.watch(streamedReviewProvider(userDocId)).when(
              data: (data) {
                List userReviews=data.reviews;
                return  Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: h*0.32,
                          width: w*0.9,
                          margin: EdgeInsets.only(right: w*0.06,left: w*0.06),
                          decoration: BoxDecoration(
                              color: ColorConst.secondaryColor,
                              borderRadius: BorderRadius.circular(w*0.02),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 8),
                                    spreadRadius: w*0,
                                    color: ColorConst.shadow,
                                    blurRadius: w*0.03
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: h*0.13,
                                    width: w*0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.03),
                                        image: DecorationImage(image: NetworkImage(userReviews[index]["image"]),fit: BoxFit.fill)
                                    ),
                                  ),
                                  Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(userReviews[index]['name'],
                                        style: TextStyle(
                                            fontSize: w*0.045,
                                            fontWeight: FontWeight.w600,
                                            color: ColorConst.grey
                                        ),),
                                      Text(userReviews[index]["price"].toString(),
                                        style: TextStyle(
                                            fontSize: w*0.045,
                                            fontWeight: FontWeight.w800,
                                            color: ColorConst.primaryColor
                                        ),),
                                    ],
                                  ),
                                  SizedBox()
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  StarRating(
                                  value: userReviews[index]["rating"],
                                  ),
                                  Text(userReviews[index]["date"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: w*0.04,
                                        color: ColorConst.grey
                                    ),)
                                ],
                              ),
                              Container(
                                height: h*0.15,
                                width: w*0.8,
                                child: Center(
                                  child: Text(userReviews[index]["review"],
                                    style: TextStyle(
                                      fontSize: w*0.035,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: w*0.04,);
                      },
                      itemCount: userReviews.length),
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              }
          )

        ],
      ),
    );
  }
}
