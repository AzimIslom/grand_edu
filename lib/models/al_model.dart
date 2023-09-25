class ALModel {
  late String student;
  late String support;
  late DateTime time;
  late String target;
  late DateTime meeting;
  late String id;
  late DateTime date;
  late String status;
  late DateTime set;

  ALModel({
    required this.time,
    required this.student,
    required this.support,
    required this.meeting,
    required this.target,
    required this.id,
    required this.date,
    required this.status,
    required this.set,
  });

  ALModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']);
    student = json['student'];
    support = json['support'];
    meeting = DateTime.parse(json['meeting']);
    date = DateTime.parse(json['date']);
    set = DateTime.parse(json['set']);
    target = json['target'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
        'time': time.toIso8601String(),
        'student': student,
        'support': support,
        'meeting': meeting.toIso8601String(),
        'date': date.toIso8601String(),
        'set': set.toIso8601String(),
        'target': target,
        'id': id,
        'status': status,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
