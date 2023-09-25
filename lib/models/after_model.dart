class AfterModel {
  late String feedback;
  late DateTime time;
  late String by;
  late String to;
  late bool secret;
  late int stars;
  late String id;

  AfterModel({
    required this.id,
    required this.time,
    required this.feedback,
    required this.by,
    required this.to,
    required this.secret,
    required this.stars,
  });

  AfterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = DateTime.parse(json['time']);
    feedback = json['feedback'];
    by = json['by'];
    to = json['to'];
    secret = json['secret'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'time': time.toIso8601String(),
        'feedback': feedback,
        'by': by,
        'to': to,
        'secret': secret,
        'stars': stars,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
