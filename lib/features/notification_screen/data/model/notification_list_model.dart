import '../../domain/entity/notification_list_entity.dart';

class NotificationListResponseModel extends NotificationListResponseEntity {
  NotificationListResponseModel({
    int? status,
    bool? success,
    String? message,
    List<NotificationListModel>? data,
  }) : super(
          status: status,
          success: success,
          message: message,
          data: data,
        );

  factory NotificationListResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationListResponseModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data?.map((e) => (e as NotificationListModel).toJson()).toList(),
    };
  }
}

class NotificationListModel extends NotificationListEntity {
  NotificationListModel({
    int? id,
    DateTime? notifyTime,
    String? notifyContent,
    String? subject,
    int? userId,
    String? userType,
    dynamic active,
    dynamic objectData,
    bool? read,
  }) : super(
          id: id ?? 0,
          notifyTime: notifyTime ?? DateTime.now(),
          notifyContent: notifyContent ?? '',
          subject: subject ?? '',
          userId: userId ?? 0,
          userType: userType ?? '',
          active: active,
          objectData: objectData,
          read: read ?? false,
        );

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    return NotificationListModel(
      id: json['id'] as int?,
      notifyTime: json['notifyTime'] != null
          ? DateTime.parse(json['notifyTime'])
          : null,
      notifyContent: json['notifyContent'] as String?,
      subject: json['subject'] as String?,
      userId: json['userId'] as int?,
      userType: json['userType'] as String?,
      active: json['active'],
      objectData: json['objectData'],
      read: json['read'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notifyTime': notifyTime?.toIso8601String(),
      'notifyContent': notifyContent,
      'subject': subject,
      'userId': userId,
      'userType': userType,
      'active': active,
      'objectData': objectData,
      'read': read,
    };
  }
}
