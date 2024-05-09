
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/features/reviews/screen/rating_review.dart';
import 'package:furnigo/models/productModel.dart';
import 'package:furnigo/models/review_model.dart';
import 'package:furnigo/models/user_model.dart';


final reviewRepositoryProvider=Provider((ref) => ReviewRepository(firestore: ref.watch(firestoreProvider)));


class ReviewRepository{
  final FirebaseFirestore _firestore;

  ReviewRepository({
    required FirebaseFirestore firestore
}): _firestore=firestore;
CollectionReference get _reviews=> _firestore.collection("users");

// updatingReview({
//     required name,required image,required review,required date,required rating,required catDocid,required proDocId
// }){
//
//   _reviews.doc(catDocid).collection("products").doc(proDocId).update({
//     "reviews":FieldValue.arrayUnion([
//       {
//      RatingModel(name: name, image: image, review: review, date: date, rating: rating)
//       }
//     ])
//   });
//
// }
 Stream streamreview({required String docId}){
  return _reviews.doc(docId).snapshots().map((event) => UserModel.fromMap(event.data()as Map<String,dynamic>));
 }
  addUserReview({
    required id,required name,required image,required review,required date,required rating,required price
}){
    return _reviews.doc(id).update({
      "reviews":FieldValue.arrayUnion([
        RatingModel(
            name: name,
            image: image,
            review: review,
            date: date,
            rating: rating,
            price: price).toMap()
      ])
    });
  }
}
