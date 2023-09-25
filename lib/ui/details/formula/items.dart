part of 'imports.dart';

class _Formula extends StatelessWidget {
  const _Formula({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormulaDetailVM>(
      builder: (context, FormulaDetailVM vm, _) {
        return Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: vm.formula.map(
              (e) => Math.tex(
                e,
                textStyle: GoogleFonts.poppins(
                  color: kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ).toList(),
          ),
        );
      },
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormulaDetailVM>(
      builder: (context, FormulaDetailVM vm, _) {
        return vm.isLoading
            ? const CircularProgressIndicator(
                color: kPrimaryColor,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    vm.next(context);
                  },
                  child: Text(
                    lan(t.memo),
                    style: GoogleFonts.quicksand(
                      color: kPrimaryLightColor,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
