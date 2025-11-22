// import 'package:easyfy_care_patient/features/home_screen/data/model/allocated_doctor_model.dart';
// import 'package:easyfy_care_patient/features/home_screen/domain/entity/allocated_doctor_entity.dart';

// import '../../domain/entity/fcm_response_entity.dart';
// import '../../domain/repository/home_repository.dart';
// import '../datasource/home_datasource.dart';
// import '../model/notification_fcm_response.dart';

// class HomeRepositoryImpl implements HomeRepository {
//   final HomeDatasource datasource;
//   HomeRepositoryImpl({required this.datasource});

//   @override
//   Future<CommonResponseEntity> getNotification({required dynamic fcmToken}) async {
//     final response = await datasource.getNotification(fcmToken: fcmToken);
//     final enableNotificationResponse = CommonResponse.fromJson(
//       response,
//     );
//     return enableNotificationResponse;
//   }

//   @override
//   Future<AllocatedDoctorResponseEntity> getAllocatedDoctor()async {
//     final response = await datasource.getAllocatedDoctor();
//     final allocatedDoctorResponse = AllocatedDoctorModel.fromJson(
//       response,
//     );
//     return allocatedDoctorResponse;
//   }
// }
