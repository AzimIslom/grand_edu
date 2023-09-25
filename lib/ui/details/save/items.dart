part of 'imports.dart';

class _Question extends StatelessWidget {
  const _Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SaveDetailVM>(
      builder: (context, SaveDetailVM vm, _) {
        return Wrap(
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
        );
      },
    );
  }
}

class _V extends StatelessWidget {
  const _V({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SaveDetailVM>(
      builder: (context, SaveDetailVM vm, _) {
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
                        children: vm.variants[index]
                            .map(
                              (e) => Wrap(
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
    return Consumer<SaveDetailVM>(
      builder: (context, SaveDetailVM vm, _) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
          ),
          onPressed: vm.next,
          child: Text(
            lan(t.next),
            style: TextStyle(
              color: c.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}

class _Num extends StatelessWidget {
  const _Num({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SaveDetailVM>(
      builder: (context, SaveDetailVM vm, _) {
        return Text(
          "${vm.current + 1}-${lan(t.question).toLowerCase()}",
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        );
      },
    );
  }
}

// class _R extends StatelessWidget {
//   const _R({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SaveDetailVM>(
//       builder: (context, SaveDetailVM vm, _) {
//         final c = vm.results.where((element) => element).length;
//         final p = c / 10;
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Expanded(
//               child: Center(
//                 child: CircularPercentIndicator(
//                   radius: 100,
//                   animation: true,
//                   lineWidth: 10,
//                   header: Padding(
//                     padding: const EdgeInsets.only(bottom: 15),
//                     child: Text(
//                       lan(t.result),
//                       style: const TextStyle(
//                         color: kPrimaryColor,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   percent: p,
//                   center: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 10),
//                       Text(
//                         "$c/10",
//                         style: const TextStyle(
//                           color: kPrimaryColor,
//                           fontSize: 35,
//                           fontFamily: "Numbers",
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "${(p * 100).ceil()}%",
//                         style: const TextStyle(
//                           color: kPrimaryColor,
//                           fontSize: 35,
//                           fontFamily: "Numbers",
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                   circularStrokeCap: CircularStrokeCap.round,
//                   backgroundColor: kPrimaryLightColor,
//                   progressColor: kPrimaryColor,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: RoundedLoadingButton(
//                 color: kPrimaryColor,
//                 successColor: kPrimaryColor,
//                 onPressed: () {
//                   // vm.apply(context);
//                 },
//                 controller: vm._btnController,
//                 child: Text(
//                   lan(t.apply),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//           ],
//         );
//       },
//     );
//   }
// }
