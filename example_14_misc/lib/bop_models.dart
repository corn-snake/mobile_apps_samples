class BoP {
  final int id;
  final String name;
  final String icon;
  BoP({required this.id, required this.name, required this.icon});
  factory BoP.fromJson(Map<String, dynamic> json) => BoP(id: json["id"], name: json["name"], icon: json["icon"] | "");
}
