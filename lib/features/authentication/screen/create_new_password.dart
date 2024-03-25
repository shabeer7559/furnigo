import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp,color: ColorConst.primaryColor,)),
        title: Text("Confirm Password",
          style: GoogleFonts.merriweather(
              fontSize: w*0.045,
              fontWeight: FontWeight.w700
          ),),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
