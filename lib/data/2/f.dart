import 'package:flutter_tex/flutter_tex.dart';

class F1 {
  int length = 8;
  List<String> f1 = ["2 ga: Oxirgi raqami 0, 2, 4, 6, 8 (juft son)"];
  List<String> f2 = ["3 ga: Raqamalar yig’indisi 3 ga bo’linsa;"];
  List<String> f3 = ["4 ga: Oxirgi 2 ta raqami 4 ga bo’linsa;"];
  List<String> f4 = ["5 ga: Oxirgi raqami 0, 5 bilan tugasa;"];
  List<String> f5 = ["6 ga: Ham 2 ga, ham 3 ga bo’linsa;"];
  List<String> f6 = ["8 ga: Oxirgi uchta raqami 8 ga bo’linsa;"];
  List<String> f7 = ["9 ga: Raqamalar yig’indisi 9 ga bo’linsa;"];
  List<String> f8 = ["10 ga: Oxirgi raqami 0 bilan tugasa;"];

  List<String> get(int index) {
    switch (index) {
      case 1:
        return f1;
      case 2:
        return f2;
      case 3:
        return f3;
      case 4:
        return f4;
      case 5:
        return f5;
      case 6:
        return f6;
      case 7:
        return f7;
      default:
        return f8;
    }
  }
}
