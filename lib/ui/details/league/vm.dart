part of 'imports.dart';

class LeagueVM extends ChangeNotifier {
  late MyProgressModel progress;
  bool isLoading = false;
  List<String> question = [];
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  List<List<String>> variants = [];
  int current = 0;
  int? selected;
  AllSaveModel? saves;
  bool applied = false;
  int qu = 0;
  int unit = 0;

  // bool

  LeagueVM() {
    init();
  }

  bool hasNext() => true;

  void init() async {
    _();
    progress = MyProgressModel(
      finishes: [
        faker.date.dateTime(),
        faker.date.dateTime(),
        faker.date.dateTime(),
      ],
      questions: ["1.4", "1.5", "1.6", "1.7"],
      id: "dnwiefo",
      me: auth.tel,
      day: 1,
      corrects: [
        "1.1",
        "1.2",
      ],
      current: null,
      wrongs: ["1.3"],
    );
    final id = progress.questions[current];
    progress.questions.removeAt(current);
    progress.current = id;
    final res = await saveAll();
    qu = int.parse(id.split('.').last);
    unit = int.parse(id.split('.').first);
    final index = int.parse(progress.questions[current].split('.').last);
    question = C1().ques(index);
    variants = C1().variants(index);
    saves = (await fb.saves()) ??
        AllSaveModel(
          tel: auth.tel,
          saves: [],
        );
    print(saves);
    _();
  }

  bool get isSaved {
    try {
      return saves!.saves
          .firstWhere((element) => element.unit == unit)
          .ques
          .contains(qu);
    } catch (e) {
      return false;
    }
  }

  void saveQues() {
    if (saves != null && saves!.saves.isNotEmpty) {
      InnerModel a = saves!.saves.firstWhere((element) => element.unit == unit);
      if (a.ques.contains(qu)) {
        a.ques.remove(qu);
      } else {
        a.ques.add(qu);
      }
    } else {
      saves = AllSaveModel(
        tel: auth.tel,
        saves: [
          InnerModel(unit: unit, ques: [qu]),
        ],
      );
    }
    print('${saves!.toJson()}');
    notifyListeners();
  }

  void select(int index) {
    selected = index;
    notifyListeners();
  }

  void apply() {
    applied = true;
    notifyListeners();
  }

  Future<String?> saveAll() async {
    print("saveeeeeeeeeeee: ${saves}");
    if (saves == null) {
      return "mefnnn";
    } else {
      _();
      final res = await fb.saveQues(saves!);
      print(res);
      _();
      return res;
    }
  }

  void next() async {
    if (selected == 0) {
      progress.corrects.add("$unit.$qu");
    } else {
      progress.wrongs.add("$unit.$qu");
    }
    selected = null;
    applied = false;
    current++;
    final id = progress.questions[current];
    progress.current = id;
    progress.questions.removeAt(current);
    await saveAll();
    qu = int.parse(id.split('.').last);
    final index = int.parse(progress.questions[current].split('.').last);
    question = C1().ques(index);
    variants = C1().variants(index);
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
