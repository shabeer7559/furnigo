import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/features/cart/screen/favorite.dart';
import 'package:furnigo/features/homescreen/screen/home_page.dart';
import 'package:furnigo/models/user_model.dart';

final userAaddingRepocitryProvider=Provider((ref) => AddingRepocitry(firestore: ref.watch(firestoreProvider)));
class AddingRepocitry{
 final FirebaseFirestore _firestore;
  AddingRepocitry({
    required FirebaseFirestore firestore}):_firestore=firestore;
    CollectionReference get _users=>_firestore.collection("users");



    adding({
   required UserModel userModel
}){
     UserModel userdata=userModel;
     _users.add(userdata.toMap()).then((value) {
       UserModel idUpdate=userdata.copyWith(
         id: value.id
       );value.update(idUpdate.toMap()).then((value) => currentUserModel = userdata);
     });
    }

}