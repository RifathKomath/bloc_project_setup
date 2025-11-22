import '../../domain/entity/file_upload_entity.dart';

class FileUploadResponse extends FileUploadEntity {
  final int? status;
  final bool? success;
  final String? message;
  final FileData? data;

  FileUploadResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) {
    return FileUploadResponse(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? FileData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class FileData extends UploadedData {
  int? id;
  int? patientId;
  int? treatmentCycle;
  String? documentType;
  String? fileName;
  String? fileUrl;
  int? fileSize;
  DateTime? uploadedDate;
  String? uploadedBy;
  dynamic remarks;

  FileData({
    this.id,
    this.patientId,
    this.treatmentCycle,
    this.documentType,
    this.fileName,
    this.fileUrl,
    this.fileSize,
    this.uploadedDate,
    this.uploadedBy,
    this.remarks,
  });

  factory FileData.fromJson(Map<String, dynamic> json) {
    return FileData(
      id: json['id'],
      patientId: json['patientId'],
      treatmentCycle: json['treatmentCycle'],
      documentType: json['documentType'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      fileSize: json['fileSize'],
      uploadedDate: json['uploadedDate'] != null
          ? DateTime.parse(json['uploadedDate'])
          : null,
      uploadedBy: json['uploadedBy'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'treatmentCycle': treatmentCycle,
      'documentType': documentType,
      'fileName': fileName,
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'uploadedDate': uploadedDate?.toIso8601String(),
      'uploadedBy': uploadedBy,
      'remarks': remarks,
    };
  }
}
