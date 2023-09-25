part of 'imports.dart';

class FormulaDetail extends StatelessWidget {
  final ThemeModel theme;
  final UnitModel unit;

  const FormulaDetail({Key? key, required this.theme, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormulaDetailVM>(
      create: (_) => FormulaDetailVM(theme, unit),
      child: Scaffold(
        backgroundColor: c.white,
        appBar: GlassAppBar(
          leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.chevron_left,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
          border: 0,
          blur: 20,
          centerTitle: false,
          title: Text(
            lan(def.memoFormula),
            style: GoogleFonts.josefinSans(
              fontSize: 22.5,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        body: Consumer<FormulaDetailVM>(
          builder: (context, FormulaDetailVM vm, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${vm.current}-${lan(t.formula2)}",
                  style: GoogleFonts.quicksand(
                    color: kPrimaryColor,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const _Formula(),
                const SizedBox(height: 200),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const _Btn(),
      ),
    );
  }
}
