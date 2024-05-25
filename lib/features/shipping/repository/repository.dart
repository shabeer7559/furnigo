
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/models/shipping_model.dart';
final shippingrepoProvider=Provider((ref) => ShippingRepo(firestore: ref.watch(firestoreProvider)));
class ShippingRepo{
  final FirebaseFirestore _firestore;
  ShippingRepo({
    required FirebaseFirestore firestore
}):_firestore=firestore;
  CollectionReference get _shipping=>_firestore.collection("users");
  setupAddressRepo({
    required String docId,required ShippingAddress shippingAddress,
}){
    return _shipping.doc(docId).update({
      "address":FieldValue.arrayUnion([
       shippingAddress.toMap()
      ])
    });
  }
}