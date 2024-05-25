
import 'package:cloud_firestore/cloud_firestore.dart';

class shippingRepo{
  final FirebaseFirestore _firestore;
  shippingRepo({
    required FirebaseFirestore firestore
}):_firestore=firestore;
  CollectionReference get _shipping=>_firestore.collection("users");
  // setupAddress(){
  //   return _shipping.doc(docId).update({
  //     "address":FieldValue.arrayUnion(elements)
  //   })
  // }
}