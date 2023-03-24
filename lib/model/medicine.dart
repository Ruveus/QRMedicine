enum Type { pill, capsule, gel, tablet, unknown }

class Medicine {
  String? activeIngredient;
  String? excipients;
  String? name;
  String? what;
  Type? type;

  Medicine.fromFirebase(Map<String, dynamic> map) {
    activeIngredient = map["activeIngredient"];
    excipients = map["excipients"];
    name = map["name"];
    what = map["what"];
    type = convertType(map["type"]);
  }

  Type convertType(int typeNo) {
    switch (typeNo) {
      case 0:
        return Type.gel;
      case 1:
        return Type.pill;
      case 2:
        return Type.capsule;
      case 3:
        return Type.tablet;
      default:
        return Type.unknown;
    }
  }

  String typeToStr() {
    switch (type!) {
      case Type.pill:
        return "Hap";
      case Type.capsule:
        return "Kapsül";
      case Type.gel:
        return "Jel";
      case Type.tablet:
        return "Tablet";
      case Type.unknown:
        return "Bilinmeyen";
    }
  }

  @override
  String toString() {
    return 'Medicine{activeIngredient: $activeIngredient, '
        'excipients: $excipients, name: $name, what: $what}';
  }
}
