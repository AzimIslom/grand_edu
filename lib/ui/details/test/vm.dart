part of 'imports.dart';

class TestDetailVM extends ChangeNotifier {
  final CatModel cat;
  final UnitModel unit;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  late AllSaveModel saves;

  TestDetailVM(this.cat, this.unit) {
    init();
  }

  int current = 0;
  int? selected;
  late List<String> question;
  late List<List<String>> variants;
  List<int> questions = [];
  List<bool> results = [];
  bool showR = false;
  bool isApplied = false;
  bool isLoading = false;
  int qu = 0;

  void init() async {
    _();
    questions = cat.questions;
    // questions.shuffle();
    saves = (await fb.saves()) ??
        AllSaveModel(
          tel: auth.tel,
          saves: [],
        );
    questions = questions.sublist(0, 10);
    initQues();
    _();
  }

  bool hasNext() => current + 1 < questions.length;

  bool get isSaved {
    final a = saves.saves.firstWhere(
      (element) => element.unit == cat.unit,
      orElse: () => InnerModel(
        unit: -1,
        ques: [],
      ),
    );
    return a.ques.contains(qu);
  }

  void initQues() {
    qu = questions[current];
    question = C1().ques(qu);
    variants = C1().variants(qu);
  }

  void applyy() {
    isApplied = true;
    notifyListeners();
  }

  Future<void> saveAll() async {
    _();
    await fb.saveQues(saves);
    _();
  }

  Future<void> apply(BuildContext context) async {
    final percent = (results.where((element) => element).length / 10) * 100;
    await saveAll();
    final c = unit.cats.firstWhere(
      (element) => element.cat == cat.cat,
      orElse: () =>
          CatInfoModel(questions: [], cat: 1, percent: 1, results: []),
    );
    if (c.percent < percent) {
      unit.cats.removeWhere((element) => element.cat == cat.cat);
      final c = CatInfoModel(
        questions: questions,
        cat: cat.cat,
        percent: percent.ceil(),
        results: results,
      );
      unit.cats.add(c);
      await fb.updateUnit(unit, cat.unit.toString());
      _btnController.success();
      await Future.delayed(const Duration(seconds: 1));
      _btnController.reset();
    }
    Navigator.pop(context);
  }

  void showResult() {
    results.add(selected == 0);
    selected = null;
    showR = true;
    notifyListeners();
  }

  void next() {
    current++;
    isApplied = false;
    print("$current $questions");
    initQues();
    results.add(selected == 0);
    selected = null;
    notifyListeners();
  }

  void select(int index) {
    selected = index;
    notifyListeners();
  }

  void saveQues() {
    if (saves.saves.isNotEmpty) {
      InnerModel a = saves.saves.firstWhere(
        (element) => element.unit == cat.unit,
        orElse: () => InnerModel(
          unit: -1,
          ques: [],
        ),
      );
      if (a.ques.contains(qu)) {
        a.ques.remove(qu);
      } else {
        a.ques.add(qu);
      }
    } else {
      saves = AllSaveModel(
        tel: auth.tel,
        saves: [
          InnerModel(unit: cat.unit, ques: [qu]),
        ],
      );
    }
    print('${saves!.toJson()}');
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
