import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';

class rating extends StatefulWidget {
  const rating({super.key});

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  List reviews=[
    {
    "image":ImageConst.bruno,
    "name":"Bruno Fernandes",
    "review":"Nice Furniture with good delivery. The delivery time is very fast."
  " Then products look like exactly the picture in the app."
  " Besides, color is also the same and quality is very good despite very cheap price"
  },
    {
    "image":ImageConst.amina,
    "name":"Kunjaamina",
    "review":"Nice Furniture with good delivery. The delivery time is very fast."
  " Then products look like exactly the picture in the app."
  " Besides, color is also the same and quality is very good despite very cheap price"
  },
    {
    "image":ImageConst.tracy,
    "name":"Tracy",
    "review":"Nice Furniture with good delivery. The delivery time is very fast."
  " Then products look like exactly the picture in the app."
  " Besides, color is also the same and quality is very good despite very cheap price"
  },
  ];
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
                      image: DecorationImage(image: AssetImage(ImageConst.minimalStand),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Minimal Stand",style: TextStyle(fontSize: w*0.05),),
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
        Expanded(
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
                                      Text(reviews[index]["name"],style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),),
                                      Text("20/02/2020",style: TextStyle(
                                          color: Colors.grey.shade500
                                      ),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: w*0.03),
                                  child: StarRating(
                                    onChanged: (index) {
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(w*0.03),
                                  child: Text(reviews[index]["review"]),
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
                          backgroundImage: AssetImage(reviews[index]["image"]),
                        ),
                      )
                    ]
                ),
          
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox();
            },
            itemCount: reviews.length,
          
          ),
        )
        ],
      ),
      floatingActionButton:
      Container(
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
  }
}
