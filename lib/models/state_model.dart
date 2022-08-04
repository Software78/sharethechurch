class States {
  final int id;
  final String name;
  final String iso2;

  States({
    required this.id,
    required this.name,
    required this.iso2,
  });

  factory States.fromJson(Map<String, dynamic> json) {
    return States(
      id: json["id"],
      name: json["name"],
      iso2: json["iso2"],
    );
  }
}
