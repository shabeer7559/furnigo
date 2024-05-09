import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/models/cartModel.dart';
import 'package:furnigo/models/user_model.dart';

final cartAddingRepositoryProvider=Provider((ref) => Cartadding(firestore: ref.watch(firestoreProvider)));
    
    class Cartadding{
  final FirebaseFirestore _firestore;
  Cartadding({
    required FirebaseFirestore firestore}):_firestore=firestore;
  CollectionReference get _cartItems=>_firestore.collection("cartitems");

  CollectionReference get _userDetails=>_firestore.collection("users");
//   adding({
//     required usrDocId,required image,required name,required price,required quantity,
//     // required image,required name, required price, required quantity,required id
//     }){
//     _userDetails.doc(usrDocId).update(({
//   "cartItem":FieldValue.arrayUnion([{
//     CartModels(image: image, name: name, price: price, quantity: quantity)
// }])}));
//   }

  Stream<UserModel> streamcart({required String docId})  {
    return _userDetails.doc(docId).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String,dynamic>));
  }

  Stream streamFav({required String docId}){
    return _userDetails.doc(docId).snapshots().map((event) => UserModel.fromMap(event.data()as Map<String,dynamic>));
  }

  deleteCart({required String id, index,required List cartData}){
    return _userDetails.doc(id).update({
      "cartItems":FieldValue.arrayRemove([cartData[index]])
    });
  }

  deleteFav({required String id,required List favDetails,index}){
    return _userDetails.doc(id).update({
      "favourite":FieldValue.arrayRemove([favDetails[index]])
    });
  }

    }