import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/profile/screen/profile_page.dart';
import 'package:furnigo/main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My order",style: GoogleFonts.merriweather(fontWeight: FontWeight.w700,fontSize: w*0.05),),
          leading: InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => profile_page(),));
            },
              child: Icon(Icons.arrow_back_ios_new)),
        ),
         body:  Column(
           children: [
             TabBar(
                 labelColor: ColorConst.primaryColor,
                 indicatorSize: TabBarIndicatorSize.label,
                 unselectedLabelColor:ColorConst.darkgrey,
                 indicator: BoxDecoration(

                     borderRadius: BorderRadius.circular(w*0.08)
                 ),
                 tabs: [
                   Tab(
                     text: "Delivered",
                   ),
                   Tab(
                     text: "Processing",
                   ),
                   Tab(
                     text: "Canceled",
                   )
                 ]
             ),
             Expanded(
               child: TabBarView(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListView.separated(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: 3,
                       itemBuilder: (BuildContext context, int index) {
                         return  Container(
                           width: w*0.9,
                           height: h*0.23,
                           decoration: BoxDecoration(
                               color: ColorConst.whit,
                               boxShadow:[
                                 BoxShadow(
                                     color:Colors.grey.shade200,
                                     blurRadius: 5,
                                     spreadRadius: 5,
                                     offset: Offset(0, 6)
                                 )]
                           ),
                           child: Column(
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.04),
                                     child: Text("Order No238562312",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: w*0.04
                                       ),),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.25),
                                     child: Text("20/03/2020",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w400,
                                           fontSize: w*0.04
                                       ),),
                                   )
                                 ],
                               ),
                               Divider(
                                 color: ColorConst.darkgrey,
                               ),
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.04),
                                     child: Text("Quantity:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.02),
                                         child: Text("03",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.25 ),
                                     child: Text("Total Amount:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.01),
                                         child: Text(" \$150",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   )
                                 ],

                               ),
                               Row(
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(top: h*0.03,right: w*0.05),
                                     child: Container(
                                       width: w*0.25,
                                       height: h*0.05,
                                       child: Center(
                                         child: Text("Detail",
                                           style: TextStyle(
                                               color: ColorConst.whit,
                                               fontWeight: FontWeight.w600
                                           ),),
                                       ),
                                       decoration: BoxDecoration(
                                           color: ColorConst.primaryColor,
                                           borderRadius: BorderRadius.only(topRight: Radius.circular(w*0.01),bottomRight: Radius.circular(w*0.01))
                                       ),

                                     ),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.37),
                                     child: Text("Delivered",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w700,
                                           fontSize: w*0.051,
                                           color: ColorConst.green
                                       ),),
                                   )
                                 ],
                               )
                             ],
                           ),
                         );
                       },
                       separatorBuilder: (BuildContext context, int index) {
                         return SizedBox(height: h*0.02,);
                       },


                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListView.separated(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: 3,
                       itemBuilder: (BuildContext context, int index) {
                         return  Container(
                           width: w*0.9,
                           height: h*0.23,
                           decoration: BoxDecoration(
                               color: ColorConst.whit,
                               boxShadow:[
                                 BoxShadow(
                                     color:Colors.grey.shade200,
                                     blurRadius: 5,
                                     spreadRadius: 5,
                                     offset: Offset(0, 6)
                                 )]
                           ),
                           child: Column(
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.04),
                                     child: Text("Order No238562312",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: w*0.04
                                       ),),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.25),
                                     child: Text("20/03/2020",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w400,
                                           fontSize: w*0.04
                                       ),),
                                   )
                                 ],
                               ),
                               Divider(
                                 color: ColorConst.darkgrey,
                               ),
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.04),
                                     child: Text("Quantity:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.02),
                                         child: Text("03",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.25  ),
                                     child: Text("Total Amount:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.01),
                                         child: Text(" \$150",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   )
                                 ],

                               ),
                               Row(
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(top: h*0.03,right: w*0.05),
                                     child: Container(
                                       width: w*0.25,
                                       height: h*0.05,
                                       child: Center(
                                         child: Text("Detail",
                                           style: TextStyle(
                                               color: ColorConst.whit,
                                               fontWeight: FontWeight.w600
                                           ),),
                                       ),
                                       decoration: BoxDecoration(
                                           color: ColorConst.primaryColor,
                                           borderRadius: BorderRadius.only(topRight: Radius.circular(w*0.01),bottomRight: Radius.circular(w*0.01))
                                       ),

                                     ),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.37),
                                     child: Text("Processing",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w700,
                                           fontSize: w*0.05,
                                           color: ColorConst.green
                                       ),),
                                   )
                                 ],
                               )
                             ],
                           ),
                         );
                       },
                       separatorBuilder: (BuildContext context, int index) {
                         return SizedBox(height: h*0.02,);
                       },


                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListView.separated(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: 3,
                       itemBuilder: (BuildContext context, int index) {
                         return  Container(
                           width: w*0.9,
                           height: h*0.23,
                           decoration: BoxDecoration(
                               color: ColorConst.whit,
                               boxShadow:[
                                 BoxShadow(
                                     color:Colors.grey.shade200,
                                     blurRadius: 5,
                                     spreadRadius: 5,
                                     offset: Offset(0, 6)
                                 )]
                           ),
                           child: Column(
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.04),
                                     child: Text("Order No238562312",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: w*0.04
                                       ),),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.25),
                                     child: Text("20/03/2020",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w400,
                                           fontSize: w*0.04
                                       ),),
                                   )
                                 ],
                               ),
                               Divider(
                                 color: ColorConst.darkgrey,
                               ),
                               Row(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.04),
                                     child: Text("Quantity:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.02),
                                         child: Text("03",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.02,left: w*0.25 ),
                                     child: Text("Total Amount:",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           color: ColorConst.darkgrey
                                       ),),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.only(top: h*0.02,left: w*0.01),
                                         child: Text(" \$150",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600
                                           ),),
                                       )
                                     ],
                                   )
                                 ],

                               ),
                               Row(
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(top: h*0.03,right: w*0.05),
                                     child: Container(
                                       width: w*0.25,
                                       height: h*0.05,
                                       child: Center(
                                         child: Text("Detail",
                                           style: TextStyle(
                                               color: ColorConst.whit,
                                               fontWeight: FontWeight.w600
                                           ),),
                                       ),
                                       decoration: BoxDecoration(
                                           color: ColorConst.primaryColor,
                                           borderRadius: BorderRadius.only(topRight: Radius.circular(w*0.01),bottomRight: Radius.circular(w*0.01))
                                       ),

                                     ),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(top: h*0.03,left: w*0.37),
                                     child: Text("Canceled",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w700,
                                           fontSize: w*0.05,
                                           color: ColorConst.green
                                       ),),
                                   )
                                 ],
                               )
                             ],
                           ),
                         );
                       },
                       separatorBuilder: (BuildContext context, int index) {
                         return SizedBox(height: h*0.02,);
                       },


                     ),
                   ),
                 ],
               ),
             )
           ],
         ),
      ),
    );
  }
}
