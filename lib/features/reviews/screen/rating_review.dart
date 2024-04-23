import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/reviews/controller/controller.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';

class rating extends ConsumerStatefulWidget {
  final String image;
  final String name;
  final String productId;
  final String categoryId;
  const rating(this.productId, this.categoryId,  {super.key, required this.image, required this.name});

  @override
  ConsumerState<rating> createState() => _ratingState();
}

class _ratingState extends ConsumerState<rating> {
  TextEditingController reviewController=TextEditingController();
  // List reviews=[
  //   {
  //   "image":ImageConst.bruno,
  //   "name":"Bruno Fernandes",
  //   "review":"Nice Furniture with good delivery. The delivery time is very fast."
  // " Then products look like exactly the picture in the app."
  // " Besides, color is also the same and quality is very good despite very cheap price"
  // },
  //   {
  //   "image":ImageConst.amina,
  //   "name":"Kunjaamina",
  //   "review":"Nice Furniture with good delivery. The delivery time is very fast."
  // " Then products look like exactly the picture in the app."
  // " Besides, color is also the same and quality is very good despite very cheap price"
  // },
  //   {
  //   "image":ImageConst.tracy,
  //   "name":"Tracy",
  //   "review":"Nice Furniture with good delivery. The delivery time is very fast."
  // " Then products look like exactly the picture in the app."
  // " Besides, color is also the same and quality is very good despite very cheap price"
  // },
  // ];
  int starRate=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.all(w*0.05),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(IconConst.arrowback)),
        ),
        title: Text("Rating & Review",style: GoogleFonts.gelasio(fontSize: w*0.055,fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          Container(
            height: h*0.18,
            width: w*1,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(w*0.04),
                  child: Container(
                    width: w*0.3,
                    height: h*0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,style: TextStyle(fontSize: w*0.05),),
                    Row(
                      children: [
                        SvgPicture.asset(IconConst.yellowStar,width: w*0.08,),
                        SizedBox(
                          width: w*0.02 ,
                        ),
                        Text("4.5",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.08
                        ),),
                      ],
                    ),
                    Text("10 reviews",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.055
                    ),)
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            indent: w*0.03,
            endIndent:w* 0.03,
          ),
          ref.watch(streamedReviewProvider(widget.categoryId)).when(
              data: (data) {
                return  Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: w*1,
                        height: h*0.35,
                        child: Stack(
                            children: [
                              Center(
                                child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(w*0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(data[index].rating[index].name,style: TextStyle(
                                                  fontWeight: FontWeight.w700
                                              ),),
                                              Text(data[index].rating[index].date,style: TextStyle(
                                                  color: Colors.grey.shade500
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: w*0.03),
                                          child: StarRating(
                                            onChanged: (index) {
                                              index=data[index].rating[index].starRate;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(w*0.03),
                                          child: Text(data[index].rating[index].review),
                                        )
                                      ],
                                    ),
                                    height: h*0.26,
                                    width: w*0.9,
                                    decoration:BoxDecoration(
                                        color: ColorConst.secondaryColor,
                                        borderRadius: BorderRadius.circular(w*0.03),
                                        boxShadow: [
                                          BoxShadow(
                                              color:Colors.grey.shade200,
                                              blurRadius: 5,
                                              spreadRadius: 5,
                                              offset: Offset(0, 6)
                                          )
                                        ]
                                    )
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(
                                    top:w*0.04,
                                    left: w*0.43),
                                child: CircleAvatar(
                                  radius: w*0.07,
                                  backgroundImage: NetworkImage(data[index].rating[index].image),
                                ),
                              )
                            ]
                        ),

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox();
                    },
                    itemCount:1,

                  ),
                ) ;
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              }),

        ],
      ),
      floatingActionButton:
      InkWell(
        onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                elevation: 0,
              content: Container(
                width: w*1,
                height: h*0.5,
                padding: EdgeInsets.all(w*0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: w*0.07,
                              backgroundImage: AssetImage(ImageConst.profile),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("sulaiman",style: TextStyle(
                                fontWeight: FontWeight.w700
                            ),),
                            Text(DateTime.now().toString().substring(0,10),style: TextStyle(
                                color: Colors.grey.shade500
                            ),)
                          ],
                        ),
                        StarRating(
                          onChanged: (index) {
                            starRate=index;
                          },
                        ),
                        TextFormField(
                             controller: reviewController,
                            keyboardType:TextInputType.multiline ,
                            textInputAction: TextInputAction.newline,
                            maxLines: 5,
                            decoration: InputDecoration(
                              // constraints: BoxConstraints(
                              //   minHeight:h*0.15,
                              //   maxWidth:w*0.85,
                              // ),
                                fillColor: ColorConst.whit,
                                filled: true,
                                hintText: "Pleas enter your review",
                                border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(w*0.03)
                                )
                            )
                        ),
                        SizedBox(
                          height: h*0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {

                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Center(child: Text("Cancel",style: TextStyle(
                                    color: ColorConst.whit
                                ),)),
                                width: w*0.2,
                                height: h*0.04,
                                decoration: BoxDecoration(
                                    color: ColorConst.primaryColor,
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),

                              ),
                            ),
                            // SizedBox(
                            //   width: w*0.03,
                            // ),
                            InkWell(
                              onTap: () {
                                print("-------------------------");
                                print(widget.categoryId);
                                print("---------------------------");
                                print(widget.productId);
                                FirebaseFirestore.instance.collection("category").doc(widget.categoryId).collection("Products").doc(widget.productId)
                                    .update({
                                  "rating":FieldValue.arrayUnion([
                                    {
                                      "review": reviewController.text,
                                      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSasIydkiFM8Nmx5KTx2iAshCaV_YINqfc5TBrUhN9KA&s",
                                      "name":"gghghh",
                                      "date":DateTime.now().toString().substring(0,10),
                                      "starRate":starRate.toString()
                                    }

                                  ])
                                });
                                // reviewAdding();
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Center(
                                  child: Text("Submit",style: TextStyle(
                                      color: ColorConst.whit
                                  ),),
                                ),
                                width: w*0.2,
                                height: h*0.04,
                                decoration: BoxDecoration(
                                    color: ColorConst.primaryColor,
                                    borderRadius: BorderRadius.circular(w*0.03)
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )

              )
            );
          },);
        },
        child: Container(
          width: w*0.9,
          height: h*0.074,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color:Colors.grey.shade200,
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: Offset(0, 6)
              )
            ],
              borderRadius: BorderRadius.circular(w*0.03),
              color: ColorConst.primaryColor
          ),
          child: Center(
            child: Text("Write a review",style: TextStyle(
                color: ColorConst.secondaryColor,fontSize: w*0.06
            ),),
          ),
        ),
      ),
    );
  }
}
