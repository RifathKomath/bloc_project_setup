class NotificationListResponseEntity {
    int?status;
    bool? success;
    String? message;
    List<NotificationListEntity>? data;

    NotificationListResponseEntity({
         this.status,
         this.success,
         this.message,
         this.data,
    });

}

class NotificationListEntity {
    int? id;
    DateTime? notifyTime;
    String? notifyContent;
    String? subject;
    int? userId;
    String? userType;
    dynamic active;
    dynamic objectData;
    bool? read;

    NotificationListEntity({
          this.id,
          this.notifyTime,
          this.notifyContent,
          this.subject,
          this.userId,
          this.userType,
          this.active,
          this.objectData,
          this.read,
    });

}
