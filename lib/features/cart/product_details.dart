import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnigo/features/cart/cart.dart';
import 'package:furnigo/features/cart/favorite.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/reviews/screen/rating_review.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: h*0.1,
        width: w*1,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             height: h*0.075,
             width: w*0.16,
            decoration: BoxDecoration(
              color: ColorConst.containerGrey,
              borderRadius: BorderRadius.circular(w*0.03)
            ),
             child: Padding(
               padding:  EdgeInsets.all(w*0.04),
               child: SvgPicture.asset(IconConst.savedIcon,color: ColorConst.primaryColor,),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, CupertinoPageRoute(builder: (context) => favorite(),));
             },
             child: Container(
               height: h*0.075,
               width: w*0.6,
               decoration: BoxDecoration(
                 color: ColorConst.primaryColor,
                 borderRadius: BorderRadius.circular(w*0.03),
                 boxShadow: [
                   BoxShadow(
                     offset: Offset(0, 10),
                     blurRadius: w*0.1,
                     color: ColorConst.shadow
                   )
                 ]
               ),
               child: Center(
                 child: Text("Add to cart",style: TextStyle(
                   fontSize: w*0.05,
                   fontWeight: FontWeight.w600,
                   color: ColorConst.secondaryColor
                 ),),
               ),
             ),
           )
         ],
       ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: h*0.5,
                width: w*1,
              ),
              Positioned(
                left: w*0.15,
                child: Container(
                  height: h*0.5,
                  width: w*0.85,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConst.minimalStand),fit: BoxFit.fill),
                      // color: Colors.green,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(w*0.1))
                  ),
                ),
              ),
              Positioned(
                right: w*0.8,
                top: w*0.15,
                child: Container(
                  height: h*0.05,
                    width: w*0.1,
                  decoration: BoxDecoration(
                    color: ColorConst.secondaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: w*0.2,
                        color: ColorConst.shadow
                      )
                    ],
                    borderRadius: BorderRadius.circular(w*0.02)
                  ),
                  child: Center(child: Icon(Icons.arrow_back_ios_sharp)),
                ),
              ),
              Positioned(
                right: w*0.78,
                top: w*0.4,
                child: Container(
                  height: h*0.19,
                  width: w*0.13,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: w*0.2,
                            color: ColorConst.shadow
                        )
                      ],
                    color: ColorConst.secondaryColor,
                    image:DecorationImage(image: AssetImage(ImageConst.frame)) ,
                    borderRadius: BorderRadius.circular(w*0.07)
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Padding(
              padding:  EdgeInsets.all(w*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Minimal Stand",style:
                    GoogleFonts.gelasio(
                      fontSize: w*0.06,
                      fontWeight: FontWeight.w500,
                      color: ColorConst.primaryColor,
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ 50",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.06
                      ),),
                      Container(
                        height: h*0.045,
                          width: w*0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              count++;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: h*0.04,
                              width: w*0.1,
                              child: Center(child: Icon(Icons.add)),
                              decoration: BoxDecoration(
                                color: ColorConst.containerGrey,
                                borderRadius: BorderRadius.circular(w*0.03)
                              ),
                            ),
                          ),
                          Text(count.toString(),
                          style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.primaryColor
                          ),),
                          InkWell(
                            onTap: () {
                              count<=0?0:count--;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: h*0.04,
                              width: w*0.1,
                              child: Center(child: Icon(Icons.remove)),
                              decoration: BoxDecoration(
                                color: ColorConst.containerGrey,
                                borderRadius: BorderRadius.circular(w*0.03)
                              ),
                            ),
                          ),
                        ],
                      ),
                      )
                    ],
                  ),
                  Container(
                    width: w*0.5,
                    margin: EdgeInsets.only(bottom: w*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(
                         height: h*0.03,
                           width: w*0.06,
                         child: SvgPicture.asset(IconConst.yellowStar,fit: BoxFit.fill,),
                       ),
                        SizedBox(),
                        Text("4.5",style:
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w*0.045,
                            color: ColorConst.primaryColor
                          ),),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => rating(),));
                          },
                          child: Text("(50 reviews)",style:
                            TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w*0.045,
                              color: ColorConst.grey
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Text("Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: w*0.045,
                    color: ColorConst.grey
                  ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
