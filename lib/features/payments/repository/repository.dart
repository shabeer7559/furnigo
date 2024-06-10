import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/models/cardModel.dart';
import 'package:furnigo/models/user_model.dart';
final paymentRepoProvider=Provider((ref) => PaymentRepo(firestore: ref.watch(firestoreProvider)));
class PaymentRepo{
  final FirebaseFirestore _firestore;
  PaymentRepo({
    required FirebaseFirestore firestore
}):_firestore=firestore;
  CollectionReference get _payment=>_firestore.collection("users");
  setupPaymentRepo({
    required String docId,required CardModels cardModels
}){
    return _payment.doc(docId).update({
      "payment":FieldValue.arrayUnion([
        cardModels.toMap()
      ])
    });
  }
  Stream streamCard({required String docId}){
    return _payment.doc(docId).snapshots().map((event) => UserModel.fromMap(event.data()as Map<String,dynamic>));
  }
  deleteCard({required String id, required List carddData,index}){
    return _payment.doc(id).update({
      "payment":FieldValue.arrayRemove([carddData[index]])
    });
}
}