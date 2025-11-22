// import 'dart:io';

// import 'package:equatable/equatable.dart';

// abstract class RegisterEvent extends Equatable {
//   const RegisterEvent();

//   @override
//   List<Object?> get props => [];
// }

// class AadhaarChanged extends RegisterEvent {
//   final String aadhaar;

//   const AadhaarChanged(this.aadhaar);

//   @override
//   List<Object?> get props => [aadhaar];
// }

// class FullNameChanged extends RegisterEvent {
//   final String name;

//   const FullNameChanged(this.name);

//   @override
//   List<Object?> get props => [name];
// }

// class PlaceChanged extends RegisterEvent {
//   final String place;

//   const PlaceChanged(this.place);

//   @override
//   List<Object?> get props => [place];
// }

// class EmailChanged extends RegisterEvent {
//   final String email;

//   const EmailChanged(this.email);

//   @override
//   List<Object?> get props => [email];
// }

// class DobChanged extends RegisterEvent {
//   final DateTime dob;

//   const DobChanged(this.dob);

//   @override
//   List<Object?> get props => [dob];
// }

// class MobileChanged extends RegisterEvent {
//   final String mobile;

//   MobileChanged(this.mobile);

//   @override
//   List<Object?> get props => [mobile];
// }

// class GenderSelected extends RegisterEvent {
//   final String gender;

//   const GenderSelected(this.gender);

//   @override
//   List<Object?> get props => [gender];
// }

// class MaritalStatusSelected extends RegisterEvent {
//   final String status;

//   const MaritalStatusSelected(this.status);

//   @override
//   List<Object?> get props => [status];
// }

// class BloodGroupSelected extends RegisterEvent {
//   final String group;

//   const BloodGroupSelected(this.group);

//   @override
//   List<Object?> get props => [group];
// }

// class FetchDetailsPressed extends RegisterEvent {}

// class SubmitPressed extends RegisterEvent {
//   final int? doctorId;

//   const SubmitPressed({required this.doctorId});
// }

// class ClearErrorEvent extends RegisterEvent {}

// class TermsAndConditionGetEvent extends RegisterEvent {}

// class TermsStatusChangeEvent extends RegisterEvent {
//   final int? userId;

//   const TermsStatusChangeEvent({required this.userId});
// }

// class FileSelectedEvent extends RegisterEvent {
//   final File file;
//   final String documentType;

//   const FileSelectedEvent(this.file, this.documentType);

//   @override
//   List<Object?> get props => [file, documentType];
// }

// class FileUploadRequestedEvent extends RegisterEvent {
//   final String documentType;
//   final int? userId;
//   final num? fileSize;
//   final int? treatmentCycle;
//   final File? file;
//   const FileUploadRequestedEvent(
//       {required this.documentType,
//       required this.userId,
//       required this.file,
//       required this.fileSize,
//       required this.treatmentCycle});

//   @override
//   List<Object?> get props => [documentType];
// }

// class FileUploadResetEvent extends RegisterEvent {}

// class EnterManuallyPressedEvent extends RegisterEvent {}

// class BackToAadhaarPressedEvent extends RegisterEvent {}
