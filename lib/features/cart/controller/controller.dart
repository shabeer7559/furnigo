import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/cart/repository/repository_Page.dart';
import 'package:furnigo/models/user_model.dart';

final cartStreamProvider=StreamProvider.family((ref,String docId) => addingController(cartadding: ref.watch(cartAddingRepositoryProvider)).cartDetails(docId: docId));
final addingCartControllerProvider = Provider(
        (ref) =>addingController(cartadding: ref.watch(cartAddingRepositoryProvider)));

class addingController {
final Cartadding _cartadding;
addingController({required Cartadding cartadding}):
    _cartadding=cartadding;
addingcartRepo(String usrDocId,String image,int price,int quantity,String name){

  // _cartadding.adding(image: image, name: name, price: price, quantity: quantity, id: id);
  _cartadding.adding(usrDocId: usrDocId, image: image, name: name, price: price, quantity: quantity);
}
Stream<UserModel> cartDetails({required String docId}){
  return _cartadding.streamcart(docId:docId );
}
deleteItemController(String id){
  return _cartadding.deleteItem(id: id);
}

}