// import 'dart:io';

// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_event.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_state.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/widgets/success_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path/path.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

// import '../../../../app.dart';
// import '../../../../core/network/notification_services.dart';
// import '../../data/model/patient_register_request_model.dart';
// import '../../domain/usecase/register_usecase.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final RegisterUseCase registerUseCase;
//   final NotificationService notificationService;
//   RegisterBloc(
//       {required this.registerUseCase, required this.notificationService})
//       : super(const RegisterState()) {
//     on<AadhaarChanged>((event, emit) {
//       emit(state.copyWith(aadhaar: event.aadhaar));
//     });
//     on<TermsAndConditionGetEvent>(termsListing);
//     on<FullNameChanged>((event, emit) {
//       emit(state.copyWith(fullName: event.name));
//     });

//     on<EmailChanged>((event, emit) {
//       emit(state.copyWith(email: event.email));
//     });
//     on<PlaceChanged>((event, emit) {
//       emit(state.copyWith(place: event.place));
//     });

//     on<EnterManuallyPressedEvent>((event, emit) {
//       emit(state.copyWith(isManualEntry: true));
//     });

//     on<BackToAadhaarPressedEvent>((event, emit) {
//       emit(state.copyWith(isManualEntry: false));
//     });

//     on<DobChanged>((event, emit) {
//       emit(state.copyWith(dob: event.dob));
//     });

//     on<GenderSelected>((event, emit) {
//       emit(state.copyWith(gender: event.gender));
//     });

//     on<MaritalStatusSelected>((event, emit) {
//       emit(state.copyWith(maritalStatus: event.status));
//     });

//     on<TermsStatusChangeEvent>(termsStatusChangeHandler);

//     on<BloodGroupSelected>((event, emit) {
//       emit(state.copyWith(bloodGroup: event.group));
//     });

//     on<FetchDetailsPressed>((event, emit) async {
//       // TODO: call Aadhaar API here
//     });
//     on<MobileChanged>((event, emit) {
//       emit(state.copyWith(mobile: event.mobile));
//     });
//     on<ClearErrorEvent>((event, emit) {
//       emit(state.copyWith(error: ''));
//     });
//     on<FileSelectedEvent>(onFileSelected);
//     on<FileUploadRequestedEvent>(onFileUploadRequested);
//     on<FileUploadResetEvent>(onFileUploadReset);

//     on<SubmitPressed>((event, emit) async {
//       // Validate fields before submission
//       try {
//         emit(state.copyWith(isSubmitting: true, error: ''));

//         final userRequest = UserRequest(
//             place: state.place,
//             fullName: state.fullName,
//             email: state.email,
//             dob: state.dob != null
//                 ? '${state.dob!.year}-${state.dob!.month.toString().padLeft(2, '0')}-${state.dob!.day.toString().padLeft(2, '0')}'
//                 : '',
//             gender: _genderMap[state.gender] ?? "",
//             maritialStatus: _maritalStatusMap[state.maritalStatus] ?? "",
//             bloodGroup: state.bloodGroup,
//             doctorId: event.doctorId ?? 0,
//             isQrRegistered: doctorDetails == null ? false : true,
//             mobile: state.mobile);

//         final response =
//             await registerUseCase.registerUser(userRequest: userRequest);

//         print("response................${response}");

//         if (response.status == 200 || response.status == 201) {
//           _handleNotificationLogic(id: response.data?.id ?? 0);
//           emit(state.copyWith(
//             isSubmitting: false,
//             isSuccess: true,
//             userData: response,
//           ));
          
