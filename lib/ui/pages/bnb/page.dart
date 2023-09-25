part of 'imports.dart';

class BNB extends StatelessWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BNBVM>(
      create: (_) => BNBVM(),
      child: Consumer<BNBVM>(
        builder: (context, BNBVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            // appBar: AppBar(),
            body: [
              const HomePage(),
              const SavedPage(),
              // const LeaderboardsPage(),
              const ThemesPage(),
              const ProfilePage(),
            ][vm.currentIndex],
            bottomNavigationBar: const _BNB(),
          );
        },
      ),
    );
  }
}
