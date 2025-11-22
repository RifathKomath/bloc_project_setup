import '../entity/center_listing_enitity.dart';

abstract class BookAppointmentRepository {
  Future<TreatmentCenterEntity> nearByTreatmentCentersListing();
}
