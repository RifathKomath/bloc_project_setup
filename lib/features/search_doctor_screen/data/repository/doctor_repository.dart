// import 'package:easyfy_care_patient/features/search_doctor_screen/data/datasource/doctor_datasource.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/data/model/doctor_allocation_response.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/data/model/doctor_list_model.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/domain/entity/doctor_allocation_entity.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/domain/repository/doctor_repository.dart';

// class DoctorRepositoryImpl implements DoctorRepository {
//   final DoctorDatasource datasource;

//   DoctorRepositoryImpl({required this.datasource});
//   @override
//   Future<DoctorListModel> getDoctor({required String status}) async{
//     final response = await datasource.getDoctor(status: status);
//     final doctorResponse = DoctorListModel.fromJson(response);
//     return doctorResponse;
//   }

//   @override
//   Future<DoctorAllocationModel> allocateDoctor({required String doctorId}) async{
//     final response = await datasource.allocateDoctor(doctorId: doctorId);
//     final doctorAllocateResponse = DoctorAllocationModel.fromJson(response);
//     return doctorAllocateResponse;
//   }

// }