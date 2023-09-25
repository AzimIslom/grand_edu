part of 'imports.dart';

List<ThemeModel> themes = [
  ThemeModel(
    title: "Boshlang’ich tushunchalar. Hisoblashga doir misollar.",
    unit: 1,
  ),
  ThemeModel(
    title: "Bo’linish belgilari.",
    unit: 2,
  ),
  ThemeModel(
    title: "Qoldiqli bo’lish. EKUK va EKUB.",
    unit: 3,
  ),
  ThemeModel(
    title: "Kasrlar.",
    unit: 4,
  ),
  ThemeModel(
    title: "O’nli kasrlar ustida amallar. Cheksiz davriy o’nli kasrlar.",
    unit: 5,
  ),
  ThemeModel(
    title: "Algebraik ifodalar.",
    unit: 6,
  ),
  ThemeModel(
    title: "Ko’phadlarni ko’paytuvchilarga ajratish.",
    unit: 7,
  ),
  ThemeModel(
    title: "Chiziqli tenglamalar. Proportsiya.",
    unit: 8,
  ),
  ThemeModel(
    title: "Tenglamalar sistemasi.",
    unit: 9,
  ),
];

class ThemesVM extends ChangeNotifier {
  int initPage = 0;
  late AllUnitsModel all;
  late GroupModel group;
  late StudentModel stu;
  bool isLoading = false;

  ThemesVM() {
    init();
  }

  void init() async {
    _();
    stu = await fb.speStudent(auth.tel);
    all = await fb.allUnits();
    group = await fb.speGroup(stu.groupId);
    initPage = group.unit - 1;
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
