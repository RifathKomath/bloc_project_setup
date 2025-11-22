class FileUploadEntity {
    int? status;
    bool? success;
    String? message;
    UploadedData? data;
    
    FileUploadEntity({
        this.status,
        this.success,
        this.message,
        this.data,
    });
}

class UploadedData {
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
    
    UploadedData({
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
}