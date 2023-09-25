part of 'imports.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemesVM>(
      create: (_) => ThemesVM(),
      child: const Scaffold(
        body: SafeArea(
          child: Center(
            child: _Slider(),
          ),
        ),
      ),
    );
  }
}
