// import 'dart:convert';

// import 'package:easyfy_care_patient/features/splash_screen/data/datasource/splash_datasource.dart';
// import 'package:easyfy_care_patient/features/splash_screen/data/model/get_user_by_id_model.dart';
// import 'package:easyfy_care_patient/features/splash_screen/data/model/qr_tracking_response.dart';
// import 'package:easyfy_care_patient/features/splash_screen/domain/repository/splash_repository.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/utils/shared_pref.dart';
// import '../../domain/entity/qr_entity.dart';
// import '../model/qr_request.dart';

// class SplashRepositoryImpl implements SplashRepository {
//   final SplashDatasource datasource;

//   SplashRepositoryImpl({required this.datasource});
//   @override
//   Future<GetUserByIdModel> getUser({required String id}) async {
//     final response = await datasource.getUser(id: id);
//     final userResponse = GetUserByIdModel.fromJson(response);
//     final userdata = userResponse.data;
//     final SharedPref sharedPref = SharedPref();
//     await sharedPref.save(key: "patientDetails", value: userdata);
//     await sharedPref.getUserData();

//     return userResponse;
//   }

//   @override
// Future<QrTrackingResponseEntity> qrTracking({required QrRequest qrRequest}) async {
//   final response = await datasource.qrTracking(qrRequest: qrRequest);
//   final qrTrackingResponse = QrTrackingResponse.fromJson(response);
//   final docData = qrTrackingResponse.data;

//   final SharedPref sharedPref = SharedPref();

//   if (docData != null) {
//     debugPrint(" Saving doctorDetails: ${jsonEncode(docData.doctorInfo!.toJson())}");
//     await sharedPref.save(key: "doctorDetails", value: docData.doctorInfo!);
//   } else {
//     debugPrint(" docData is null");
//   }

//   return qrTrackingResponse;
// }

// }
