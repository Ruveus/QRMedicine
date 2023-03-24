import 'package:get_it/get_it.dart';
import 'package:qr_medicine/repository/user_repository.dart';
import 'package:qr_medicine/services/firebase/firestore_service.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirestoreService());
}
