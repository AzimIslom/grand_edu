part of 'imports.dart';

class _Top extends StatelessWidget {
  const _Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<SavedVM>(
      builder: (context, SavedVM vm, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            t.question,
            t.formula,
            t.test,
          ]
              .map(
                (e) => _TopItem(
                  isActive: vm.current == e,
                  title: e,
                  onTap: () {
                    vm.selectCurrent(e);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _TopItem extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onTap;

  const _TopItem({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 17.5,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isActive ? kPrimaryColor : kPrimaryLightColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/$title.png",
                height: 25,
                color: isActive ? kPrimaryLightColor : kPrimaryColor,
              ),
              const SizedBox(width: 5),
              Text(
                lan(title),
                style: GoogleFonts.lora(
                  color: isActive ? kPrimaryLightColor : kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ThemeModel theme;
  final InnerModel inner;
  final AllSaveModel all;
  final VoidCallback onBack;

  const _Item({
    Key? key,
    required this.theme,
    required this.inner,
    required this.all, required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: SaveDetail(all: all, unit: inner.unit),
              type: PageTransitionType.rightToLeft,
            ),
          ).then((value) {
            onBack();
          });
        },
        minLeadingWidth: 10,
        leading: Text(
          theme.unit.toString(),
          style: GoogleFonts.poppins(
            color: kPrimaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          theme.title,
          style: GoogleFonts.poppins(
            color: kPrimaryColor,
            fontSize: 17.5,
            height: 1.25,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              inner.ques.length.toString(),
              style: GoogleFonts.poppins(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              "assets/icons/saved.png",
              color: kPrimaryColor,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
