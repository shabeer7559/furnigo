import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../cart/product_details.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedIndex=0;
  List<Map<String,dynamic>>suggessions=[
    { "icon":IconConst.starIcon,
      "text":"Popular"
  },
    {
   "icon":IconConst.chairIcon,
      "text":"Chair"
    },
    {
   "icon":IconConst.tabeIcon,
      "text":"Table"
    },
    {
   "icon":IconConst.sofa,
      "text":"Sofa"
    },
    {
   "icon":IconConst.bedIcon,
      "text":"Bed"
    },
  ];
  List items=[
    {"products":ImageConst.lamp,
      "name":"Black Simple Lamp",
      "price":"\$12.00"
    },
    {"products":ImageConst.minimalStand,
      "name":"Minimal Stand",
      "price":"\$25.00"
    },
    {"products":ImageConst.coffieChair,
      "name":"Coffie Chair",
      "price":"\$20.00"
    },
    {"products":ImageConst.simpleDesk,
      "name":"Simple Desk",
      "price":"\$50.00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(w*0.05),
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
          SvgPicture.asset(IconConst.cartIcon),
          SizedBox(
            width: w*0.05,
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: w*1,
              height:h*0.15,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedIndex=index;
                          setState(() {

                          });
                        },
                        child: Container(
                          width: w*0.2,
                          height: w*0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color:selectedIndex==index?ColorConst.primaryColor: ColorConst.containerGrey
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(w*0.05),
                            child: SvgPicture.asset(suggessions[index]["icon"]),
                          ),
                        ),
                      ),
                      Text(suggessions[index]["text"])
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: w*0.03,);
                },
                itemCount: suggessions.length,
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: w * 0.03,
                    mainAxisSpacing: w* 0.03,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,   CupertinoPageRoute(builder: (context) => ProductDetails(),));
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
                                  image: DecorationImage(image: AssetImage(items[index]["products"]),fit: BoxFit.fill)

                              ) ,
                            ),
                              Positioned(
                                left: w*0.34,
                                  bottom: w*0.05,
                                  child: SvgPicture.asset(IconConst.bookingIcon))
                            ]
                          ),
                          Text(items[index]["name"],style: TextStyle(
                              fontWeight: FontWeight.w500,
                            color: ColorConst.grey
                          ),),
                          Text(items[index]["price"],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,

                          ),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
