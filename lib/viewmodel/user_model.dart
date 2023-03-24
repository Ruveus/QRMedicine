import 'package:flutter/foundation.dart';
import 'package:qr_medicine/locator.dart';
import 'package:qr_medicine/repository/user_repository.dart';

import '../model/medicine.dart';

class UserModel with ChangeNotifier {
  final UserRepository _userRepository = locator<UserRepository>();

  Future<Medicine?> getMedicine(String medicineId) async {
    try {
      return await _userRepository.getMedicine(medicineId);
    } catch (e) {
      printError("getMedicine", e);
      rethrow;
    }
  }

  printError(String funcName, Object e) {
    print("Usermodel $funcName hata: $e");
  }
}