//         } else {
//           print("Error in response: ${response.message}");
//           emit(state.copyWith(
//             isSubmitting: false,
//             isSuccess: false,
//             userData: response,
//             error: response.message ?? 'Registration failed',
//           ));
//         }
//       } catch (e) {
//         print("Exception caught: ${e.toString()}");
//         emit(state.copyWith(
//           isSubmitting: false,
//           error: 'Registration failed: ${e.toString()}',
//         ));
//       }
//     });
//   }
//   Future<void> _handleNotificationLogic({required int id}) async {
//     try {
//       await notificationService.init();
//       final token = await notificationService.getToken();
//       if (token != null) {
//         final response = await registerUseCase.getNotification(fcmToken: token,id: id);
//         if (response.success == true) {
//           print("Notification token submitted successfully");
//         } else {
//           print("Failed to submit token");
//         }
//       }
//     } catch (e) {
//       print("Notification error: $e");
//     }
//   }

//   void termsListing(
//       TermsAndConditionGetEvent event, Emitter<RegisterState> emit) async {
//     try {
//       emit(state.copyWith(
//         isLoading: true,
//         error: '',
//       ));

//       final termsList = await registerUseCase.getTermsAndCondition();
//       print("USECASE RESULT DATA: ${termsList.data}");

//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: true,
//         termsAndConditionList: termsList.data,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: false,
//         error: e.toString(),
//       ));
//     }
//   }

//   void termsStatusChangeHandler(
//       TermsStatusChangeEvent event, Emitter<RegisterState> emit) async {
//     try {
//       emit(state.copyWith(isLoading: true, error: ''));

//       final response =
//           await registerUseCase.termsStatusChange(id: event.userId);

//       print("Terms status changed: $response");

//       if (response.status == 200 || response.status == 201) {
//         emit(state.copyWith(
//           isLoading: false,
//           isSuccess: true,
//         ));

//         final bloc = this;

//         navigatorKey.currentState?.push(
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: bloc,
//               child: SuccessScreen(userId: event.userId),
//             ),
//           ),
//         );
//       } else {
//         emit(state.copyWith(
//           isLoading: false,
//           isSuccess: false,
//           error: response.message ?? 'Failed to update terms status',
//         ));
//       }
//     } catch (e) {
//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: false,
//         error: 'Failed to update terms status: ${e.toString()}',
//       ));
//     }
//   }

//   Future<void> onFileSelected(
//     FileSelectedEvent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(
//       selectedFile: event.file,
//       selectedDocumentType: event.documentType,
//     ));
//   }

//   Future<void> onFileUploadRequested(
//     FileUploadRequestedEvent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     if (event.file == null || event.documentType.isEmpty) {
//       emit(state.copyWith(error: 'No file selected'));
//       return;
//     }
//     print("FileUploadRequestedEvent triggered");

//     emit(state.copyWith(isUploading: true));

//     try {
//       final response = await registerUseCase.fileUpload(
//         userId: event.userId,
//         documentType: event.documentType,
//         fileSize: event.fileSize,
//         treatmentCycle: event.treatmentCycle,
//         file: event.file,
//       );

//       final updatedDocs = List<String>.from(state.uploadedDocumentTypes ?? []);
//       if (!updatedDocs.contains(event.documentType)) {
//         updatedDocs.add(event.documentType);
//       }

//       emit(state.copyWith(
//         isUploading: false,
//         fileUploadResponse: response,
//         fileUploadSuccess: true,
//         uploadedDocumentTypes: updatedDocs,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isUploading: false,
//         fileUploadSuccess: false,
//         error: 'File upload failed: ${e.toString()}',
//       ));
//     }
//   }

//   void onFileUploadReset(
//     FileUploadResetEvent event,
//     Emitter<RegisterState> emit,
//   ) {
//     emit(state.copyWith(
//       selectedFile: null,
//       selectedDocumentType: null,
//       fileUploadResponse: null,
//     ));
//   }

//   final Map<String, String> _genderMap = {
//     'Male': 'M',
//     'Female': 'F',
//     'Others': 'O',
//   };

//   final Map<String, String> _maritalStatusMap = {
//     'Single': 'SINGLE',
//     'Married': 'MARRIED',
//     'Divorced': 'DIVORCED',
//   };
// }
