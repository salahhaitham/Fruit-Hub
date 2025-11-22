import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';

import 'Items.dart';

class ItemList {
  ItemList({
      this.items,});


  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  factory ItemList.formEntity(List<CartItemEntity>entity){
    return ItemList(items: entity.map((e)=>Items.fromEntity(e)).toList());
  }

}