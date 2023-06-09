import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_medicine/screens/home_page.dart';
import 'package:qr_medicine/viewmodel/user_model.dart';

import 'firebase_options.dart';
import 'locator.dart';

Future main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  //System UI Transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  //Vertical Phone
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          fontFamily: 'Geometr706',
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
