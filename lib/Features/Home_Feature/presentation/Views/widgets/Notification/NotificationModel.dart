class NotificationModel {
  
  String NotificationText;
  String notificationDate;

  NotificationModel({required this.NotificationText,required this.notificationDate});
  
  
  factory NotificationModel.fromjson(Map<String,dynamic>json){
    return NotificationModel(
        NotificationText: json["notificationText"],
        notificationDate: json["notificationDate"]);
  }
}