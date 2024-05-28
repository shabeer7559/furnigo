import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';

class CustView extends StatefulWidget {
  bool check1;
  int index;
  List Address;
   CustView({super.key,required this.index,required this.Address,required this.check1});

  @override
  State<CustView> createState() => _CustViewState();
}

class _CustViewState extends State<CustView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h*0.31,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.01),),
                side: BorderSide(color:ColorConst.primaryColor,width: w*0.0037),
                activeColor: ColorConst.primaryColor,
                value: widget.check1,
                onChanged: (value) {
                  setState(() {
                    widget.check1=value!;
                  });
                },),
              Text("Use as the shipping address",style: TextStyle(fontSize: w*0.045),)
            ],
          ),
          Container(
              margin: EdgeInsets.all(w * 0.04),
              width: w * 1,
              height: w * 0.4,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorConst.primaryColor.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 3,
                      spreadRadius: 1
                  )],
                  borderRadius: BorderRadius.circular(
                    w * 0.03,
                  ),
                  color: ColorConst.secondaryColor),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: w*0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w*0.04),
                              width: w*0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.Address[widget.index]["name"],
                                    style: TextStyle(
                                        fontSize: w * 0.05,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SvgPicture.asset(IconConst.edit2Icon),

                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: w*0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Divider(
                          color: ColorConst.grey,

                        ),
                        Container(
                          width: w*0.8,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(widget.Address[widget.index]["address"],style: TextStyle(color: ColorConst.grey),),
                                  Text(widget.Address[widget.index]["zipcode"],style: TextStyle(color: ColorConst.grey),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(widget.Address[widget.index]["city"],style: TextStyle(color: ColorConst.grey),),
                                  Text(widget.Address[widget.index]["state"],style: TextStyle(color: ColorConst.grey),),
                                  Text(widget.Address[widget.index]["country"],style: TextStyle(color: ColorConst.grey),),
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );;
  }
}



