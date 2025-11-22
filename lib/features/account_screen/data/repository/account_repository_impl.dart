// import 'dart:io';
// import 'dart:typed_data';

// import '../../../home_screen/data/model/notification_fcm_response.dart';
// import '../../../home_screen/domain/entity/fcm_response_entity.dart';
// import '../../domain/repository/account_repository.dart';
// import '../datasource/accout_datasource.dart';

// class AccountRepositoryImpl implements AccountRepository {
//   final AccountDatasource datasource;

//   AccountRepositoryImpl({required this.datasource});

//   @override
//    Future<CommonResponseEntity> uploadProfileImage({required File file,required String id}) async {
//     final response = await datasource.uploadProfileImage(file: file, id: id);
//     final profileUploadResponse = CommonResponse.fromJson(
//       response,
//     );
//     return profileUploadResponse;
//   }

//   @override
//    Future<Uint8List> getProfileImage({required int userId}) async {
//     try {
//       // The datasource now returns Uint8List directly
//       final Uint8List imageData = await datasource.downloadProfileImage(id: userId);
//       return imageData;
//     } catch (e) {
//       // Handle errors or return empty bytes if needed
//       print("Error downloading profile image: $e");
//       return Uint8List(0); // Return empty bytes array on error
//     }
//   }
  
// }