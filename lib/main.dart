import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/authentication/screen/create_new_password.dart';
import 'package:furnigo/features/authentication/screen/foget_password.dart';
import 'package:furnigo/features/authentication/screen/login_page.dart';
import 'package:furnigo/features/authentication/screen/signup_page.dart';
import 'package:furnigo/features/cart/screen/cart.dart';
import 'package:furnigo/features/homescreen/screen/bottomNavi.dart';


import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/features/homescreen/screen/notification.dart';
// import 'package:furnigo/features/homescreen/screen/product_details.dart';
import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/orders/my_orders.dart';
import 'package:furnigo/features/payments/screen/payment_methods.dart';
import 'package:furnigo/features/reviews/screen/rating_review.dart';
import 'package:furnigo/features/homescreen/screen/notification.dart';

// import 'package:furnigo/features/homescreen/screen/product_details.dart';
import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/reviews/screen/rating_review.dart';
import 'package:furnigo/features/homescreen/screen/notification.dart';

import 'package:furnigo/features/homescreen/screen/success.dart';
import 'package:furnigo/features/profile/screen/profile_page.dart';
import 'package:furnigo/features/reviews/screen/my_review.dart';
import 'package:furnigo/features/settings/settings.dart';
import 'package:furnigo/features/settings/settings.dart';
import 'package:furnigo/features/shipping/screen/add_shipping_address.dart';
import 'package:furnigo/features/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/cart/screen/product_details.dart';
import 'features/shipping/screen/shipping_address.dart';
import 'firebase_options.dart';
var h;
var w;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap:  () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),

      ),
    );
  }
}
