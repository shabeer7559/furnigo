import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/constants/searchConantry.dart';
import 'package:pinput/pinput.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';

class searchPage extends ConsumerStatefulWidget {
  const searchPage({super.key});

  @override
  ConsumerState<searchPage> createState() => _searchPageState();
}

class _searchPageState extends ConsumerState<searchPage> {
  String name="";
  // List<Map<String,dynamic>> data=[
  //   {
  //     "name":"Rahees",
  //     "email":"raheesmohammed500@gmail.com",
  //     "image":"assets/image/amina.png"
  //   },
  //   {
  //     "name":"salman",
  //     "email":"salmanmohammed500@gmail.com",
  //     "image":"assets/image/amina.png"
  //   },
  //   {
  //     "name":"Ashik",
  //     "email":"Ashik23@gmail.com",
  //     "image":"assets/image/amina.png"
  //   },
  //   {
  //     "name":"shaber",
  //     "email":"shaber@gmail.com",
  //     "image":"assets/image/amina.png"
  //   },
  // ];
  // addData()async{
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection("Users").add(element);
  //   }
  //   print("all data added");
  // }
  // TextEditingController searchController=TextEditingController();
  // final search=StateProvider((ref) => "");
@override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Card(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),hintText: "search"
            ),
            onChanged: (val){
              setState(() {
                 name=val;
              });
            },
          ),
        )
      ),
body: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collectionGroup("Products").snapshots(),
  builder: ( context,  snapshot) {
    return (snapshot.connectionState==ConnectionState.waiting)?
        Center(
          child: CircularProgressIndicator(),

        ):ListView.builder(
      itemBuilder: (context, index) {
          var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
          print("========");
          print(data);
          if (name.isEmpty){

          }
          if (data["name"].toString().toLowerCase().startsWith(name.toLowerCase())){
            return ListTile(
              title: Text(data["name"],maxLines: 1,overflow: TextOverflow.ellipsis,style:
              TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(data["price"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis,style:
              TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data["image"]),
              ),
            );
          }
          return Container();
        },
    itemCount: snapshot.data?.size,);
  },
)

    );
  }
}
