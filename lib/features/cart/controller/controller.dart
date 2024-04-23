import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/cart/repository/repository_Page.dart';

final cartStreamProvider=StreamProvider((ref) => ref.watch(addingCartControllerProvider).cartDetails());
final addingCartControllerProvider = Provider(
        (ref) =>addingController(cartadding: ref.watch(cartAddingRepositoryProvider)));

class addingController {
final Cartadding _cartadding;
addingController({required Cartadding cartadding}):
    _cartadding=cartadding;
addingcartRepo(String image,String name,int price,int quantity,String id){
  _cartadding.adding(image: image, name: name, price: price, quantity: quantity, id: id);
}
Stream cartDetails(){
  return _cartadding.Streamcart();
}
deleteItemController(String id){
  return _cartadding.deleteItem(id: id);
}

}