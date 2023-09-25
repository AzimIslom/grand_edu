part of 'imports.dart';

class _Question extends StatelessWidget {
  const _Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeagueVM>(
      builder: (context, LeagueVM vm, _) {
        return Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: vm.question
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 5,
                    ),
                    child: Math.tex(
                      e,
                      textStyle: GoogleFonts.poppins(
                        color: kPrimaryColor,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _V extends StatelessWidget {
  const _V({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeagueVM>(
      builder: (context, LeagueVM vm, _) {
        return Column(
          children: List.generate(vm.variants.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  vm.select(index);
                },
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: vm.selected == index
                        ? kPrimaryColor
                        : kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: vm.variants[index]
                            .map(
                              (e) => Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Math.tex(
                                    e,
                                    textStyle: GoogleFonts.poppins(
                                      color: vm.selected == index
                                          ? c.white
                                          : kPrimaryColor,
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeagueVM>(
      builder: (context, LeagueVM vm, _) {
        return vm.applied
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () async {
                        vm.saveAll();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(
                        lan(t.exit),
                        style: TextStyle(
                          color: c.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: vm.next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(
                        lan(t.next),
                        style: TextStyle(
                          color: c.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  IconButton(
                    onPressed: vm.saveQues,
                    splashRadius: 32.5,
                    icon: Image.asset(
                      "assets/icons/saved.png",
                      color: vm.isSaved
                          ? kPrimaryColor
                          : kPrimaryColor.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: vm.hasNext()
                          ? vm.selected == null
                              ? () {}
                              : vm.apply
                          : vm.apply,
                      child: Text(
                        lan(
                          vm.hasNext()
                              ? vm.selected == null
                                  ? t.select
                                  : t.submit
                              : t.apply,
                        ),
                        style: TextStyle(
                          color: c.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
