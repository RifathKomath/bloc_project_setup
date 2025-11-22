class CommonResponseEntity {
    int? status;
    bool? success;
    String? message;
    dynamic data;

    CommonResponseEntity({
         this.status,
         this.success,
         this.message,
        this.data
    });

   
}