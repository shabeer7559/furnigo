import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/cart/controller/controller.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/controller/controller.dart';
import 'package:furnigo/features/homescreen/repository/repository.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import 'cart.dart';

class favorite extends ConsumerStatefulWidget {
  const favorite({super.key});

  @override
  ConsumerState<favorite> createState() => _favoriteState();
}

class _favoriteState extends ConsumerState<favorite> {
  // List fav=[
  //   {"image":ImageConst.coffeetable,
  //     "name":"Coffie Table",
  //     "amnt":"\$50.00"
  //
  // },
  //   {"image":ImageConst.coffieChair,
  //     "name":"Coffie Chair",
  //     "amnt":"\$20.00"
  //
  // },
  //   {"image":ImageConst.minimalStand,
  //     "name":"Minimal Stand",
  //     "amnt":"\$25.00"
  // },
  //   {"image":ImageConst.simpleDesk,
  //     "name":"Minimal Desk",
  //     "amnt":"\$50.00"
  // },
  //   {"image":ImageConst.lamp,
  //     "name":"Minimal Lamp",
  //     "amnt":"\$12.00"
  // },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: SvgPicture.asset(IconConst.searchIcon,color: ColorConst.primaryColor,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Favorites",style: GoogleFonts.gelasio(),),
          ],
        ),
        actions: [
          SvgPicture.asset(IconConst.cartIcon,color: ColorConst.primaryColor,),
          SizedBox(
            width: w*0.05,
          )
        ],
      ),
      body: Column(
        children: [

         ref.watch(favStreamProvider("i0YWExxkRwbMc8ql3E9s")).when(
                data: (data) {
                  List favDetails=data.favourite;
                  return   Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(w*0.04),
                          width: w*1,
                          height: h*0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: h*0.13,
                                width: w*0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.03),
                                    image: DecorationImage(image: NetworkImage(favDetails[index]["image"].toString()),fit: BoxFit.cover)

                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(favDetails[index]["name"]),
                                  Text(favDetails[index]["price"].toString(),style: TextStyle(fontWeight: FontWeight.w700,
                                      fontSize: w*0.05),),
                                ],),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        // ref.watch(changeProvider).deleteFavController(data[index].id);
                                      },
                                      child: SvgPicture.asset(IconConst.closeIcon)),
                                  SvgPicture.asset(IconConst.blackcartIcon,),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey.shade200,
                        );
                      },
                      itemCount: favDetails.length,

                    ),
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
      floatingActionButton:
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(),));
        },
        child: Container(
          width: w*0.9,
          height: h*0.08,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: w*0.2,
                  color: ColorConst.shadow
              )
            ],
            borderRadius: BorderRadius.circular(w*0.03),
            color: ColorConst.primaryColor
          ),
          child: Center(
            child: Text("Add all to my cart",style: TextStyle(
              color: ColorConst.secondaryColor,fontSize: w*0.06
            ),),
          ),
        ),
      ),
    );
  }
}
