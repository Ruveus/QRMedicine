class Medicine {
  String? activeIngredient;
  String? excipients;
  String? name;
  String? what;

  Medicine({this.activeIngredient, this.excipients, this.name, this.what});

  Medicine.fromFirebase(Map<String, dynamic> map)
      : this(
            activeIngredient: map["activeIngredient"],
            excipients: map["excipients"],
            name: map["name"],
            what: map["what"]);

  @override
  String toString() {
    return 'Medicine{activeIngredient: $activeIngredient, '
        'excipients: $excipients, name: $name, what: $what}';
  }
}
