import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/cart/screen/product_details.dart';
import 'package:furnigo/features/constants/searchConantry.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class fav_searchPage extends ConsumerStatefulWidget {
  const fav_searchPage({super.key});

  @override
  ConsumerState<fav_searchPage> createState() => _searchPageState();
}

class _searchPageState extends ConsumerState<fav_searchPage> {
  String name = "";

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Card(
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                style: TextStyle(
                    fontSize: w*0.045,
                    fontWeight: FontWeight.w400,
                    color: ColorConst.primaryColor
                ),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxHeight: h*0.055
                  ),
                  border: OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  hintText: "Search by Products",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: w*0.045,
                      color: ColorConst.grey
                  ),
                ),
              ),
            )),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(userDocId)
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemBuilder: (context, index) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  print("================[[[[[[[[[[[[[[[[[");
                  print(data["favourite"][0]["name"]);
                  if (name.isEmpty) {}
                  if (data["favourite"][index]["name"]
                      .toString()
                      .toLowerCase()
                      .startsWith(name.toLowerCase())) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetails(data["favourite"][index]["image"], data["favourite"][index]["name"], data["favourite"][index]["price"].toString(), data["favourite"][index]["review"], 1, data["favourite"][index]["catId"], data["favourite"][index]["proId"]),));
                      },
                      child: ListTile(
                        title: Text(
                          data["favourite"][index]["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data["favourite"][index]["price"].toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                          NetworkImage(data["favourite"][index]["image"]),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
                itemCount: snapshot.data?["favourite"].length);
          },
        ));
  }
}