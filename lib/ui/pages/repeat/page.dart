part of 'imports.dart';

class RepeatPage extends StatelessWidget {
  const RepeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RepeatVM>(
      create: (_) => RepeatVM(),
      child: Consumer<RepeatVM>(builder: (context, RepeatVM vm, _) {
        return Scaffold();
      }),
    );
  }
}
