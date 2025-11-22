class ConsentFormState {
  final String? doctorName;
  final String? specialization;
  final String? patientFullName;
  final DateTime? dob;
  final String? contact;
  final DateTime? date;
  final String? location;
  final bool showSignature;
  final int? doctorId;

  

  ConsentFormState({
    this.doctorName,
    this.specialization,
    this.patientFullName,
    this.doctorId,
    this.dob,
    this.contact,
    this.date,
    this.location,
    this.showSignature = false,

  });

  factory ConsentFormState.initial() => ConsentFormState(
        doctorName: '',
        specialization: '',
        patientFullName: '',
        dob: null,
        contact: '',
        date: null,
        location: '',
        showSignature: false,
        doctorId: null,
    
      );

  ConsentFormState copyWith({
    String? doctorName,
    String? specialization,
    String? patientFullName,
    DateTime? dob,
    String? contact,
    DateTime? date,
    String? location,
    bool? showSignature,
    int? doctorId,

  }) {
    return ConsentFormState(
      doctorName: doctorName ?? this.doctorName,
      specialization: specialization ?? this.specialization,
      patientFullName: patientFullName ?? this.patientFullName,
      dob: dob ?? this.dob,
      contact: contact ?? this.contact,
      date: date ?? this.date,
      location: location ?? this.location,
      showSignature: showSignature ?? this.showSignature,
      doctorId: doctorId ?? this.doctorId,

    );
  }
}
