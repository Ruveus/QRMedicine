import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_medicine/constants/my_colors.dart';
import 'package:qr_medicine/constants/my_decorations.dart';
import 'package:qr_medicine/extensions/context_extension.dart';
import 'package:qr_medicine/model/medicine.dart';

class MedicineShowT extends StatefulWidget {
  const MedicineShowT({super.key});

  @override
  State<MedicineShowT> createState() => _MedicineShowTState();
}

class _MedicineShowTState extends State<MedicineShowT>
    with MyColors, MyDecorations {
  @override
  void initState() {
    super.initState();
  }

  double sizedBoxHeight = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldContainerDecoration,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: FaIcon(
                  FontAwesomeIcons.xmark,
                  color: textColor,
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
                //pathConverter(),
                width: context.dynamicWidth(0.3),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              FittedBox(
                child: Text(
                  "${"medicine.name"}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: textColor),
                ),
              ),
              Text(
                "İlaç Türü: ${convertToFirstLaterUpperCase("medicine.type!.name")}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: textColor),
              ),
              SizedBox(
                height: sizedBoxHeight * 2,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    medicineInfoContainer(context,
                        icon: FontAwesomeIcons.scaleBalanced,
                        baslik: "2.5",
                        altBaslik: "mg",
                        renk: containerTextColr),
                    medicineInfoContainer(context,
                        icon: FontAwesomeIcons.clock,
                        baslik: "2 x Pills ",
                        altBaslik: "Day",
                        renk: containerTextColr),
                  ],
                ),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "About Drug",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: textColor),
                    ),
                    Text(
                      """Each of the CORASPIN enteric-coated tablets contains 300 mg of an active substance called acetylsalicylic acid. Acetylsalicylic acid shows its effect by preventing the aggregation of clotting cells called platelets. Because of this feature, it is used in various heart diseases. """,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: textColor),
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    Text(
                      "How to use?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: textColor),
                    ),
                    Text(
                      """"Take the tablets orally with some water, preferably before meals.CORASPIN is designed for long-term use. Your doctor should decide on the duration of your treatment.""",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: textColor),
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    Text(
                      "Side Effect",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: textColor),
                    ),
                    Text(
                      """"Common cold, nasal congestion, Skin reactions (itching, hives, edema), Anaphylactic shock (Immediate hypersensitivity reaction)""",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: textColor),
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    myCustomExpansionTile(context, "More Detail", "I dunno"),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    myCustomExpansionTile(context, "More Detail", "I dunno"),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    myCustomExpansionTile(context, "More Detail", "I dunno"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile myCustomExpansionTile(BuildContext context, baslik, altBaslik) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      tilePadding: EdgeInsets.zero,
      iconColor: textColor,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      textColor: textColor,
      trailing: const Icon(Icons.add),
      title: Text(
        baslik,
        style:
            Theme.of(context).textTheme.headline6?.copyWith(color: textColor),
      ),
      children: [
        Text(
          altBaslik,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: textColor),
        ),
      ],
    );
  }
/*
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
  */

  String convertToFirstLaterUpperCase(String string) =>
      string[0].toUpperCase() + string.substring(1);

  Container medicineInfoContainer(BuildContext context,
      {IconData icon = Icons.abc,
      String baslik = "Baslik",
      String altBaslik = "AltBaslik",
      Color renk = Colors.black}) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        width: context.dynamicWidth(0.4),
        height: context.dynamicHeight(0.15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  baslik,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    altBaslik,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
