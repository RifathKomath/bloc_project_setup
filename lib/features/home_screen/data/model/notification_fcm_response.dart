

import '../../domain/entity/fcm_response_entity.dart';

class CommonResponse extends CommonResponseEntity{
  int? status;
  bool? success;
  String? message;
  dynamic data;

  CommonResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  }) : super(status: 0, success: false, message: '',data: false);

  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      CommonResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data,
      };
}
