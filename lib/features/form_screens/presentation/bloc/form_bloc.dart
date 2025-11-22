// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'form_event.dart';
// import 'form_state.dart';

// class FormBloc extends Bloc<FormEvent, ConsentFormState> {
//   FormBloc() : super(ConsentFormState.initial()) {
//     on<UpdateDoctorName>((event, emit) async {
//       emit(state.copyWith(doctorName: event.doctorName));
//     });

//     on<UpdateDoctorId>((event, emit) async {
//       emit(state.copyWith(doctorId: event.doctorId));
//     });

//     on<UpdateSpecialization>((event, emit) async {
//       emit(state.copyWith(specialization: event.specialization));
//     });

//     on<UpdatePatientFullName>((event, emit) async {
//       emit(state.copyWith(patientFullName: event.patientFullName));
//     });

//     on<UpdatePatientDob>((event, emit) async {
//       emit(state.copyWith(dob: event.dob));
//     });

//     on<UpdatePatientContact>((event, emit) async {
//       emit(state.copyWith(contact: event.contact));
//     });

//     on<UpdateDate>((event, emit) async {

//       emit(state.copyWith(date: event.date));
//     });

//     on<UpdateLocation>((event, emit) async {
//       emit(state.copyWith(location: event.location));
//     });

//     on<ShowSignature>((event, emit) {
//   emit(state.copyWith(showSignature: true));
// });

// on<ClearSignature>((event, emit) {
//   emit(state.copyWith(showSignature: false));
// });

//   }
// }
