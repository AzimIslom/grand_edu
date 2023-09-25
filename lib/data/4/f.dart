import 'package:flutter_tex/flutter_tex.dart';

class F4 {
  int length = 11;
  List<String> f1 = [r'\frac {-a} {-b}=\frac {a} {b}'];
  List<String> f2 = [r'\frac {a+b-c} {m}=\frac {a} {m} + \frac {b} {m} - \frac {c} {m}'];
  List<String> f3 = [r'\frac {ab} {c}=\frac {a} {c}b=\frac {b} {c}a'];
  List<String> f4 = [r'\frac {a} {b}+\frac {c} {d}=\frac {ad+bc} {bd}'];
  List<String> f5 = [r'\frac {a} {c}+\frac {b} {c}=\frac {a+b} {c}'];
  List<String> f6 = [r'\frac {-a} {b}=\frac {a} {-b}=-\frac {a} {b}'];

  List<String> f7 = [r'c⋅\frac{a}{b}=\frac{ca}{b}'];
  List<String> f8 = [r'\frac{a}{b}⋅\frac{c}{d}=\frac{ac}{bd}'];
  List<String> f9 = [r'\frac{a}{b}:\frac{c}{d}=\frac{ad}{bc}'];
  List<String> f10 = [r'c:\frac{a}{b}=\frac{cb}{a}'];
  List<String> f11 = [r'\frac{a}{b}:c=\frac{a}{bc}'];

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
      case 7:
        return f7;
      case 8:
        return f8;
      case 9:
        return f9;
      case 10:
        return f10;
      case 11:
        return f11;
      default:
        return f6;
    }
  }
}
