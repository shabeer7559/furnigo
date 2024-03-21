import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';

class Addshipping extends StatefulWidget {
  const Addshipping({super.key});

  @override
  State<Addshipping> createState() => _AddshippingState();
}

class _AddshippingState extends State<Addshipping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w*0.05),
          child: SvgPicture.asset(IconConst.backIcon),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Add shipping address",style: GoogleFonts.merriweather(),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: w*0.9,
                  height: h*0.67,
                  child: Column(
        
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w*0.9,
                        height: h*0.08,
                        decoration: BoxDecoration(
                            color: ColorConst.grey.withOpacity(0.25),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
        
                        child: TextFormField(
        
                          decoration: InputDecoration(
                              hintText: "CardHolder Name",
                              border: InputBorder.none,
                              constraints: BoxConstraints()
                          ),
                        ),
                      ),
                      Container(
                        width: w*0.9,
                        height: h*0.08,
                        decoration: BoxDecoration(
                            color: ColorConst.grey.withOpacity(0.25),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
        
                        child: TextFormField(
        
                          decoration: InputDecoration(
                              hintText: "Address",
                              border: InputBorder.none,
                              constraints: BoxConstraints()
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Zipcode(Postal Code)",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color:ColorConst.grey.withOpacity(0.15))
                            ),
                            constraints: BoxConstraints(
                            )
                        ),
        
        
                      ),
                      Container(
                        width: w*0.9,
                        height: h*0.08,
                        decoration: BoxDecoration(
                            color: ColorConst.grey.withOpacity(0.25),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
        
                        child: TextFormField(
        
                          decoration: InputDecoration(
                            suffixIcon: Icon(CupertinoIcons.chevron_down),
                              hintText: "Country",
                              border: InputBorder.none,
                              constraints: BoxConstraints()
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(CupertinoIcons.chevron_down),
                            hintText: "City",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color:ColorConst.grey.withOpacity(0.15))
                            ),
                            constraints: BoxConstraints(
                            )
                        ),
        
        
                      ),
                      Container(
                        width: w*0.9,
                        height: h*0.08,
                        decoration: BoxDecoration(
                            color: ColorConst.grey.withOpacity(0.25),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
        
                        child: TextFormField(
        
                          decoration: InputDecoration(
                              suffixIcon: Icon(CupertinoIcons.chevron_down),
                              hintText: "District",
                              border: InputBorder.none,
                              constraints: BoxConstraints()
                          ),
                        ),
                      ),
        
                    ],
                  ),
        
                ),
              ),
              Container(
                width: w*0.9,
                height: h*0.08,
                decoration: BoxDecoration(
                    color: ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(w*0.02),
                    boxShadow: [BoxShadow(
                        color: ColorConst.primaryColor.withOpacity(0.25),offset: Offset(0, 4),spreadRadius: 1,blurRadius: 3
                    )]
                ),
                child: Center(child: Text('ADD NEW CARD',style: TextStyle(color: ColorConst.secondaryColor,fontWeight: FontWeight.w500,fontSize: w*0.045),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
