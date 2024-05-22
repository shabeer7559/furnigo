import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:furnigo/features/homescreen/repository/repository.dart';
final changeProvider=ChangeNotifierProvider((ref) => AddingController(repository: ref.watch(addinRepositoryProvider)));
 final homeScreenPro=Provider((ref) => AddingController(repository: ref.watch(addinRepositoryProvider)));
final streamProductsProvider=StreamProvider.autoDispose.family((ref, String id) => ref.watch(changeProvider.notifier).productDetails(id: id));
final streamCategoryProvider=StreamProvider((ref) => AddingController(repository: ref.watch(addinRepositoryProvider)).categoryDetails());
final streamFavProvider=StreamProvider((ref) => AddingController(repository: ref.watch(addinRepositoryProvider)).favDetails());

class AddingController extends ChangeNotifier {
final AddingRepository _repository;
AddingController({
required AddingRepository repository
}):_repository = repository;
Stream categoryDetails(){
  return _repository.streamCategory();
}
Stream productDetails({required String id}){
  return _repository.streamProducts(id: id);
}
favoriteAdd(String docId,String name,String image,int price){
_repository.addToFavourite(docId: docId, image: image, price: price, name: name);
}
Stream favDetails(){
  return _repository.StreamFav();
}
deleteFavController(String id){
  return _repository.DeleteFav(id: id);
}
}