// import 'package:bloc/bloc.dart';
// import 'package:easyfy_care_patient/features/notification_screen/domain/usecase/notification_usecase.dart';
// import 'package:equatable/equatable.dart';

// import 'notification_state.dart';

// part 'notification_event.dart';
// class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
//   final NotificationUsecase usecase;
//   NotificationBloc({required this.usecase}) : super(NotificationState()) {
    

//     on<NotificationLisingEvent>(notificationListing);
//     on<NotificationReadEvent>(notificationRead);

  

//     on<ToggleSelectAllEvent>((event, emit) {
//       emit(state.copyWith(isSelectAll: event.isSelectAll));
//     });

//     on<TemporaryNotificationRemoveEvent>(onTemporaryNotificationRemove);

//     on<DeleteAllNotificationsEvent>(deleteAllNotifications);
//   }

//   Future<void> notificationRead(
//     NotificationReadEvent event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       final result = await usecase.notificationRead(
//         notificationId: event.notificationId,
//       );

//       if (result.success == true) {
//         add(NotificationLisingEvent());
//       } else {
//         emit(state.copyWith(error: "Failed to update notification status"));
//       }
//     } catch (e) {
//       print("failed to updated he status");
//     }
//   }

//   Future<void> deleteAllNotifications(
//     DeleteAllNotificationsEvent event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       emit(state.copyWith(isLoading: true));
//       final result = await usecase.deleteAllNotification();
//       if (result.success == true) {
//         add(NotificationLisingEvent());
//       } else {
//         emit(
//           state.copyWith(
//             error: result.message ?? "Failed to delete notifications",
//           ),
//         );
//       }
//     } catch (e) {
//       emit(state.copyWith(error: e.toString()));
//     } finally {
//       emit(state.copyWith(isLoading: false));
//     }
//   }

//   Future<void> notificationListing(
//     NotificationLisingEvent event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       emit(state.copyWith(isLoading: true, error: ''));

//       final notificationList = await usecase.notificationListing();
//       print("USECASE RESULT DATA: ${notificationList.data}");

//       emit(
//         state.copyWith(
//           isLoading: false,
//           isSuccess: true,
//           notificationsList:
//               notificationList.data!.isNotEmpty ? notificationList.data : [],
//         ),
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(isLoading: false, isSuccess: false, error: e.toString()),
//       );
//     }
//   }

//   void onTemporaryNotificationRemove(
//     TemporaryNotificationRemoveEvent event,
//     Emitter<NotificationState> emit,
//   ) {
//     final updatedList = [...?state.notificationsList];
//     updatedList.removeWhere((element) => element.id == event.notificationId);
//     emit(state.copyWith(notificationsList: updatedList));
//   }


// }
