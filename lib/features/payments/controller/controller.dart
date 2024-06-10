import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/features/payments/repository/repository.dart';
import 'package:furnigo/models/cardModel.dart';
final cardStreamPro=StreamProvider.family((ref,String docId) => PaymentController(paymentRepo: ref.watch(paymentRepoProvider)).cardDetails(docId: docId));
final paymentControllerPro=Provider((ref) => PaymentController(paymentRepo: ref.watch(paymentRepoProvider)));
class PaymentController{
  final PaymentRepo _paymentRepo;
  PaymentController({
    required PaymentRepo paymentRepo
}):_paymentRepo=paymentRepo;
  addingPaymentController({
    required String docId,required CardModels cardModels
}){
    return _paymentRepo.setupPaymentRepo(docId: docId, cardModels: cardModels);
  }
  Stream cardDetails({required String docId}){
    return _paymentRepo.streamCard(docId: docId);
  }
  deleteCard({required String id, required List carddData,index}){
    return _paymentRepo.deleteCard(id: id, carddData: carddData,index: index);
  }
}