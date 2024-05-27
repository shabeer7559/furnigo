import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/cart/screen/cart.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/controller/controller.dart';
import 'package:furnigo/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../../models/favourite_model.dart';
import '../../cart/screen/product_details.dart';
import '../../splash/screen/splash_screen.dart';

UserModel? currentUserModel;
class home extends ConsumerStatefulWidget {
  const home({super.key});

  @override
  ConsumerState<home> createState() => _homeState();
}

class _homeState extends ConsumerState<home> {
  int selectedIndex=0;
  String docId="4zTSJ96StUheNnvi1UPH";
  List bookMark=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: SvgPicture.asset(IconConst.searchIcon,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Make home",
                style: GoogleFonts.gelasio(color: ColorConst.grey),),
                Text("BEAUTIFUL",
                  style:GoogleFonts.gelasio(color:ColorConst.primaryColor,) ,),
              ],
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => MyCart(),));
            },
              child: SvgPicture.asset(IconConst.cartIcon)),
          SizedBox(
            width: w*0.05,
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            ref.watch(streamCategoryProvider).when(
                data: (data) {

                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Column(
                        //   children: [
                        //     Container(
                        //       width: w*0.18,
                        //       height: w*0.18,
                        //       decoration: BoxDecoration(
                        //         borderRadius:  BorderRadius.circular(w*0.04),
                        //         // image: DecorationImage(image: AssetImage(IconConst.bookingIcon),fit: BoxFit.fill)
                        //       ),
                        //     ),
                        //     Text("All Products",style: TextStyle(color: Colors.grey),)
                        //   ],
                        // ),
                        Container(
                          width: w*1,
                          height:h*0.15,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      selectedIndex=index;
                                      docId=data[index].id;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      width: w*0.18,
                                      height: w*0.18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(w*0.04),
                                          image: DecorationImage(image: NetworkImage(data[index].image.toString()),fit: BoxFit.fill,),
                                          color:selectedIndex==index?ColorConst.primaryColor: ColorConst.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  Text(data[index].category,style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ColorConst.grey,
                                      fontSize: w*0.04
                                  ),)
                                ],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(width: w*0.03,);
                            },
                            itemCount: data.length,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },),
            ref.watch(streamProductsProvider(docId)).when(
                data: (data) {
                  return   Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: w * 0.03,
                          mainAxisSpacing: w* 0.03,
                          childAspectRatio: 0.7,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,   CupertinoPageRoute(builder: (context) => ProductDetails(
                                data[index].image.toString(),
                                data[index].name,
                                data[index].price,
                                data[index].review,
                                data[index].quantity,
                                 docId,
                              data[index].id
                            )));
                          },
                          child: Container(
                            width: w*0.5,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                    children: [
                                      Container(
                                        height: h*0.25,
                                        width: w*0.45,
                                        decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(w*0.03),
                                            image: DecorationImage(image: NetworkImage(data[index].image.toString()),fit: BoxFit.fill)

                                        ) ,
                                      ),
                                      Positioned(
                                        left: w*0.34,
                                        bottom: w*0.05,
                                        child: InkWell(
                                          onTap:  () {
                                            if (bookMark.contains(index)){
                                              // bookMark.remove(index);
                                            }else{
                                              bookMark.add(index);
                                              
                                              print("---------------------------------------------------------");
                                              ref.watch(homeScreenPro).favoriteAdd(userDocId, data[index].name, data[index].image, data[index].price);
                                            }
                                            setState(() {

                                            });
                                          },
                                          child: SvgPicture.asset(bookMark.contains(index)?IconConst.blackcartIcon:IconConst.bookingIcon),
                                        ),
                                      )
                                    ]
                                ),
                                Text(data[index].name,style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorConst.grey
                                ),),
                                Text(
                            "\$ ${data[index].price.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,

                                  ),)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                }),

          ],
        ),
      ),
    );
  }
}
