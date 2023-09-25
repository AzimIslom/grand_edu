part of 'imports.dart';

class _League extends StatelessWidget {
  const _League({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Image.asset(
              "assets/icons/diamond.png",
              height: 100,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lan(t.nextLeague),
                      style: GoogleFonts.lora(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kGreen2,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lan(t.keepLeague),
                      style: GoogleFonts.lora(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kPink,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lan(t.previousLeague),
                      style: GoogleFonts.lora(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kRed,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lan(t.x2prevLeague),
                      style: GoogleFonts.lora(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Start extends StatelessWidget {
  const _Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            child: const LeaguePage(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/resume2.png",
                height: 25,
                color: kPrimaryLightColor,
              ),
              const SizedBox(width: 10),
              Text(
                lan(t.resume),
                style: GoogleFonts.lora(
                  color: kPrimaryLightColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          LinearPercentIndicator(
            lineHeight: 2.5,
            barRadius: const Radius.circular(12),
            percent: .7,
            backgroundColor: kPrimaryLightColor.withOpacity(.3),
            progressColor: kPrimaryLightColor,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final StudentModel student;
  final int rank;

  const _Item({
    Key? key,
    required this.student,
    required this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 40,
          decoration: BoxDecoration(
            color: rank < 5
                ? kGreen
                : rank < 10
                    ? kGreen2
                    : rank < 15
                        ? kPink
                        : kRed,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Card(
            color: kPrimaryLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              minLeadingWidth: 5,
              leading: rank > 3
                  ? Text(
                      rank.toString(),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontFamily: "Numbers",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Image.asset(
                      "assets/icons/$rank.png",
                      height: 40,
                    ),
              title: Text(
                "${student.name} ${student.surname}",
                style: GoogleFonts.openSans(
                  color: rank == 1
                      ? kGold
                      : rank == 2
                          ? kGreen
                          : rank == 3
                              ? kRed
                              : kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: Text(
                student.xp.toString(),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontFamily: "Numbers",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
