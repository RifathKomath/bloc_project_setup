class OtpResponseEntity {
    int status;
    bool success;
    String message;
    String? data;

    OtpResponseEntity({
        required this.status,
        required this.success,
        required this.message,
         this.data
    });

   
}