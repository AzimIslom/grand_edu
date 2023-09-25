part of 'imports.dart';

class _Slider extends StatelessWidget {
  const _Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemesVM>(
      builder: (context, ThemesVM vm, _) {
        return vm.isLoading
            ? const CircularProgressIndicator(
                color: kPrimaryColor,
              )
            : CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: .85,
                  aspectRatio: 1,
                  initialPage: vm.initPage,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  onPageChanged: (int index, _) {
                    // vm.storeCurrentTheme(vm.chapters[index]);
                  },
                ),
                items: List.generate(
                  themes.length,
                  (index) {
                    final theme = themes[index];
                    final short = vm.all.shorts.firstWhere(
                      (element) => element.unit == theme.unit,
                      orElse: () => ShortModel(percent: 0, unit: theme.unit),
                    );
                    bool val = vm.group.unit < theme.unit;
                    return _ThemeItem(
                      theme: theme,
                      short: short,
                      onBack: vm.init,
                      locked: val,
                    );
                  },
                ),
              );
      },
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final ThemeModel theme;
  final ShortModel short;
  final VoidCallback onBack;
  final bool locked;

  const _ThemeItem({
    Key? key,
    required this.theme,
    required this.short,
    required this.onBack,
    required this.locked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("short nosL: ${short.toJson()}");
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: locked
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    theme.unit.toString(),
                    style: GoogleFonts.poppins(
                      color: kPrimaryColor.withOpacity(.3),
                      fontSize: 50,
                      height: 1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    theme.title,
                    style: GoogleFonts.poppins(
                      color: kPrimaryColor.withOpacity(.4),
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/icons/lock.png",
                    height: 100,
                    color: kPrimaryColor,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    theme.unit.toString(),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 60,
                      fontFamily: "Numbers",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    theme.title,
                    style: GoogleFonts.josefinSans(
                      color: kPrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  short.percent > 70
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            short.percent >= 70
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: kGold,
                                    size: 50,
                                  )
                                : const SizedBox.shrink(),
                            short.percent >= 80
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: kGold,
                                    size: 85,
                                  )
                                : const SizedBox.shrink(),
                            short.percent >= 80
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: kGold,
                                    size: 50,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/percent.png",
                              height: 30,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${short.percent}%",
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Numbers",
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: ThemeDetail(theme: theme),
                          type: PageTransitionType.rightToLeft,
                        ),
                      ).then((value) {
                        onBack();
                      });
                    },
                    child: Text(
                      lan(
                        short.percent == 0
                            ? t.start
                            : short.percent < 100
                                ? t.continuee
                                : t.repeat,
                      ),
                      style: GoogleFonts.josefinSans(
                        color: kPrimaryLightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
