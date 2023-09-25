part of 'imports.dart';

class LeaderboardsPage extends StatelessWidget {
  const LeaderboardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LeaderboardsVM>(
      create: (_) => LeaderboardsVM(),
      child: Consumer<LeaderboardsVM>(
        builder: (context, LeaderboardsVM vm, _) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                children: [
                  const _League(),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: _Start(),
                  ),
                  const SizedBox(height: 5),
                  ...List.generate(vm.students.length, (index) {
                    final stu = vm.students[index];
                    return _Item(student: stu, rank: index + 1);
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
