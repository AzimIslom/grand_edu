part of 'imports.dart';

class SaveDetailVM extends ChangeNotifier {
  List<String> question = [];
  List<List<String>> variants = [];
  List<int> questions = [];
  late AllSaveModel all;
  final int unit;
  int? selected;
  int current = 0;
  bool isLoading = false;

  SaveDetailVM(this.all, this.unit) {
    questions = all.saves.firstWhere((element) => element.unit == unit).ques;
    init();
  }

  void init() {
    question = cc.questions(unit, questions[current]);
    variants = cc.variants(unit, questions[current]);
    notifyListeners();
  }

  void remove(BuildContext context) async {
    final a = all.saves.firstWhere((element) => element.unit == unit);
    a.ques.remove(questions[current]);
    if (questions.length == current) {
      await saveAll();
      Navigator.pop(context);
    } else {
      init();
    }
  }

  Future<void> saveAll() async {
    _();
    await fb.saveQues(all);
    _();
  }

  void select(int val) {
    selected = val;
    notifyListeners();
  }

  void next() {
    current++;
    selected = null;
    if (current < questions.length) {
      init();
    } else {
      print("sdsds: $questions $current");
    }
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
