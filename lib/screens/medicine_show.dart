import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicineShow extends StatefulWidget {
  const MedicineShow({super.key});

  @override
  State<MedicineShow> createState() => _MedicineShowState();
}

class _MedicineShowState extends State<MedicineShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.blue,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
