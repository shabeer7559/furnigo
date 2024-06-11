import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(w*0.05),
            child: TextFormField(

              style: TextStyle(
                  fontSize: w*0.045,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.primaryColor
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(w*0.03)
                ),
                labelText: "Search",
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: w*0.045,
                    color: ColorConst.grey
                ),

              ),
            ),
          ),
        ],
      ),

    );
  }
}
