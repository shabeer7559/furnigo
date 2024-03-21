import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import 'package:givestarreviews/givestarreviews.dart';

class MyReview extends StatefulWidget {
  const MyReview({super.key});

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_sharp,color: ColorConst.primaryColor,),
        title: Center(
          child: Text("My Reviews",
          style: GoogleFonts.merriweather(
            fontWeight: FontWeight.w700,
            fontSize: w*0.05,
            color: ColorConst.primaryColor
          ),),
        ),
        actions: [
          SvgPicture.asset(IconConst.searchIcon,color: ColorConst.primaryColor,),
          SizedBox(width: w*0.02,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: h*0.35,
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
                                  image: DecorationImage(image: AssetImage(ImageConst.coffeetable),fit: BoxFit.fill)
                              ),
                            ),
                            Column(
            
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coffee Table",
                                  style: TextStyle(
                                      fontSize: w*0.045,
                                      fontWeight: FontWeight.w600,
                                      color: ColorConst.grey
                                  ),),
                                Text("\$50.00",
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
                            StarRating(onChanged: (rate) {

                            },),
                            Text("20/03/2020",
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
                            child: Text("Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price",
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
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
