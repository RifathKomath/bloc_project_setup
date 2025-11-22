// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/network/notification_services.dart';
// import '../../domain/usecase/home_usecase.dart';
// import 'home_bloc_event.dart';
// import 'home_bloc_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final HomeUsecases usecases;
//   final NotificationService notificationService;

//   HomeBloc({required this.usecases, required this.notificationService})
//       : super(HomeState(focusedIndex: 0)) {
//     on<CardFocusedChanged>((event, emit) {
//       emit(state.copyWith(focusedIndex: event.focusedIndex));
//     });

//     on<InitializeNotificationEvent>((event, emit) async {
//       debugPrint("InitializeNotificationEvent received");
//       await _handleNotificationLogic();
//     });
//     on<AllocatedDoctorEvent>((event, emit) async {
//       await _getAllocatedDoctor();
//     });
//   }

//   Future<void> _handleNotificationLogic() async {
//     try {
//       await notificationService.init();
//       final token = await notificationService.getToken();
//       if (token != null) {
//         final response = await usecases.getNotification(fcmToken: token);
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

//   Future<void> _getAllocatedDoctor() async {
//     try {
//       final response = await usecases.getAllocatedDoctor();
//       if (response.success == true && response.data!=null && (response.data?.isNotEmpty==true)) {
//         emit(state.copyWith(isDoctorAllocated: true,doctorDetails: response.data![0]));
//       } else {
//         emit(state.copyWith(isDoctorAllocated: false));
//       }
//     } catch (e) {
//       print("Notification error: $e");
//         emit(state.copyWith(isDoctorAllocated: false));

//     }
//   }
// }
