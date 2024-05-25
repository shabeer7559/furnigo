import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnigo/features/shipping/controller/controller.dart';
import 'package:furnigo/features/shipping/screen/shipping_address.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:furnigo/models/shipping_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../constants/color_const.dart';
import '../../constants/icon_const.dart';

class Addshipping extends ConsumerStatefulWidget {
  const Addshipping({super.key});

  @override
  ConsumerState<Addshipping> createState() => _AddshippingState();
}

class _AddshippingState extends ConsumerState<Addshipping> {
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController zipController=TextEditingController();
   String? countryValue;
   String? stateValue;
   String? cityValue;
   String? dropdownValue;
   var address=[
     "Home",
     "Office"
   ];
   addressAdding(){
     ref.watch(shippingControllerPro).addressAddingContro(docId: userDocId, shippingAddress: ShippingAddress(
         name: nameController.text,
         address: addressController.text,
         zipcode: zipController.text,
         country: countryValue!,
         state: stateValue!,
         city: cityValue!,
         type: dropdownValue!));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.all(w*0.05),
          child: InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => shippingAddress(),));
            },
              child: SvgPicture.asset(IconConst.backIcon)),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Add shipping address",style: GoogleFonts.merriweather(),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h*0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: w*0.9,
                  height: h*0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w*0.9,
                        height: h*0.08,
                        decoration: BoxDecoration(
                            // color: ColorConst.grey.withOpacity(0.15),
                            border: Border.all(color: CupertinoColors.black.withOpacity(0.5)),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: w*0.03),
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w400
                            ),
                            decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                  fontSize: w*0.04
                                ),
                                border: InputBorder.none,
                                constraints: BoxConstraints(
                                  maxWidth: w*0.9,
                                  minHeight: h*0.04,
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: w*0.9,
                        height: h*0.15,
                        decoration: BoxDecoration(
                            // color: ColorConst.grey.withOpacity(0.15),
                            border: Border.all(color: CupertinoColors.black.withOpacity(0.5)),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: w*0.03),
                          child: TextFormField(
                            controller: addressController,
                            style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w400
                            ),
                            decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    fontSize: w*0.04
                                ),
                                border: InputBorder.none,
                                constraints: BoxConstraints(
                                )
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: zipController,
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
                       height: h*0.2,
                        decoration: BoxDecoration(
                           border: Border.all(color: CupertinoColors.black.withOpacity(0.5)),
                            borderRadius:BorderRadius.circular(w*0.02)
                        ),
                        child:    SelectState(
                          style: TextStyle(
                            fontSize: w*0.04
                          ),
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged:(value) {
                            setState(() {
                              stateValue = value;
                            });
                          },
                          onCityChanged:(value) {
                            setState(() {
                              cityValue = value;
                            });
                          },

                        ),
                      ),
                      Container(
                        height: h*0.07,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.02),
                          border: Border.all(color: CupertinoColors.black.withOpacity(0.5) )
                        ),
                        child: DropdownButton(
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text("Address Type"),
                          icon: Center(child: Icon(Icons.keyboard_arrow_down_outlined)),
                          value: dropdownValue,
                          items: address.map((String? value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value!),
                            );
                          },).toList(),
                          onChanged: (newvalue) {
                            setState(() {
                              dropdownValue=newvalue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
        
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => shippingAddress(),));
                  addressAdding();
                },
                child: Container(
                  width: w*0.9,
                  height: h*0.07,
                  decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.02),
                      boxShadow: [BoxShadow(
                          color: ColorConst.primaryColor.withOpacity(0.25),offset: Offset(0, 4),spreadRadius: 1,blurRadius: 3
                      )]
                  ),
                  child: Center(child: Text('SAVE ADDRESS',style: TextStyle(color: ColorConst.secondaryColor,fontWeight: FontWeight.w500,fontSize: w*0.045),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
