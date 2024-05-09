
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/authentication/repository/repository_page.dart';
import 'package:furnigo/features/cart/screen/favorite.dart';
final addingControllerProvider=Provider((ref) => addingController(repocitry: ref.watch(userAaddingRepocitryProvider)));
class addingController{
  final AddingRepocitry _repocitry;
  addingController({
    required AddingRepocitry repocitry}):_repocitry=repocitry;
  addingRepo(name,email,password,image,favorite,cartItems,reviews){_repocitry.adding(name: name, email: email, password: password, image: image, favorite: favorite, cartItems: cartItems, reviews: reviews);}
}