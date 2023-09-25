import 'my_progress_model.dart';

class MyLeagueHistoryModel {
  late String id;
  late String group;
  late int rank;
  late int totalXP;
  late List<MyProgressModel> progress;
  late DateTime time;

  MyLeagueHistoryModel({
    required this.progress,
    required this.id,
    required this.group,
    required this.rank,
    required this.totalXP,
    required this.time,
  });

  MyLeagueHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    progress = List.from(json['progress'])
        .map((e) => MyProgressModel.fromJson(e))
        .toList();
    rank = json['rank'];
    totalXP = json['totalXP'];
    group = json['group'];
    time = DateTime.parse(json['time']);
  }

  Map<String, dynamic> toJson() => {
        'progress': progress.map((e) => e.toJson()).toList(),
        'id': id,
        'rank': rank,
        'totalXP': totalXP,
        'group': group,
        'time': time.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
