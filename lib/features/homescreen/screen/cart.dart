import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_sharp),
        title: Center(
          child: Text("My cart",
          style: GoogleFonts.merriweather(
            fontWeight: FontWeight.w700,
            fontSize: w*0.05,
            color: ColorConst.primaryColor
          ),),
        ),
      ),
      floatingActionButton: Container(
        height: h*0.2,
        width: w*1,
       margin: EdgeInsets.only(right: w*0.06,left: w*0.06),
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
                    fontSize: w*0.05,
                    color: ColorConst.grey
                  ),
                  constraints: BoxConstraints(
                    maxWidth: w*0.6,
                    maxHeight: w*0.1,
                  )
                ),
               ),
               Container(
                 height: h*0.055,
                 width: w*0.13,
                 decoration: BoxDecoration(
                   color: ColorConst.primaryColor,
                   borderRadius: BorderRadius.circular(w*0.03)
                 ),
                 child: Icon(Icons.arrow_forward_ios_outlined,color: ColorConst.secondaryColor,),
               )
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Total:",
               style: TextStyle(
                 fontSize: w*0.05,
                 fontWeight: FontWeight.w700,
                 color: ColorConst.grey
               ),),
               Text("\$ 95.00",
               style: TextStyle(
                 fontSize: w*0.05,
                 fontWeight: FontWeight.w700,
                 color: ColorConst.primaryColor
               ),),
             ],
           ),
           Container(
             height: h*0.08,
             width: w*0.8,
             decoration: BoxDecoration(
                 color: ColorConst.primaryColor,
                 boxShadow: [
                   BoxShadow(
                       offset: Offset(0, 10),
                       blurRadius: w*0.05,
                       color: ColorConst.shadow
                   )
                 ],
                 borderRadius: BorderRadius.circular(w*0.03)
             ),
             child: Center(
               child: Text("Check Out",
                 style: TextStyle(
                     fontSize: w*0.045,
                     fontWeight: FontWeight.w600,
                     color: ColorConst.secondaryColor
                 ),),
             ),
           ),
         ],
       ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            height: h*0.22,
            width: w*1,
          child: Row(
            children: [
              Container(
                height: h*0.2,
                width: w*0.4,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(w*0.03)
                ),
              )
            ],
          ),
          )
        ],
      ),
    );
  }
}
