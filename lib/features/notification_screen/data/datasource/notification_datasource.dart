// import 'package:easyfy_care_patient/config.dart';
// import '../../../../core/network/api_client.dart';
// import '../../../../core/network/urls.dart';

// class NotificationDatasource {
//   final ApiClient apiClient;

//   NotificationDatasource({required this.apiClient});

//   Future<Map<String, dynamic>> notificationListing() async {
//     final response = await apiClient.get(
//         path:
//             "$getNotificationListingUrl?userId=${patientDetailsFromRegister?.id ?? patientDetails?.id}&userType=PATIENT");
//     print(response);
//     return response;
//   }

//   Future<Map<String, dynamic>> notificationRead(
//       {required int notificationId}) async {
//     final response = await apiClient.put(
//         path: "$readNotificationUrl?notificationId=$notificationId");
//     print(response);
//     return response;
//   }

//   Future<Map<String, dynamic>> deleteAllNotification() async {
//     final response = await apiClient.put(
//         path:
//             "$deleteAllNotificationsUrl?userId=${patientDetails?.id}&userType=PATIENT");
//     print(response);
//     return response;
//   }
// }
