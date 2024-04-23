

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/reviews/repository/repository.dart';

final addingReviweControllsProvider=Provider((ref) => ReviewController(repository: ref.watch(reviewRepositoryProvider)));
final reviewNotifierPro=ChangeNotifierProvider((ref) => ReviewController(repository: ref.watch(reviewRepositoryProvider)));
final streamedReviewProvider=StreamProvider.autoDispose.family((ref,String catId) => ref.watch(addingReviweControllsProvider).streamReview(catId: catId));


class ReviewController extends ChangeNotifier{
  final ReviewRepository _repository;
  ReviewController({
    required ReviewRepository repository
}):_repository=repository;
  reviewRepo(String name,String image,String review,String date,String rating,String catDocid,String proDocId ){
    _repository.updatingReview(name: name, image: image, review: review, date: date, rating: rating, catDocid: catDocid, proDocId: proDocId);
  }

  Stream streamReview({required String catId}){
    return _repository.Streamreview(catId: catId);
  }
}