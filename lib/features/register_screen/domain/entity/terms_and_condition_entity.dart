class TermsAndConditionEntity {
  int? status;
  bool? success;
  String? message;
  List<TermsEntity>? data;

  TermsAndConditionEntity({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class TermsEntity {
  int? id;
  String? title;
  String? content;
  DateTime? effectiveFrom;
  String? active;

  TermsEntity({
    this.id,
    this.title,
    this.content,
    this.effectiveFrom,
    this.active,
  });
}
