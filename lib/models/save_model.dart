import 'package:equatable/equatable.dart';

class AllSaveModel {
  late String tel;
  late List<InnerModel> saves;

  AllSaveModel({
    required this.tel,
    required this.saves,
  });

  AllSaveModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    saves = List.from(json['saved'] ?? [])
        .map((e) => InnerModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'saved': saves.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class InnerModel {
  late int unit;
  late List<int> ques;

  InnerModel({
    required this.unit,
    required this.ques,
  });

  InnerModel.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    ques = List.from(json['ques']);
  }

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'ques': ques,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
