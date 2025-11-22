// import 'dart:io';
// import 'dart:typed_data';

// import 'package:dio/dio.dart';
// import 'package:easyfy_care_patient/core/network/urls.dart';

// import '../../../../core/network/api_client.dart';

// class AccountDatasource {
//   final ApiClient apiClient;

//   AccountDatasource({required this.apiClient});

//   Future<Map<String, dynamic>> uploadProfileImage(
//       {required File file, required String id}) async {
//     final fileName = file.path.split('/').last;
//     final response = await apiClient.post(
//       path: '$uploadProfileUrl?id=$id',
//       data: {
//         'file': await MultipartFile.fromFile(file.path, filename: fileName)
//       },
//       isFormData: true,
//     );

//     return response;
//   }

 

//    Future<Uint8List> downloadProfileImage({required int id}) async {
//     final response = await apiClient.get(
//       path: "$downloadProfileUrl?id=$id",
//       responseType: true, // Set to true to get binary response
//     );

//     // Now response should be Uint8List directly
//     return response as Uint8List;
//   }
// }
