// import 'package:easyfy_care_patient/features/home_screen/data/model/notification_fcm_response.dart';
// import 'package:easyfy_care_patient/features/home_screen/domain/entity/fcm_response_entity.dart';
// import 'package:easyfy_care_patient/features/notification_screen/data/datasource/notification_datasource.dart';
// import 'package:easyfy_care_patient/features/notification_screen/domain/entity/notification_list_entity.dart';
// import 'package:easyfy_care_patient/features/notification_screen/domain/repository/notification_repository.dart';

// import '../model/notification_list_model.dart';

// class NotificationRepositoryImpl  implements NotificationRepository {
//   final NotificationDatasource datasource;

//   NotificationRepositoryImpl({required this.datasource});


 
//         @override
//   Future<CommonResponse> deleteAllNotification() async {
//     final response = await datasource.deleteAllNotification();
//     print(response); 
//     final allNotificationDeletingResponse = CommonResponse.fromJson(response);
//     return allNotificationDeletingResponse;
//   }
  
//   @override
//   Future<NotificationListResponseEntity> notificationListing() async{
//   final response = await datasource.notificationListing();
//     print(response); 
//     final notificationListingResponse = NotificationListResponseModel.fromJson(response);
//     return notificationListingResponse;
//   }

  
//   @override
//   Future<NotificationListResponseEntity> notificationRead({required int notificationId})async {
//    final response = await datasource.notificationRead(notificationId: notificationId);
//     print(response); 
//     final notificationListingResponse = NotificationListResponseModel.fromJson(response);
//     return notificationListingResponse;
//   }
// }