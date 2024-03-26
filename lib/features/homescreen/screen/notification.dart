import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  List notification=[
    {
      "image":ImageConst.simpleDesk,
      "title":"Your order #123456789 has been confirmed",
      "note":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec."
    },
    {
      "image":ImageConst.lamp,
      "title":"Your order #123456789 has been canceled",
      "note":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec."
    },
    {
      "image":ImageConst.coffeetable,
      "title":"Your order #123456789 has been shipped successfully",
      "note":"Please help us to confirm and rate your order to get 10% discount code for next order."
    },
    {
      "image":ImageConst.coffeetable,
      "title":"Your order #123456789 has been confirmed",
      "note":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.."
    },
    {
      "image":ImageConst.simpleDesk,
      "title":"Your order #123456789 has been canceled",
      "note":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.."
    },
    {
      "image":ImageConst.coffeetable,
      "title":"Your order #123456789 has been shipped successfully",
      "note":"Please help us to confirm and rate your order to get 10% discount code for next order."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification",style:GoogleFonts.merriweather(fontWeight: FontWeight.w700,fontSize: w*0.045) ,),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
             scrollDirection: Axis.vertical,
              
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: w*1,
                  height: h*0.14,
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(w*0.03),
                        child: Container(
                          height: h*0.17,
                          width: w*0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              image: DecorationImage(image: AssetImage(notification[index]["image"]),fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w*0.68,
                            height: h*0.05,
                            child: Text(notification[index]['title'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.035,
            
            
                              ),),
                          ),
                          Container(
                              width: w*0.68,
                              height: h*0.09,
                              child: Text(notification[index]["note"],style: TextStyle(fontSize: w*0.032),))
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.shade100,
                );
              },
              itemCount: notification.length,
            
            ),
          ),
        ],
      ),
    );
  }
}
