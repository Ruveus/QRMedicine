import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_medicine/extensions/context_extension.dart';

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
              "assets/medicine_one.png",
              width: context.dynamicWidth(0.3),
            ),
            Text(
              "İlaç Adı",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "İlaç Türü .",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ilacBilgiContainer(context,
                    icon: FontAwesomeIcons.kitMedical,
                    baslik: "2.5 Mg",
                    altBaslik: "Günlük Dozaj",
                    renk: Colors.amber),
                ilacBilgiContainer(context,
                    icon: FontAwesomeIcons.clock,
                    baslik: "2.5 Mg",
                    altBaslik: "Günlük Dozaj",
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

  Container ilacBilgiContainer(BuildContext context,
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
