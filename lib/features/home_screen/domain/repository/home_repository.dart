import '../entity/allocated_doctor_entity.dart';
import '../entity/fcm_response_entity.dart';

abstract class HomeRepository {
  Future<CommonResponseEntity> getNotification({required dynamic fcmToken});
  Future<AllocatedDoctorResponseEntity> getAllocatedDoctor();
}
