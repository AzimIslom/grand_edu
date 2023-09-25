class HomeworkModel {
  late String tel;
  late List<HWStatsModel> units;

  HomeworkModel({
    required this.tel,
    required this.units,
  });

  HomeworkModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    units =
        List.from(json['units']).map((e) => HWStatsModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'units': units.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class HWStatsModel {
  late int unit;
  late int percent;

  HWStatsModel({
    required this.unit,
    required this.percent,
  });

  HWStatsModel.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'percent': percent,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
