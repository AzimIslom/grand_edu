class LeagueProgressModel {
  late String owner;
  late int xp;

  LeagueProgressModel({
    required this.xp,
    required this.owner,
  });

  LeagueProgressModel.fromJson(Map<String, dynamic> json) {
    xp = json['xp'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() => {
        'xp': xp,
        'owner': owner,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
