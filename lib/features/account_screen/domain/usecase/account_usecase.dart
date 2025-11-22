// import 'dart:io';
// import 'dart:typed_data';

// import 'package:easyfy_care_patient/features/home_screen/domain/entity/fcm_response_entity.dart';

// import '../repository/account_repository.dart';

// class AccountUsecase {
//   final AccountRepository repository;

//   AccountUsecase({required this.repository});

//   Future<CommonResponseEntity> uploadProfileImage(
//       {required File file, required String id}) {
//     return repository.uploadProfileImage(file: file, id: id);
//   }

//   Future<Uint8List> getProfileImage({required int userId}) async {
//     return await repository.getProfileImage(userId: userId);
//   }
// }
