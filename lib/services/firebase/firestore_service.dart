import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_medicine/model/medicine.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _medicineRef;

  FirestoreService() {
    _medicineRef = _firestore.collection("Medicine").withConverter<Medicine>(
        fromFirestore: ((snapshot, _) =>
            Medicine.fromFirebase(snapshot.data()!)),
        toFirestore: (medicine, _) => {});
  }

  Future<Medicine?> getMedicine(String medicineId) async => (await _medicineRef
      .doc(medicineId)
      .get()
      .then((snapshot) => snapshot.data())) as Medicine?;
}
