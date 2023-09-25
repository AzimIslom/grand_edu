part of 'imports.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 15),
                Text(
                  lan(t.progress),
                  style: GoogleFonts.roboto(
                    color: kPrimaryColor,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2.5),
            Expanded(
              child: BarChart(
                BarChartData(
                  barTouchData: barTouchData,
                  titlesData: titlesData,
                  borderData: borderData,
                  barGroups: List.generate(7, (index) {
                    final i = vm.part * 7 + index + 1;
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: vm.all.shorts
                              .firstWhere((element) => element.unit == i,
                                  orElse: () => ShortModel(percent: 0, unit: i))
                              .percent
                              .toDouble(),
                          gradient: _barsGradient,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    );
                  }),
                  gridData: const FlGridData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                ),
                swapAnimationDuration: const Duration(milliseconds: 500),
              ),
            ),
          ],
        );
      },
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          kPrimaryLightColor,
          kPrimaryColor,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    leading: Builder(builder: (context) {
      return IconButton(
        splashRadius: 25,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          "assets/icons/menu.png",
          height: 25,
          color: kPrimaryColor,
        ),
      );
    }),
    title: Text(
      lan(t.grandEdu),
      style: GoogleFonts.josefinSans(
        color: kPrimaryColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        splashRadius: 25,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          "assets/icons/notification.png",
          height: 25,
          color: kPrimaryColor,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
}

class _Drawer extends StatelessWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryLightColor.withOpacity(.85),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12),
        ),
      ),
      child: const Column(),
    );
  }
}

class _Homework extends StatelessWidget {
  final GroupModel group;
  final UnitModel unit;
  final VoidCallback onBack;

  const _Homework({
    Key? key,
    required this.group,
    required this.unit,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int all = 0;
    for (var i in unit.cats) {
      all += i.percent;
    }
    final l = unit.cats.length;
    int percent = l == 0 ? 0 : (all / l).ceil();
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ThemeDetail(
              theme: themes.firstWhere((element) => element.unit == group.unit),
            ),
            type: PageTransitionType.rightToLeft,
          ),
        ).then((value) {
          onBack();
        });
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 3,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lan(t.unit),
                          style: GoogleFonts.lora(
                            height: 1,
                            color: kPrimaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${group.unit}.${1 + (unit.formula ? 1 : 0) + (unit.video ? 1 : 0)}",
                          style: const TextStyle(
                            height: 1,
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Numbers",
                          ),
                        ),
                        const SizedBox(width: 3),
                        Image.asset(
                          "assets/icons/medal.png",
                          height: 20,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 7.5),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/${unit.video ? "test" : unit.formula ? "video" : "math"}.png",
                          height: 25,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          lan(unit.video
                              ? t.test
                              : unit.formula
                                  ? t.video
                                  : t.formula),
                          style: GoogleFonts.inter(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearPercentIndicator(
              lineHeight: 10,
              padding: EdgeInsets.zero,
              percent: percent.toDouble(),
              barRadius: const Radius.circular(12),
              backgroundColor: kPrimaryColor.withOpacity(.15),
              progressColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _Coins extends StatelessWidget {
  const _Coins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/icons/coins.png",
                  height: 30,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 5),
                const Text(
                  '1833',
                  style: TextStyle(
                    fontFamily: "Numbers",
                    fontSize: 17.5,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Image.asset(
                  "assets/icons/xp.png",
                  height: 30,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 5),
                const Text(
                  '1583',
                  style: TextStyle(
                    fontFamily: "Numbers",
                    fontSize: 17.5,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Repeat extends StatelessWidget {
  const _Repeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              "assets/icons/repeat.png",
              height: 17,
              color: kPrimaryColor,
            ),
            const SizedBox(width: 10),
            Text(
              lan(t.repeat),
              style: GoogleFonts.lora(
                color: kPrimaryColor,
                fontSize: 17.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            __RepeatItem(
              title: t.formula,
              path: 'assets/icons/formula2.png',
              des: def.formula,
              onTap: () {},
            ),
            const SizedBox(width: 5),
            __RepeatItem(
              title: t.theme,
              path: 'assets/icons/book.png',
              des: def.theme,
              onTap: () {},
            ),
            const SizedBox(width: 5),
            __RepeatItem(
              title: t.errors,
              path: 'assets/icons/error.png',
              des: def.error,
              onTap: null,
            ),
          ],
        ),
      ],
    );
  }
}

class __RepeatItem extends StatelessWidget {
  final String title;
  final String des;
  final String path;
  final VoidCallback? onTap;

  const __RepeatItem({
    Key? key,
    required this.title,
    required this.path,
    required this.des,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kPrimaryLightColor,
          ),
          child: Column(
            children: [
              Image.asset(
                path,
                color: kPrimaryColor,
                height: 30,
              ),
              const SizedBox(height: 5),
              Text(
                lan(title),
                style: GoogleFonts.poppins(
                  color: kPrimaryColor,
                  fontSize: 17,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                lan(des),
                style: GoogleFonts.quicksand(
                  color: kPrimaryColor,
                  fontSize: 12,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Shop extends StatelessWidget {
  const _Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  "assets/icons/shop.png",
                  height: 20,
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 5),
                Text(
                  lan(t.shop),
                  style: GoogleFonts.lora(
                    color: kPrimaryColor,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      lan(t.seeAll),
                      style: GoogleFonts.poppins(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: vm.shop
                  .map(
                    (e) => Expanded(child: __ShopItem(shop: e)),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class _League extends StatelessWidget {
  const _League({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lan(def.continueLeague),
          style: GoogleFonts.roboto(
            color: kPrimaryColor,
            fontSize: 17.5,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            lan(t.continuee),
            style: GoogleFonts.roboto(
              color: c.white,
              fontSize: 17.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _Al extends StatelessWidget {
  const _Al({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        final l = vm.al;
        final n = DateTime.now();
        return vm.al == null ||
                vm.al!.status == t.cancelled ||
                vm.al!.meeting.isBefore(n)
            ? const SizedBox.shrink()
            : Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: vm.al == null ? 0 : 7.5),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${lan(l!.meeting.day == n.day ? t.today : l.meeting.day == n.day + 1 ? t.tomorrow : t.dayAT)} ${DateFormat.Hm().format(vm.al!.meeting)} ${lan(def.haveAl)}",
                  style: GoogleFonts.roboto(
                    color: kPrimaryColor,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
      },
    );
  }
}

class __ShopItem extends StatelessWidget {
  final ShopGenModel shop;

  const __ShopItem({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Image.asset(
                      shop.path,
                      fit: BoxFit.fill,
                      color: kPrimaryColor,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Text(
                    shop.title,
                    style: GoogleFonts.quicksand(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Leaderboards extends StatelessWidget {
  const _Leaderboards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Stats extends StatelessWidget {
  const _Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
