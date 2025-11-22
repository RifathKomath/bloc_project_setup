// import 'dart:typed_data';

// import 'package:equatable/equatable.dart';

// class AccountState extends Equatable {
//   final Uint8List? imageBytes;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isError;
//   final bool isloadError;
//   final String error;
//   final bool isUploading;
//   final bool isUploadSuccess;
//   final String uploadMessage;

//   const AccountState({
//     this.imageBytes,
//     this.isLoading = false,
//     this.isSuccess = false,
//     this.isError = false,
//     this.isloadError=false,
//     this.error = '',
//     this.isUploading = false,
//     this.isUploadSuccess = false,
//     this.uploadMessage = '',
//   });

//   AccountState copyWith({
//     Uint8List? imageBytes,
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isError,
//     bool? isloadError,
//     String? error,
//     bool? isUploading,
//     bool? isUploadSuccess,
//     String? uploadMessage,
//   }) {
//     return AccountState(
//       imageBytes: imageBytes ?? this.imageBytes,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isError: isError ?? this.isError,
//       error: error ?? this.error,
//       isUploading: isUploading ?? this.isUploading,
//       isUploadSuccess: isUploadSuccess ?? this.isUploadSuccess,
//       uploadMessage: uploadMessage ?? this.uploadMessage,
//       isloadError: isloadError?? this.isloadError
//     );
//   }

//   @override
//   List<Object?> get props => [
//     imageBytes,
//     isLoading,
//     isSuccess,
//     isError,
//     error,
//     isUploading,
//     isUploadSuccess,
//     isloadError,
//     uploadMessage,
//   ];
// }