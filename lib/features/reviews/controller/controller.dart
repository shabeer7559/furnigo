

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/reviews/repository/repository.dart';
import 'package:furnigo/features/reviews/screen/rating_review.dart';

final addingReviweControllsProvider=Provider((ref) => ReviewController(repository: ref.watch(reviewRepositoryProvider)));

final reviewNotifierPro=ChangeNotifierProvider((ref) => ReviewController(repository: ref.watch(reviewRepositoryProvider)));

final streamedReviewProvider=StreamProvider.family((ref,String docId) => ref.watch(addingReviweControllsProvider).streamReview(docId: docId));

final totelRevProvider=StreamProvider.family((ref,String data) => ref.watch(addingReviweControllsProvider).totelRevContro(data: data));


class ReviewController extends ChangeNotifier{
  final ReviewRepository _repository;
  ReviewController({
    required ReviewRepository repository
}):_repository=repository;

  // reviewRepo(String name,String image,String review,String date,String rating,String catDocid,String proDocId ){
  //   _repository.updatingReview(name: name, image: image, review: review, date: date, rating: rating, catDocid: catDocid, proDocId: proDocId);
  // }

userReviewContro({
    required id,required name, required image, required review, required date,required rating,required price
}){
    _repository.addUserReview(id: id, name: name, image: image, review: review, date: date, rating: rating, price: price);
}

totelReviewContr({
  required catId,required proId,required name,required image, required review, required date,required star,
}){
  _repository.addTotelReview(catId: catId, proId: proId, name: name, image: image, review: review, date: date, star: star);
}


  Stream streamReview({required String docId}){
    return _repository.streamreview(docId: docId);
  }

  Stream totelRevContro({required String data}){
  Map<String,dynamic> d = jsonDecode(data);
  return  _repository.streamTotelRev(catId: d["catId"], proId: d["proId"]);
  }
}