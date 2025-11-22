// import 'package:easyfy_care_patient/config.dart';

// import '../../../../core/network/api_client.dart';
// import '../../../../core/network/urls.dart';

// class DoctorDatasource {
//   final ApiClient apiClient;

//   DoctorDatasource({required this.apiClient});

//   Future<Map<String, dynamic>> getDoctor({required String status}) async {
//     return await apiClient.get(path: "$getDoctorByStatusUrl?status=$status");
//   }

//   Future<Map<String, dynamic>> allocateDoctor(
//       {required String doctorId}) async {
//     return await apiClient.post(
//         path:
//             "$allocateDoctorUrl?doctorId=$doctorId&patientId=${patientDetails?.id ?? ""}");
//   }
// }
