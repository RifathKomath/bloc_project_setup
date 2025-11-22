// import 'dart:io';
// import 'package:equatable/equatable.dart';
// import '../../domain/entity/file_upload_entity.dart';
// import '../../domain/entity/patient_register_entity.dart';
// import '../../domain/entity/terms_and_condition_entity.dart';

// class RegisterState extends Equatable {
//   final String aadhaar;
//   final String fullName;
//   final String email;
//   final String mobile;
//   final DateTime? dob;
//   final String gender;
//   final String maritalStatus;
//   final String bloodGroup;
//   final bool fileUploadSuccess;
//   final bool isManualEntry;

//   final String place;
//   final bool isSubmitting;
//   final bool isSuccess;
//   final String error;
//   final PatientRegisterResponse? userData;
//   final bool isLoading;
//   final List<TermsEntity>? termsAndConditionList;
//   final File? selectedFile;
//   final List<String>? uploadedDocumentTypes;

//   final String? selectedDocumentType;
//   final bool isUploading;
//   final FileUploadEntity? fileUploadResponse;

//   const RegisterState(
//       {this.aadhaar = '',
//       this.fullName = '',
//       this.uploadedDocumentTypes = const [],
//       this.mobile = "",
//       this.fileUploadSuccess = false,
//       this.isManualEntry = false,
//       this.email = '',
//       this.place = "",
//       this.dob,
//       this.gender = '',
//       this.maritalStatus = '',
//       this.bloodGroup = '',
//       this.isSubmitting = false,
//       this.isLoading = false,
//       this.isSuccess = false,
//       this.error = '',
//       this.userData,
//       this.termsAndConditionList,
//       this.selectedFile,
//       this.selectedDocumentType,
//       this.isUploading = false,
//       this.fileUploadResponse});

//   RegisterState copyWith({
//     String? aadhaar,
//     String? fullName,
//     String? email,
//     bool? fileUploadSuccess,
//     bool? isManualEntry,
//     final List<String>? uploadedDocumentTypes,
//     DateTime? dob,
//     final List<TermsEntity>? termsAndConditionList,
//     String? gender,
//     String? place,
//     String? mobile,
//     String? maritalStatus,
//     bool? isLoading,
//     String? bloodGroup,
//     bool? isSubmitting,
//     bool? isSuccess,
//     String? error,
//     PatientRegisterResponse? userData,
//     File? selectedFile,
//     String? selectedDocumentType,
//     bool? isUploading,
//     FileUploadEntity? fileUploadResponse,
//   }) {
//     return RegisterState(
//       aadhaar: aadhaar ?? this.aadhaar,
//       fullName: fullName ?? this.fullName,
//       isManualEntry: isManualEntry ?? this.isManualEntry,
//       email: email ?? this.email,
//       place: place ?? this.place,
//       dob: dob ?? this.dob,
//       fileUploadSuccess: fileUploadSuccess ?? this.fileUploadSuccess,
//       gender: gender ?? this.gender,
//       isLoading: isLoading ?? this.isLoading,
//       termsAndConditionList:
//           termsAndConditionList ?? this.termsAndConditionList,
//       maritalStatus: maritalStatus ?? this.maritalStatus,
//       bloodGroup: bloodGroup ?? this.bloodGroup,
//       isSubmitting: isSubmitting ?? this.isSubmitting,
//       isSuccess: isSuccess ?? this.isSuccess,
//       error: error ?? this.error,
//       userData: userData ?? this.userData,
//       mobile: mobile ?? this.mobile,
//       selectedFile: selectedFile ?? this.selectedFile,
//       uploadedDocumentTypes:
//           uploadedDocumentTypes ?? this.uploadedDocumentTypes,
//       selectedDocumentType: selectedDocumentType ?? this.selectedDocumentType,
//       isUploading: isUploading ?? this.isUploading,
//       fileUploadResponse: fileUploadResponse ?? this.fileUploadResponse,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         aadhaar,
//         fullName,
//         email,
//         dob,
//         fileUploadSuccess,
//         gender,
//         uploadedDocumentTypes ?? [],
//         isManualEntry,
//         maritalStatus,
//         bloodGroup,
//         isSubmitting,
//         place,
//         isSuccess,
//         error,
//         userData,
//         mobile,
//         selectedFile,
//         selectedDocumentType,
//         isUploading,
//         fileUploadResponse,
//       ];
// }
