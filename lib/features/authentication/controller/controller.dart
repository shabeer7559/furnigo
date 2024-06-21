
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/authentication/repository/repository_page.dart';
import 'package:furnigo/features/cart/screen/favorite.dart';
import 'package:furnigo/models/user_model.dart';
final addingControllerProvider=Provider((ref) => addingController(repocitry: ref.watch(userAaddingRepocitryProvider)));
class addingController{
  final AddingRepocitry _repocitry;
  addingController({
    required AddingRepocitry repocitry}):_repocitry=repocitry;
  addingRepo(UserModel userModel)
  {_repocitry.adding(userModel: userModel);}
}