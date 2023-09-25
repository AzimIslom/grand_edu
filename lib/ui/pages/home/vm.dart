part of 'imports.dart';

class HomeVM extends ChangeNotifier {
  bool isLoading = false;
  late ALModel? al;
  late StudentModel stu;
  late GroupModel group;
  late AllUnitsModel all;
  late UnitModel unit;
  late int part;

  List<ShopGenModel> shop = [
    ShopGenModel(path: 'assets/icons/apple.png', title: 'Apple'),
    ShopGenModel(path: 'assets/icons/android.png', title: 'Android'),
    ShopGenModel(path: 'assets/icons/discount.png', title: 'Chegirma'),
  ];

  HomeVM() {
    init();
  }

  void nextPart() {
    part++;
    notifyListeners();
  }

  void prevPart() {
    part--;
    notifyListeners();
  }

  void init() async {
    _();
    stu = await fb.speStudent(auth.tel);
    al = await fb.al(stu);
    group = await fb.speGroup(stu.groupId);
    unit = await fb.unit(group.unit.toString());
    part = (group.unit - 1) ~/ 7;
    all = await fb.allUnits();
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
