import 'package:grand_edu/models/league/league_progress_model.dart';

class LeagueModel {
  late String id;
  late List<LeagueProgressModel> progress;
  late List<String> ppl;

  LeagueModel({
    required this.id,
    required this.ppl,
    required this.progress,
  });

  LeagueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ppl = json['ppl'];
    progress = List.from(json['progress'])
        .map((e) => LeagueProgressModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ppl': ppl,
        'progress': progress.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
