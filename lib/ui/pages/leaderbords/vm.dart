part of 'imports.dart';

class LeaderboardsVM extends ChangeNotifier {
  List<StudentModel> students = [];

  LeaderboardsVM() {
    init();
  }

  void init() {
    students = List.generate(
      20,
      (index) => StudentModel(
        surname: faker.person.lastName(),
        name: faker.person.firstName(),
        tel: "93202",
        password: "d",
        groupId: "d",
        xp: faker.randomGenerator.integer(10000, min: 100),
        lessons: -1,
        teacherId: '',
        supportId: '',
      ),
    );
    students.sort((a, b) => b.xp.compareTo(a.xp));
    notifyListeners();
  }
}
