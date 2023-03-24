import 'package:qr_medicine/locator.dart';
import 'package:qr_medicine/services/firebase/firestore_service.dart';

import '../model/medicine.dart';

class UserRepository {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Future<Medicine?> getMedicine(String medicineId) async =>
      await _firestoreService.getMedicine(medicineId);
}
