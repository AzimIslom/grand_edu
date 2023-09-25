part of 'imports.dart';

class FormulaDetailVM extends ChangeNotifier {
  late List<String> formula;
  final ThemeModel theme;
  int current = 1;
  int max = 0;
  bool isLoading = false;
  final UnitModel unit;

  FormulaDetailVM(this.theme, this.unit) {
    init();
  }

  void init() async {
    switch (theme.unit) {
      case 1:
        {
          formula = F1().f1;
          max = F1().length;
        }
    }
    notifyListeners();
  }

  void next(BuildContext context) async {
    if (max == current) {
      if (!unit.formula) {
        await memoFormula();
      }
      Navigator.pop(context, unit);
    } else {
      current++;
      switch (theme.unit) {
        case 1:
          {
            formula = F1().get(current);
          }
      }
      notifyListeners();
    }
  }

  Future<void> memoFormula() async {
    _();
    unit.formula = true;
    await fb.updateUnit(unit, theme.unit.toString());
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
