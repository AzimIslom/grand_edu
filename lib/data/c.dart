import 'package:grand_edu/data/1/q.dart';

final cc = Cc();

class Cc {
  List<String> questions(int unit, int ques) {
    switch (unit) {
      case 1:
        return C1().ques(ques);
      default:
        return C1().ques(ques);
    }
  }

  List<List<String>> variants(int unit, int ques) {
    switch (unit) {
      case 1:
        return C1().variants(ques);
      default:
        return C1().variants(ques);
    }
  }
}
