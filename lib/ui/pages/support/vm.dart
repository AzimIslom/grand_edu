part of 'imports.dart';

SupportVM _supportVM = SupportVM();

class SupportVM extends ChangeNotifier {
  String? day;
  TextEditingController problem = TextEditingController();
  TextEditingController feedback = TextEditingController();
  DateTime? selected;
  int stars = 0;
  late SupportModel support;
  bool isLoading = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  late DateTime alTime;
  StudentModel? stu;

  ALModel? al;

  List<DateTime> times = [];

  SupportVM() {
    init();
  }

  void init() async {
    _();
    stu = await fb.me();
    support = await fb.speSupports(stu!.supportId);
    _();
    initAl();
  }

  void initAl() async {
    _();
    al = await fb.al(stu!);
    if (al != null) {
      final d = al!.date;
      final t = al!.meeting;
      alTime = DateTime(d.year, d.month, d.day, t.hour, t.minute);
    }
    print('al: $al');
    _();
  }

  void selectDay(String val) {
    day = val;
    initTimes();
  }

  void select(DateTime time) {
    selected = time;
    notifyListeners();
  }

  void initTimes() {
    times = [];
    DateTime now = DateTime(2023, 8, 30, 10, 0);
    do {
      times.add(now);
      now = now.add(const Duration(minutes: 30));
      print(now);
    } while (now.hour != 20);
    notifyListeners();
  }

  void submit() async {
    final after = AfterModel(
      id: 'id',
      time: DateTime.now(),
      feedback: feedback.text.trim(),
      by: al!.student,
      to: al!.support,
      secret: true,
      stars: stars,
    );
    await fb.sendFeedback(after);
    await fb.cancelApply(al!);
    al = null;
    _btnController2.success();
    await Future.delayed(const Duration(seconds: 1));
    _btnController2.reset();
    notifyListeners();
  }

  void cancel(BuildContext context) async {
    final res = await fb.cancelApply(al!);
    if (res == null) {
      _btnController2.success();
      await Future.delayed(const Duration(seconds: 1));
      _btnController2.reset();
      Navigator.pop(context);
    } else {
      _btnController2.error();
      await Future.delayed(const Duration(seconds: 3));
      _btnController2.reset();
    }
  }

  void selectStars(double stars) {
    this.stars = stars.toInt();
    print(stars);
    notifyListeners();
  }

  void back(BuildContext context) async {
    if (day != null && problem.text.trim().length > 5 && selected != null) {
      DateTime time = DateTime.now().add(Duration(
          days: day == t.dayAT
              ? 2
              : day == t.tomorrow
                  ? 1
                  : 0));
      final meeting = DateTime(
          time.year, time.month, time.day, selected!.hour, selected!.minute);
      final al = ALModel(
        time: DateTime.now(),
        student: stu!.tel,
        support: stu!.supportId,
        meeting: meeting,
        target: problem.text.trim(),
        id: '',
        date: day == t.today
            ? time
            : day == t.tomorrow
                ? time.add(const Duration(days: 1))
                : time.add(const Duration(days: 2)),
        status: t.waiting,
        set: DateTime.now(),
      );
      final res = await fb.apply(al);
      if (res == null) {
        _btnController.success();
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
      } else {
        _btnController.error();
        await Future.delayed(const Duration(seconds: 3));
        _btnController.reset();
      }
    } else {
      _btnController.error();
      await Future.delayed(const Duration(seconds: 3));
      _btnController.reset();
    }
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
