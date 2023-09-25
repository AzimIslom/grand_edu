part of 'imports.dart';

class SavedVM extends ChangeNotifier {
  String current = t.question;
  AllSaveModel saves = AllSaveModel(
    tel: auth.tel,
    saves: [],
  );
  bool isLoading = false;

  SavedVM() {
    init();
  }

  void init() async {
    _();
    saves = (await fb.saves()) ?? saves;
    saves.saves = saves.saves.where((element) => element.ques.isNotEmpty).toList();
    saves.saves.sort((a, b) => a.unit.compareTo(b.unit));
    _();
  }

  void selectCurrent(String val) {
    current = val;
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
