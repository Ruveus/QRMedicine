// ignore_for_file: use_build_context_synchronously
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_medicine/extensions/context_extension.dart';
import 'package:qr_medicine/model/developer_settings.dart';

import '../components/snackbar_show.dart';
import '../model/medicine.dart';
import '../viewmodel/user_model.dart';
import 'const.dart';
import 'medicine_show.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScanResult? scanResult;
  final double _aspectTolerance = 0.00;
  final bool _useAutoFocus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Icon(
                color: Colors.blue,
                Icons.qr_code_rounded,
                size: context.dynamicHeight(0.2),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _scan,
                  //() => goToPage(context, App()),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Text(
                      "Scan!",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _scan() async {
    try {
      String medicineId = "";

      if (!DeveloperSettings.test) {
        ScanResult scanResult =
            await BarcodeScanner.scan(options: scanOption());
        setState(() {
          medicineId = scanResult.rawContent;
        });
      } else {
        medicineId = "w43dlsq7tGnirGCjmynD";
      }
      if (medicineId.isEmpty) {
        snackBarGoster(context, "QR cant read it");
      } else {
        getMedicine(medicineId);
      }
    } on PlatformException catch (e) {
      snackBarGoster(
          context,
          e.code == BarcodeScanner.cameraAccessDenied
              ? 'Camera cant access!'
              : 'Unknown error: $e');
    }
  }

  ScanOptions scanOption() {
    return ScanOptions(
        android: AndroidOptions(
      aspectTolerance: _aspectTolerance,
      useAutoFocus: _useAutoFocus,
    ));
  }

  Future getMedicine(String medicineId) async {
    try {
      Medicine? medicine = await Provider.of<UserModel>(context, listen: false)
          .getMedicine(medicineId);
      if (medicine != null) {
        goToPage(context, MedicineShow(medicine: medicine));
      } else {
        snackBarGoster(context, "This drug was not found in our database");
      }
    } catch (e) {
      snackBarGoster(context, "Error Code : \n$e");
    }
  }
}
