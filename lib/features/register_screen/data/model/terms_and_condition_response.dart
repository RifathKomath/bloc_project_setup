import '../../domain/entity/terms_and_condition_entity.dart';

class GetTermsAndConditionResponse extends TermsAndConditionEntity {
  final int? status;
  final bool? success;
  final String? message;
  final List<TermsDatum>? data;

  GetTermsAndConditionResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory GetTermsAndConditionResponse.fromJson(Map<String, dynamic> json) {
    return GetTermsAndConditionResponse(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? List<TermsDatum>.from(
              (json['data'] as List).map((x) => TermsDatum.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.map((x) => x.toJson()).toList(),
      };
}

class TermsDatum extends TermsEntity {
  int? id;
  String? title;
  String? content;
  DateTime? effectiveFrom;
  String? active;

  TermsDatum({
    this.id,
    this.title,
    this.content,
    this.effectiveFrom,
    this.active,
  });

  factory TermsDatum.fromJson(Map<String, dynamic> json) {
    return TermsDatum(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      effectiveFrom: json['effectiveFrom'] != null
          ? DateTime.parse(json['effectiveFrom'])
          : null,
      active: json['active'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'effectiveFrom': effectiveFrom?.toIso8601String(),
        'active': active,
      };
}
