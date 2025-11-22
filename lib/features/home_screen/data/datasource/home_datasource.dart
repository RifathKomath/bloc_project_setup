// import 'package:easyfy_care_patient/config.dart';

// import '../../../../core/network/api_client.dart';
// import '../../../../core/network/urls.dart';

// class HomeDatasource {
//   final ApiClient apiClient;
//   HomeDatasource({required this.apiClient});

//   Future<Map<String, dynamic>> getNotification({
//     required String fcmToken,
//   }) async {
//     final response = await apiClient.post(
//       path:
//           "$getPushNotificationUrl?userId=${patientDetails?.id}&userType=PATIENT&fcmToken=$fcmToken",
//     );
//     print(response);
//     return response;
//   }

//   Future<Map<String, dynamic>> getAllocatedDoctor() async {
//     final response = await apiClient.get(
//       path: "$getallocatedDoctorUrl?patientId=${patientDetails?.id}",
//     );
//     print(response);
//     return response;
//   }
// }
