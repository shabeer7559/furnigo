import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/shipping/repository/repository.dart';
import 'package:furnigo/models/shipping_model.dart';
final shippingControllerPro=Provider((ref) => ShippingController(shippingRepo: ref.watch(shippingrepoProvider)));
final streamedAdrsProvider=StreamProvider.family((ref,String docId) => ref.watch(shippingControllerPro).streamadrs(docId: docId));
class ShippingController{
  final ShippingRepo _shippingRepo;
  ShippingController({
    required ShippingRepo shippingRepo
}):_shippingRepo=shippingRepo;

  addressAddingContro({
    required String docId,required ShippingAddress shippingAddress
}){
return _shippingRepo.setupAddressRepo(docId: docId, shippingAddress: shippingAddress);
  }
  Stream streamadrs({required String docId}){
    return _shippingRepo.streamAddress(docId: docId);
  }
}