class OrderItemModel{
  String orderId;
  String orderDate;
  num orderPrice;


  OrderItemModel({required this.orderId,required this.orderDate,required this.orderPrice});


  factory OrderItemModel.fromMap(Map<String,dynamic>map){
    return OrderItemModel(
        orderId: map["orderid"]??"",
        orderDate: map["orderdate"]??"",
        orderPrice: map["totalPrice"]??0);
  }
}