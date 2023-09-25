class CatModel {
  late int unit;
  late int cat;
  late String title;
  late List<int> questions;

  CatModel({
    required this.unit,
    required this.title,
    required this.cat,
    required this.questions,
  });

  CatModel.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    title = json['title'];
    cat = json['cat'];
    questions = List.from(json['questions'] ?? []);
  }

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'title': title,
        'cat': cat,
        'questions': questions,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
