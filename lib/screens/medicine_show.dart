import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_medicine/extensions/context_extension.dart';
import 'package:qr_medicine/model/medicine.dart';

class MedicineShow extends StatefulWidget {
  final Medicine medicine;
  const MedicineShow({super.key, required this.medicine});

  @override
  State<MedicineShow> createState() => _MedicineShowState();
}

class _MedicineShowState extends State<MedicineShow> {
  late Medicine medicine;

  @override
  void initState() {
    super.initState();
    medicine = widget.medicine;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.blue.shade200,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              pathConverter(),
              width: context.dynamicWidth(0.3),
            ),
            FittedBox(
              child: Text(
                "İlaç Adı: \n${medicine.name}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              "İlaç Türü: ${medicine.typeToStr()}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                medicineInfoContainer(context,
                    icon: FontAwesomeIcons.kitMedical,
                    baslik: "2.5 Mg",
                    altBaslik: "Günlük Dozaj",
                    renk: Colors.amber),
                medicineInfoContainer(context,
                    icon: FontAwesomeIcons.clock,
                    baslik: "2 Tane ",
                    altBaslik: "Günlük",
                    renk: Colors.purpleAccent),
              ],
            ),
            Text(
              "İlaç Hakkında",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
                height: context.dynamicHeight(0.6),
                child: ListView(
                  children: const [Text("ilaç bilgi")],
                )),
            SizedBox(
                height: context.dynamicHeight(0.16),
                width: context.dynamicWidth(1),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
                  child: Text(
                    "Anladım",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  String pathConverter() {
    String path = "assets/medicine_";
    switch (medicine.type!) {
      case Type.pill:
        path += "one";
        break;
      case Type.capsule:
        path += "two";
        break;
      case Type.gel:
        path += "one";
        break;
      case Type.tablet:
        path += "one";
        break;
      case Type.unknown:
        path += "one";
        break;
    }
    path += ".png";
    return path;
  }

  Container medicineInfoContainer(BuildContext context,
      {IconData icon = Icons.abc,
      String baslik = "Baslik",
      String altBaslik = "AltBaslik",
      Color renk = Colors.black}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: renk,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                baslik,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                altBaslik,
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          )
        ],
      ),
    );
  }
}
