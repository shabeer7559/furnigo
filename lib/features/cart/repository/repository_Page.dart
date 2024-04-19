import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/models/cartModel.dart';

final cartAddingRepositoryProvider=Provider((ref) => Cartadding(firestore: ref.watch(firestoreProvider)));
    
    class Cartadding{
  final FirebaseFirestore _firestore;
  Cartadding({
    required FirebaseFirestore firestore}):_firestore=firestore;
  CollectionReference get _cartItems=>_firestore.collection("cartitems");
  adding({
    required image,required name, required price, required quantity,required id
    }){
    CartModels cartdata=CartModels(image: image,name: name,price: price, quantity: quantity,id: id);
    _cartItems.add(cartdata.toMap()).then((value)  {
      CartModels updatedid= cartdata.copyWith(
        id: value.id,
      );value.update(updatedid.toMap());
    });
  }
  Streamcart(){
    return _cartItems.snapshots().map((event) =>
    event.docs.map((e) => CartModels.fromMap(e.data()as Map<String,dynamic>)).toList());

  }
  deleteItem({required String id}){
    return _cartItems.doc(id).delete();
  }

    }