
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnigo/features/authentication/controller/controller.dart';
import 'package:furnigo/features/authentication/repository/repository_page.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/constants/color_const.dart';
import 'package:furnigo/features/constants/image_const.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../constants/icon_const.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  String imgurl='https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png';
  bool loading=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   data(){
     ref.watch(addingControllerProvider).addingRepo(emailController.text, passwordController.text, nameController.text,imgurl);
   }
  var files;
  pickImage(ImageSource)async{
    final imgfile=await ImagePicker.platform.pickImage(source: ImageSource);
    // files=File(imgfile!.path);
    if(mounted){
      setState(() {
        files=File(imgfile!.path);
      });
      uploadFile();
      Navigator.pop(context);
    }}
  uploadFile()async{
    setState(() {
      loading=true;
    });
    var uploadTask=await FirebaseStorage.instance.ref('uploads').child(DateTime.now().toString()).putFile(files,SettableMetadata(
        contentType: 'image/jpge'
    ));
    var getUrl=await uploadTask.ref.getDownloadURL();
    imgurl=getUrl;
    setState(() {
      loading=false;
    });
    print("-----------------------------------------------------");
    print(getUrl);
  }
  bool password=true;
  bool password1=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h*0.98,
          child: Padding(
            padding:  EdgeInsets.all(w*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: h*0.05),
                  child: Text("WELCOME",
                  style: GoogleFonts.merriweather(
                    color: ColorConst.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: w*0.08,
                  ),),
                ),
            Center(
              child:  loading?
              CircularProgressIndicator():Stack(
                children: [
                      CircleAvatar(
                       radius: w*0.1,
                        backgroundImage:NetworkImage(imgurl)
                      ),
                  Padding(
                    padding:  EdgeInsets.only(top: h*0.06,left: w*0.15),
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return
                              CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(

                                    onPressed: () {
                                      pickImage(ImageSource.gallery);
                                    },
                                    child: Text("Photo Gallery",style:
                                    TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: w*0.045,
                                        color:ColorConst.primaryColor
                                    ),),isDefaultAction: true,),
                                  CupertinoActionSheetAction(onPressed: () {
                                    pickImage(ImageSource.camera);
                                  }, child: Text("Camera",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.045,
                                      color: ColorConst.primaryColor
                                  ),),isDefaultAction: true,)
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel",style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: w*0.045,
                                        color: ColorConst.primaryColor
                                    ),)),
                              );
                          },);
                      },
                      child: Container(
                        width: w*0.065,
                        height: w*0.065,
                        child: Icon(Icons.edit,
                          color:ColorConst.primaryColor,),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorConst.shadow,
                                offset: Offset(0, 7),
                                blurRadius: w*0.04
                            )],
                          color:ColorConst.whit,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(w*0.015,),topRight: Radius.circular(w*0.015),topLeft: Radius.circular(w*0.015)),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                Container(
                  height: h*0.7,
                  width: w*0.9,
                   margin: EdgeInsets.only(left: w*0.025),
                  decoration: BoxDecoration(
                      color: ColorConst.secondaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: ColorConst.shadow,
                            offset: Offset(0, 7),
                            blurRadius: w*0.04
                        )]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Your Name",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        obscureText: password?false:true,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              password=!password;
                              setState(() {

                              });
                            },
                              child: Icon(password==true?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined)),
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: password1?false:true,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              password1=!password1;
                              setState(() {

                              });
                            },
                              child: Icon(password1==true?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined)),
                          labelText: "ConfirmPassword",
                          hintText: "Confirm Your Password",
                          constraints: BoxConstraints(
                              maxWidth: w*0.8
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          data();
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavi(),), (route) => false);
                        },
                        child: Container(
                          height: h*0.06,
                          width: w*0.7,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 20,
                                    color: ColorConst.primaryColor.withOpacity(0.25)
                                )
                              ],
                              color: ColorConst.primaryColor,
                              borderRadius: BorderRadius.circular(w*0.02)
                          ),
                          child: Center(
                            child: Text("SIGN UP",
                              style: TextStyle(
                                  color: ColorConst.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w*0.05
                              ),),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorConst.grey,
                            fontSize: w*0.035
                          ),),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(),));
                            },
                            child: Text("SIGN IN",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorConst.primaryColor,
                              fontSize: w*0.035
                            ),),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
