import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/features/cart/favorite.dart';
import 'package:furnigo/models/user_model.dart';

final userAaddingRepocitryProvider=Provider((ref) => AddingRepocitry(firestore: ref.watch(firestoreProvider)));
class AddingRepocitry{
 final FirebaseFirestore _firestore;
  AddingRepocitry({
    required FirebaseFirestore firestore}):_firestore=firestore;
    CollectionReference get _users=>_firestore.collection("users");



    adding({
   required name,required email,required password,required image, required favorite,required cartItems,required reviews
}){
     UserModel userdata=UserModel(name: name, email: email, password: password, image: image, favourite: favorite, cartItems: cartItems, reviews: reviews);
     _users.add(userdata.toMap());
    }




}