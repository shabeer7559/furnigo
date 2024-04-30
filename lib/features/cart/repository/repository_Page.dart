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
  adding({
    required usrDocId,required image,required name,required price,required quantity
    // required image,required name, required price, required quantity,required id
    }){
    _userDetails.doc(usrDocId).update(({
  "cartItem":FieldValue.arrayUnion([{
    CartModels(image: image, name: name, price: price, quantity: quantity)
}])
}));

  //   CartModels cartdata=CartModels(image: image,name: name,price: price, quantity: quantity);
  //   _cartItems.add(cartdata.toMap());


  }


  Stream<UserModel> streamcart({required String docId})  {
    return _userDetails.doc(docId).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String,dynamic>));
  }



  deleteItem({required String id}){
    return _userDetails.doc(id).delete();
  }

    }