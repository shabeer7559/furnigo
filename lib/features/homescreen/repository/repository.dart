import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/models/categoryModel.dart';
import 'package:furnigo/models/favourite_model.dart';
import 'package:furnigo/models/productModel.dart';


final addinRepositoryProvider=Provider((ref) => AddingRepository(firestore: ref.watch(firestoreProvider)));

class AddingRepository{
final FirebaseFirestore _firestore;
AddingRepository({
required FirebaseFirestore firestore
}):_firestore=firestore;
CollectionReference get _category=>_firestore.collection("category");
CollectionReference get _favorite=>_firestore.collection("favorite Items");
streamCategory(){
return _category.snapshots().map((event) => event.docs.map((e) =>
CategoryModel.fromMap(e.data()as Map<String,dynamic>)).toList());
}

streamProducts({required String id}){
  return _category.doc(id).collection("Products").snapshots().map((event) => event.docs.map((e) =>
      ProductModels.fromMap(e.data()as Map<String,dynamic>)).toList());
}

addToFavourite({
  required image,required name,required price,required id
}){
  FavoriteModels favouriteData=FavoriteModels(image: image,name: name,price: price,);
  _favorite.add(favouriteData.toMap());
}
StreamFav(){
  return _favorite.snapshots().map((event) => event.docs.map((e) => FavoriteModels.fromMap(e.data()as Map<String,dynamic>)).toList());
}
DeleteFav({required String id}){
  return _favorite.doc(id).delete();

}
}