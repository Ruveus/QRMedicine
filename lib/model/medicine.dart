enum Type { pill, capsule, gel, tablet, unknown }

class Medicine {
  String? name;
  String? what;
  Type? type;
  String? appliedTo;
  String? howToUse;
  String? sideEffects;

  Medicine.fromFirebase(Map<String, dynamic> map) {
    name = map["name"];
    what = map["what"];
    type = convertType(map["type"]);
    appliedTo = map["appliedTo"];
    howToUse = map["howToUse"];
    sideEffects = map["sideEffects"];
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

  @override
  String toString() {
    return 'Medicine{name: $name, what: $what, type: $type, '
        'appliedTo: $appliedTo, howToUse: $howToUse, sideEffects: $sideEffects}';
  }
}
