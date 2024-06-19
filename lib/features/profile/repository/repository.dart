import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furnigo/core/providers/firebase_providers.dart';
import 'package:furnigo/features/homescreen/screen/home_page.dart';


final DetailsUpdateProvider=Provider((ref) => Apdatedetails(firestore: ref.watch(firestoreProvider)));
class Apdatedetails{
 final FirebaseFirestore _firestore;
    Apdatedetails({
    required FirebaseFirestore firestore
}):_firestore=firestore;
    CollectionReference get _user=>_firestore.collection("users");

   UpdateUserDetails({
   required String docId,required String updName,required String updemail
}){
     return _user.doc(docId).update(
       currentUserModel!.copyWith(
         name: updName,
         email: updemail
       ).toMap()
     );
   }
}