import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/authentication/repository/repository_page.dart';
final addingControllerProvider=Provider((ref) => addingController(repocitry: ref.watch(userAaddingRepocitryProvider)));
class addingController{
 final AddingRepocitry _repocitry;
   addingController({
   required AddingRepocitry repocitry}):_repocitry=repocitry;
addingRepo(name,email,password,image){_repocitry.adding(name: name, email: email, password: password, image: image);}
}