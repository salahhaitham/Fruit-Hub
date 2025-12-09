 import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseServices{
 FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void>adddata({required String collection,String? documentid,required Map<String,dynamic>data});

Future<dynamic>getdata({required String path,String? documentid,Map<String,dynamic>?query});
 Stream<dynamic>StreamData({required String path,Map<String,dynamic>?query});

Future<bool>CheckIfhasData({required String path,required String ducomentid})async{
var hasdata=await firestore.collection(path).doc(ducomentid).get();
return hasdata.exists;

}
 Future<void>updateData({required String path,String? documentid,required Map<String,dynamic>data});



 }