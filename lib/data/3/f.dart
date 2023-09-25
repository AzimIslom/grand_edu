import 'package:flutter_tex/flutter_tex.dart';

class F1 {
  int length = 3;
  List<String> f1 = ["EKUB", "(a;b)", "⋅EKUK", "(a;b)", "=a⋅b"];
  List<String> f2 = ["a:b", "=c", "(d)"];
  List<String> f3 = ["a=b", "⋅c", "+d"];

  List<String> get(int index) {
    switch (index) {
      case 1:
        return f1;
      case 2:
        return f2;
      default:
        return f3;
    }
  }
}
