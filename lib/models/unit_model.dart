class UnitModel {
  late bool formula;
  late bool video;
  late List<CatInfoModel> cats;

  UnitModel({
    required this.formula,
    required this.cats,
    required this.video,
  });

  UnitModel.fromJson(Map<String, dynamic> json) {
    formula = json['formula'];
    video = json['video'];
    cats =
        List.from(json['cats']).map((e) => CatInfoModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'formula': formula,
        'video': video,
        'cats': cats.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class CatInfoModel {
  late int cat;
  late int percent;
  late List<int> questions;
  late List<bool> results;

  CatInfoModel({
    required this.questions,
    required this.cat,
    required this.percent,
    required this.results,
  });

  CatInfoModel.fromJson(Map<String, dynamic> json) {
    questions = List.from(json['questions']);
    results = List.from(json['results']);
    cat = json['cat'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() => {
        'questions': questions,
        'results': results,
        'cat': cat,
        'percent': percent,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class AllUnitsModel {
  late List<ShortModel> shorts;

  AllUnitsModel({
    required this.shorts,
  });

  AllUnitsModel.fromJson(Map<String, dynamic> json) {
    shorts = List.from(json['shorts'])
        .map(
          (e) => ShortModel.fromJson(e),
        )
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'shorts': shorts.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class ShortModel {
  late int percent;
  late int unit;

  ShortModel({
    required this.percent,
    required this.unit,
  });

  ShortModel.fromJson(Map<String, dynamic> json) {
    percent = json['percent'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() => {
        'percent': percent,
        'unit': unit,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
