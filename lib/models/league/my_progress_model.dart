class MyProgressModel {
  late String id;
  late String me;
  late List<String> questions;
  late List<String> corrects;
  late List<String> wrongs;
  late String? current;
  late List<DateTime> finishes;
  late int day;

  MyProgressModel({
    required this.finishes,
    required this.questions,
    required this.id,
    required this.me,
    required this.corrects,
    required this.day,
    required this.current,
    required this.wrongs,
  });

  MyProgressModel.fromJson(Map<String, dynamic> json) {
    finishes = List.from(json['finishes']);
    questions = List.from(json['questions']);
    id = json['id'];
    me = json['to'];
    corrects = List.from(json['corrects']);
    wrongs = List.from(json['wrongs']);
    day = json['day'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() => {
        'finishes': finishes.map((e) => e.toIso8601String()).toList(),
        'questions': questions,
        'id': id,
        'to': me,
        'corrects': corrects,
        'wrongs': wrongs,
        'day': day,
        'current': current,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
