abstract class FormEvent {}

class UpdateDoctorName extends FormEvent {
  final String doctorName;
  UpdateDoctorName(this.doctorName);
}

class UpdateSpecialization extends FormEvent {
  final String specialization;
  UpdateSpecialization(this.specialization);
}

class UpdatePatientFullName extends FormEvent {
  final String patientFullName;
  UpdatePatientFullName(this.patientFullName);
}

class UpdatePatientDob extends FormEvent {
  final DateTime dob;
  UpdatePatientDob(this.dob);
}

class UpdatePatientContact extends FormEvent {
  final String contact;
  UpdatePatientContact(this.contact);
}

class UpdateDate extends FormEvent {
  final DateTime date;
  UpdateDate(this.date);
}

class UpdateLocation extends FormEvent {
  final String location;
  UpdateLocation(this.location);


}

class UpdateDoctorId extends FormEvent {
  final int doctorId;
  UpdateDoctorId(this.doctorId);
}
class ShowSignature extends FormEvent {}

class ClearSignature extends FormEvent {}
