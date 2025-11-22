// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// import '../../domain/usecase/account_usecase.dart';
// import 'account_state.dart';

// part 'account_event.dart';

// class AccountBloc extends Bloc<AccountEvent, AccountState> {
//   final AccountUsecase usecase;

//   AccountBloc({required this.usecase}) : super(const AccountState()) {
//     on<LoadProfileImageEvent>(_onLoadImage);
//     on<UploadProfileImageEvent>(_onUploadImage);
//   }

//   Future<void> _onLoadImage(
//       LoadProfileImageEvent event, Emitter<AccountState> emit) async {
//     emit(state.copyWith(isLoading: true, error: '', isSuccess: false));
//     try {
//       final image = await usecase.getProfileImage(userId: event.userId);
      
//       if (image.isEmpty) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//       } else {
//         // Process image for better CircleAvatar display
//         final processedImage = await _processImageForCircleAvatar(image);
        
//         emit(state.copyWith(
//           isLoading: false,
//           isSuccess: true,
//           imageBytes: processedImage,
//         ));
//       }
//     } catch (e) {
//       print(".........error ..........................$e");
//       emit(state.copyWith(
//         isLoading: false,
//         isloadError: true,
//         error: "Failed to load image: $e",
//       ));
//     }
//   }

//   Future<void> _onUploadImage(
//       UploadProfileImageEvent event, Emitter<AccountState> emit) async {
//     emit(state.copyWith(
//       isUploading: true,
//       isUploadSuccess: false,
//       uploadMessage: '',
//     ));
//     try {
//       // Compress the image before uploading
//       final compressedFile = await _compressImage(event.file);
      
//       // Upload the compressed image
//       await usecase.uploadProfileImage(file: compressedFile, id: event.userId);
      
//       // Reload the profile image
//       final image = await usecase.getProfileImage(userId: int.parse(event.userId));
      
//       // Process image for better CircleAvatar display
//       final processedImage = await _processImageForCircleAvatar(image);
      
//       emit(state.copyWith(
//         isUploading: false,
//         isUploadSuccess: true,
//         uploadMessage: 'Profile image updated successfully',
//         imageBytes: processedImage, // Use processed image
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isUploading: false,
//         isError: true,
//         error: "Failed to upload image: $e",
//       ));
//     }
//   }

//   // NEW: Process image specifically for CircleAvatar display
//   Future<Uint8List> _processImageForCircleAvatar(Uint8List imageBytes) async {
//     try {
//       // Compress to optimal size for CircleAvatar
//       final result = await FlutterImageCompress.compressWithList(
//         imageBytes,
//         minHeight: 200, // Small size perfect for CircleAvatar
//         minWidth: 200,
//         quality: 90, // High quality to avoid artifacts
//         format: CompressFormat.jpeg,
//       );
      
//       return result;
//     } catch (e) {
//       print("Error processing image for CircleAvatar: $e");
//       return imageBytes; // Return original if processing fails
//     }
//   }

//   Future<File> _compressImage(File file) async {
//     // Get file extension (jpg, png, etc.)
//     final extension = path.extension(file.path).toLowerCase();
    
//     // Create temp directory for storing compressed image
//     final directory = await getTemporaryDirectory();
//     final targetPath = path.join(directory.path, 'compressed_profile_${DateTime.now().millisecondsSinceEpoch}${extension}');
    
//     // Compress settings
//     CompressFormat format;
//     int quality;
    
//     switch (extension) {
//       case '.png':
//         format = CompressFormat.jpeg; // Convert PNG to JPEG to avoid transparency issues
//         quality = 90;
//         break;
//       case '.heic':
//         format = CompressFormat.jpeg; // Convert to JPEG for better compatibility
//         quality = 85;
//         break;
//       case '.webp':
//         format = CompressFormat.jpeg; // Convert to JPEG
//         quality = 85;
//         break;
//       case '.jpg':
//       case '.jpeg':
//       default:
//         format = CompressFormat.jpeg;
//         quality = 85;
//         break;
//     }

//     // Compress file with better settings
//     final result = await FlutterImageCompress.compressAndGetFile(
//       file.path,
//       targetPath,
//       quality: quality,
//       minWidth: 400, // Good size for upload
//       minHeight: 400,
//       format: format,
//       keepExif: false,
//       autoCorrectionAngle: true,
//     );

//     if (result == null) {
//       return file;
//     }
    
//     return File(result.path);
//   }
// }