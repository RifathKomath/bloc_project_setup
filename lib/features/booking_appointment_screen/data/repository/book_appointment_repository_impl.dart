// import '../../domain/repository/book_appointment_repo.dart';
// import '../datasource/book_appointment_data_source.dart';

// import '../models/nearby_treatment_centers_response.dart';

// class BookAppointmentRepositoryImpl implements BookAppointmentRepository {
//   final BookAppointmentDataSource datasource;
//   BookAppointmentRepositoryImpl({required this.datasource});

//   @override
//   Future<GetTreatmentCentersResponse> nearByTreatmentCentersListing() async {
//     final response = await datasource.nearByTreatmentCentersListing();
//     print(response);
//     final treatmentCenterListingResponse =
//         GetTreatmentCentersResponse.fromJson(response);
//     return treatmentCenterListingResponse;
//   }
// }
