part of 'imports.dart';

class _Empty extends StatelessWidget {
  const _Empty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SupportVM>(
            builder: (context, SupportVM vm, _) {
              return ElevatedButton(
                onPressed: () {
                  __book(context, () {
                    vm.initAl();
                    print(vm.al);
                  });
                },
                child: Text(
                  lan(t.booking),
                  style: GoogleFonts.lora(
                    color: kPrimaryLightColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            lan(def.support),
            style: GoogleFonts.quicksand(
              color: kPrimaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _Feedback extends StatelessWidget {
  const _Feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SupportVM>(
      builder: (context, SupportVM vm, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lan(def.feedback),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: vm.feedback,
                    cursorColor: kPrimaryColor,
                    autocorrect: false,
                    textInputAction: TextInputAction.newline,
                    onChanged: (val) {
                      vm.notifyListeners();
                    },
                    maxLines: null,
                    maxLength: vm.feedback.text.length > 200 ? 300 : null,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: lan(t.feedback),
                      hintStyle: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: 0,
                    glowColor: kPrimaryLightColor.withOpacity(.5),
                    minRating: 1,
                    unratedColor: kPrimaryLightColor,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, _) => const Icon(
                      CupertinoIcons.star_fill,
                      color: kPrimaryColor,
                    ),
                    onRatingUpdate: vm.selectStars,
                  ),
                  const SizedBox(height: 10),
                  RoundedLoadingButton(
                    controller: vm._btnController2,
                    successColor: kPrimaryColor,
                    color: kPrimaryColor,
                    onPressed: vm.submit,
                    child: Text(
                      lan(t.save),
                      style: TextStyle(
                        color: c.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ti = DateTime.now();
    return Consumer<SupportVM>(
      builder: (context, SupportVM vm, _) {
        final al = vm.al!;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              al.status == t.waiting
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        Image.asset(
                          "assets/icons/status.png",
                          height: 30,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          lan(al.status),
                          style: GoogleFonts.quicksand(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 7.5),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/date.png",
                    height: 25,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    lan(
                      al.meeting.day == ti.day
                          ? t.today
                          : al.meeting.day == ti.day + 1
                              ? t.tomorrow
                              : t.dayAT,
                    ),
                    style: GoogleFonts.roboto(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat.Hm().format(al.meeting),
                    style: GoogleFonts.roboto(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/support.png",
                    height: 27.5,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${vm.support.name} ${vm.support.surname}",
                    style: GoogleFonts.roboto(
                      color: kPrimaryColor,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/target.png",
                    height: 27.5,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      al.target,
                      style: GoogleFonts.roboto(
                        color: kPrimaryColor,
                        fontSize: 16,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              vm.al!.status == t.waiting
                  ? ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: kPrimaryLightColor,
                          builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 60,
                                top: 20,
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    lan(def.reapply),
                                    style: const TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  RoundedLoadingButton(
                                    controller: vm._btnController2,
                                    successColor: kPrimaryColor,
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      vm.cancel(context);
                                    },
                                    child: Text(
                                      lan(t.cancel),
                                      style: TextStyle(
                                        color: c.white,
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).then((value) {
                          vm.init();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(
                        lan(t.cancel),
                        style: TextStyle(
                          color: c.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : vm.alTime.isBefore(DateTime.now())
                      ? ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            lan(t.booking),
                            style: const TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : Text(
                          lan(def.reapply),
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
            ],
          ),
        );
      },
    );
  }
}

void __book(BuildContext context, VoidCallback onBack) {
  final size = MediaQuery.of(context).size;
  final List<String> times = [t.today, t.tomorrow, t.dayAT];
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor: kPrimaryLightColor,
    builder: (_) {
      return ChangeNotifierProvider<SupportVM>(
        create: (_) => SupportVM(),
        child: Consumer<SupportVM>(builder: (context, SupportVM vm, _) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            height: size.height * .8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: times
                      .map(
                        (e) => Expanded(
                          child: InkWell(
                            onTap: () {
                              vm.selectDay(e);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 7.5,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              decoration: BoxDecoration(
                                color: vm.day == e ? kPrimaryColor : c.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                lan(e),
                                style: GoogleFonts.quicksand(
                                  color: vm.day == e ? c.white : kPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                TextField(
                  maxLines: 5,
                  controller: vm.problem,
                  maxLength: vm.problem.text.length > 200 ? 300 : null,
                  style: GoogleFonts.lora(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  onChanged: (a) {
                    vm.notifyListeners();
                  },
                  autocorrect: false,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    fillColor: c.white,
                    hintText: lan(t.problem),
                    hintStyle: GoogleFonts.quicksand(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    helperStyle: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: vm.times.length,
                    itemBuilder: (_, int index) {
                      final time = vm.times[index];
                      return InkWell(
                        onTap: () {
                          vm.select(time);
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color:
                                vm.selected == time ? kPrimaryColor : c.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              DateFormat.Hm().format(time),
                              style: GoogleFonts.lora(
                                color: vm.selected == time
                                    ? c.white
                                    : kPrimaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                RoundedLoadingButton(
                  color: kPrimaryColor,
                  successColor: kPrimaryColor,
                  onPressed: () {
                    vm.back(context);
                  },
                  controller: vm._btnController,
                  child: Text(
                    lan(t.booking),
                    style: GoogleFonts.lora(
                      color: kPrimaryLightColor,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        }),
      );
    },
  ).then((value) {
    onBack();
  });
}
