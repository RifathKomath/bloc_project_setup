// import 'package:easyfy_care_patient/core/network/urls.dart';

// import '../../../../core/network/api_client.dart';

// class OtpRemoteDataSource {
//   final ApiClient apiClient;

//   OtpRemoteDataSource({required this.apiClient});

//   Future<Map<String, dynamic>> sentOtp({required String phoneNumber}) async {
//     return await apiClient
//         .post(path: "$sentOtpUrl", data: {"phoneno": phoneNumber,"userType":"PATIENT"});
//   }

//   Future<Map<String, dynamic>> verifyOtp(
//       {required String phoneNumber, required String otp}) async {
//     return await apiClient.post(
//         path: "$verifyOtpUrl", data: {"phoneno": phoneNumber, "otp": otp,"userType":"PATIENT"});
//   }

  

//   Future<Map<String, dynamic>> resentOtp({
//     required String phoneNumber,
//   }) async {
//     return await apiClient
//         .post(path: "$resentOtpUrl", data: {"phoneno": phoneNumber,"userType":"PATIENT"});
//   }
// }
