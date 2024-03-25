import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/payments/screen/customWidget.dart';
import 'package:furnigo/features/shipping/screen/add_shipping_address.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';

class shippingAddress extends StatefulWidget {
  const shippingAddress({super.key});

  @override
  State<shippingAddress> createState() => _shippingAddressState();
}

class _shippingAddressState extends State<shippingAddress> {
  List saved=[];
  List Address = [
    {
      "name": "Bruno Fernandes",
      "address": "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
    },
    {
      "name": "Bruno Fernandes",
      "address": "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
    },
    {
      "name": "Bruno Fernandes",
      "address": "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
    },

  ];
  bool check1=true;
  bool check2=true;
  bool check3=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => Addshipping(),));
      },
      child: Icon(CupertinoIcons.plus),backgroundColor: ColorConst.secondaryColor,),
      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w*0.05),
          child: SvgPicture.asset(IconConst.backIcon),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Shipping address",style: GoogleFonts.merriweather(),),
      ),
      body: SingleChildScrollView(
        child: Container(
         height: h*0.8,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CustView(index: index, Address: Address, check1: check1);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return
                    SizedBox(height: w*0.05);
                  },
                  itemCount: Address.length,
                ),
              )





            ],
          ),
        ),
      ),
    );
  }
}
