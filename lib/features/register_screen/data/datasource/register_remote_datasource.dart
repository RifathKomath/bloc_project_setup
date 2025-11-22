// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:easyfy_care_patient/core/network/urls.dart';

// import '../../../../config.dart';
// import '../../../../core/network/api_client.dart';
// import '../model/patient_register_request_model.dart';

// class RegisterRemoteDatasource {
//   final ApiClient apiClient;

//   RegisterRemoteDatasource({required this.apiClient});

//   Future<Map<String, dynamic>> registerUser(
//       {required UserRequest userRequest}) async {
//     return await apiClient.post(
//         path: registerUserUrl, data: userRequest.toJson());
//   }

//   Future<Map<String, dynamic>> getNotification({
//     required String fcmToken,required num id
//   }) async {
//     final response = await apiClient.post(
//       path:
//           "$getPushNotificationUrl?userId=${patientDetails?.id ?? id}&userType=PATIENT&fcmToken=$fcmToken",
//     );
//     print(response);
//     return response;
//   }

//   Future<Map<String, dynamic>> getTermsAndCondition() async {
//     final response = await apiClient.get(path: "terms");
//     print(response);
//     return response;
//   }

//   Future<Map<String, dynamic>> termsStatusChange({required int? id}) async {
//     return await apiClient.put(path: "$termsStatusChangeUrl$id");
//   }

//   Future<Map<String, dynamic>> fileUpload({
//     required int? userId,
//     required String? documentType,
//     required num? fileSize,
//     required int? treatmentCycle,
//     required File? file,
//   }) async {
//     final fileName = file!.path.split('/').last;

//     final formData = {
//       'file': await MultipartFile.fromFile(file.path, filename: fileName),
//     };

//     final response = await apiClient.post(
//       path: "$fileUploadUrl"
//           "?patientId=$userId"
//           "&documentType=$documentType"
//           "&treatmentCycle=$treatmentCycle"
//           "&fileSize=$fileSize",
//       data: formData,
//       isFormData: true,
//     );

//     print("Upload response: $response");
//     return response;
//   }
// }
