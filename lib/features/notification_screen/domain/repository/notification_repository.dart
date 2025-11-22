
import '../../../home_screen/domain/entity/fcm_response_entity.dart';
import '../entity/notification_list_entity.dart';

abstract class NotificationRepository {
  Future<NotificationListResponseEntity>notificationListing();
  Future<NotificationListResponseEntity>notificationRead({required int notificationId});
  Future<CommonResponseEntity>deleteAllNotification();


}