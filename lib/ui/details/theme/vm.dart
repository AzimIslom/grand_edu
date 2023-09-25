part of 'imports.dart';

class ThemeDetailVM extends ChangeNotifier {
  late ThemeModel theme;
  List<CatModel> cats = [];
  int? initPage;
  bool isLoading = false;
  int? currentCat;
  int av = 0;
  late UnitModel unit;

  ThemeDetailVM(this.theme) {
    init();
  }

  void init() async {
    _();
    final json = List.from(jsonDecode(
        await rootBundle.loadString("lib/data/${theme.unit}/c.json")));
    cats = json.map((e) => CatModel.fromJson(e)).toList();
    initPage = 3;
    unit = await fb.unit(theme.unit.toString());
    final _l = cats.length;
    av = 0;
    for (var i in unit.cats) {
      av += i.percent;
    }
    av = _l == 0 ? 0 : (av / _l).ceil();
    currentCat ??= 0;
    _();
  }

  int percent(int index) => unit.cats
      .firstWhere(
        (element) => element.cat == index,
        orElse: () => CatInfoModel(
          questions: [],
          cat: -1,
          percent: 0,
          results: [],
        ),
      )
      .percent;

  void onBack(UnitModel unit, bool val) async {
    _();
    this.unit = unit;
    unit = await fb.unit(theme.unit.toString());
    final _l = cats.length;
    av = 0;
    for (var i in unit.cats) {
      av += i.percent;
    }
    av = _l == 0 ? 0 : (av / _l).ceil();
    if (val) {
      print(av);
      final stats = HWStatsModel(unit: theme.unit, percent: av);
      final stu = await fb.speStudent(auth.tel);
      await fb.updateHW(stats, stu);
      await fb.saveShorts(av, theme.unit);
    }
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
