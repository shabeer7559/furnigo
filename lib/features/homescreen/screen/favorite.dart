import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/icon_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: SvgPicture.asset(IconConst.searchIcon),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Favorites",style: GoogleFonts.gelasio(),),
          ],
        ),
        actions: [
          SvgPicture.asset(IconConst.cartIcon),
          SizedBox(
            width: w*0.05,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(w*0.04),
            width: w*1,
            height: h*0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w*0.03),
            ),
            child: Row(
              children: [
                Container(
                  height: h*0.3,
                  width: w*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                    color: Colors.deepOrange

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
