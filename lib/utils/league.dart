import 'package:grand_edu/models/league/my_league_history_model.dart';

League league = League();

class League {
  bool upOrDown(MyLeagueHistoryModel info) {
    switch (int.parse(info.id.split('.').first)) {
      case 1: //bronze
        {
          switch (int.parse(info.id.split('.').last)) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
              return true;
            default:
              return false;
          }
        }
      case 2: //silver
        {
          switch (int.parse(info.id.split('.').last)) {
            case 1:
            case 2:
            case 3:
            case 4:
              return true;
            default:
              return false;
          }
        }
      case 3: //gold
        {
          switch (int.parse(info.id.split('.').last)) {
            case 1:
            case 2:
            case 3:
              return true;
            default:
              return false;
          }
        }
      case 4: //diamond
        {
          switch (int.parse(info.id.split('.').last)) {
            case 1:
            case 2:
              return true;
            default:
              return false;
          }
        }
      default:
        return false;
    }
  }
}
