import 'package:flutter_tex/flutter_tex.dart';

class F1 {
  int length = 6;
  List<String> f1 = ["a+(-b)", "=a-b"];
  List<String> f2 = ["-(-a)","=a"];
  List<String> f3 = ["(a+b)","+c=a+","(b+c)"];
  List<String> f4 = ["-(a+b","-c)=-","a-b+c"];
  List<String> f5 = ["a⋅(-b)","=(-a)⋅","b=-a⋅b"];
  List<String> f6 = ["(a⋅b)⋅","c=a⋅(b","⋅c)=b⋅","(a⋅c)"];

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
      default:
        return f6;
    }
  }
}
