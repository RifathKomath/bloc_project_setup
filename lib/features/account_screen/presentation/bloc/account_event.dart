// part of 'account_bloc.dart';

// abstract class AccountEvent extends Equatable {
//   const AccountEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadProfileImageEvent extends AccountEvent {
//   final int userId;

//   const LoadProfileImageEvent(this.userId);

//   @override
//   List<Object> get props => [userId];
// }

// class UploadProfileImageEvent extends AccountEvent {
//   final File file;
//   final String userId;

//   const UploadProfileImageEvent({required this.file, required this.userId});

//   @override
//   List<Object> get props => [file, userId];
// }