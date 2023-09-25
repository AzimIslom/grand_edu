part of 'imports.dart';

class _Formula extends StatelessWidget {
  final ThemeModel theme;
  final UnitModel unit;
  final Function(UnitModel) onBack;

  const _Formula(
      {Key? key, required this.theme, required this.unit, required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Ink(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/math.png",
                  color: c.white,
                  height: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  lan(t.formula),
                  style: GoogleFonts.josefinSans(
                    color: c.white,
                    fontSize: 22.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: FormulaDetail(theme: theme, unit: unit),
                  type: PageTransitionType.rightToLeft,
                ),
              ).then((value) {
                if (value != null) {
                  onBack(value);
                }
              });
            },
            splashRadius: 30,
            icon: Image.asset(
              "assets/icons/${unit.formula ? "star" : "resume"}.png",
              height: 25,
              color: c.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Video extends StatelessWidget {
  final ThemeModel theme;
  final UnitModel unit;
  final Function(UnitModel) onBack;

  const _Video({
    Key? key,
    required this.theme,
    required this.unit,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Ink(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/video.png",
            color: c.white,
            height: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              lan(t.video),
              style: GoogleFonts.josefinSans(
                color: c.white,
                fontSize: 22.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: unit.formula == false
                ? null
                : () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: VideoDetail(theme: theme, unit: unit),
                        type: PageTransitionType.rightToLeft,
                      ),
                    ).then((value) {
                      if (value != null) {
                        onBack(value);
                      }
                    });
                  },
            splashRadius: 30,
            icon: Image.asset(
              "assets/icons/${unit.formula == false ? "lock" : unit.video ? "star" : "resume"}.png",
              height: 25,
              color: c.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Cats extends StatelessWidget {
  final ThemeModel theme;
  final UnitModel unit;
  final Function(UnitModel) onBack;

  const _Cats(
      {Key? key, required this.theme, required this.unit, required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeDetailVM>(
      builder: (context, ThemeDetailVM vm, _) {
        return Column(
          children: [
            Ink(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/test.png",
                    color: c.white,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      lan(t.questions),
                      style: GoogleFonts.josefinSans(
                        color: c.white,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  unit.video
                      ? Row(
                          children: [
                            Image.asset(
                              "assets/icons/percent.png",
                              height: 30,
                              color: c.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${vm.av}%",
                              style: TextStyle(
                                color: c.white,
                                fontFamily: "Numbers",
                                fontSize: 22.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : Image.asset(
                          "assets/icons/lock.png",
                          height: 30,
                          color: c.white,
                        ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            vm.unit.video
                ? _Slider(
                    onBack: (UnitModel unit) {
                      onBack(unit);
                    },
                    unit: vm.unit,
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}

class _Slider extends StatelessWidget {
  final Function(UnitModel) onBack;
  final UnitModel unit;

  const _Slider({Key? key, required this.onBack, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDetailVM>(
      builder: (context, ThemeDetailVM vm, _) {
        return vm.currentCat == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: .8,
                  aspectRatio: 1.5,
                  initialPage: vm.currentCat!,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
                items: List.generate(
                  vm.cats.length,
                  (index) {
                    final p = vm.percent(index + 1);
                    final cat = vm.cats[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cat.title * 25,
                            style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: TestDetailPage(
                                    cat: cat,
                                    unit: vm.unit,
                                  ),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              ).then((value) {
                                onBack(unit);
                              });
                            },
                            child: Text(
                              lan(t.solve),
                              style: GoogleFonts.josefinSans(
                                color: c.white,
                                fontSize: 17.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: p < 70
                                ? [
                                    Image.asset(
                                      "assets/icons/percent.png",
                                      height: 30,
                                      color: kPrimaryColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "$p%",
                                      style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: "Numbers",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]
                                : List.generate(
                                    p >= 90
                                        ? 3
                                        : p >= 80
                                            ? 2
                                            : p >= 70
                                                ? 1
                                                : 0,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2.5,
                                      ),
                                      child: Image.asset(
                                        "assets/icons/star.png",
                                        height: p >= 90 && index == 1 ? 45 : 30,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
