 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';

class FireStoreservices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> adddata({required String collection, String? documentid,required Map<String, dynamic> data}) async {
    CollectionReference adddata = firestore.collection(collection);
    if(documentid!=null) {
      adddata.doc(documentid).set(data);
    }else{
      adddata.add(data);
    }

  }

  @override
  Future<dynamic> getdata({required String path, String? documentid, Map<String,dynamic>? query}) async {
    if(documentid != null) {
      var data = await firestore.collection(path).doc(documentid).get();
      return data.data();
    } else {
      Query<Map<String,dynamic>> dataQuery = firestore.collection(path);

      if(query != null){
        if(query['orderBy'] != null){
          var orderByField = query['orderBy'];
          var descending = query['descending'] == true;
          dataQuery = dataQuery.orderBy(orderByField, descending: descending);
        }
        if(query['limit'] != null){
          var limitField = query['limit'];
          dataQuery = dataQuery.limit(limitField);
        }
      }

      var result = await dataQuery.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> CheckIfhasData({required String path, required String ducomentid}) async{
    var hasdata=await firestore.collection(path).doc(ducomentid).get();
    return hasdata.exists;
  }




}