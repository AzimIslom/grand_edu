part of 'imports.dart';

class _BNB extends StatelessWidget {
  const _BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BNBVM>(
      builder: (context, BNBVM vm, _) {
        return FlashyTabBar(
          selectedIndex: vm.currentIndex,
          height: 55,
          backgroundColor: kPrimaryLightColor,
          showElevation: true,
          onItemSelected: vm.changeIndex,
          iconSize: 20,
          items: [
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/home.png",
                height: 25,
                color: kPrimaryColor,
              ),
              title: Text(
                lan(t.home),
                style: GoogleFonts.quicksand(),
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/saved.png",
                height: 22.5,
                color: kPrimaryColor,
              ),
              title: Text(
                lan(t.saved),
                style: GoogleFonts.quicksand(),
              ),
            ),
            // FlashyTabBarItem(
            //   activeColor: kPrimaryColor,
            //   icon: Image.asset(
            //     "assets/icons/lead.png",
            //     height: 35,
            //     color: kPrimaryColor,
            //   ),
            //   title: Text(
            //     lan(t.leaderboards),
            //     style: GoogleFonts.quicksand(),
            //   ),
            // ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/theme.png",
                color: kPrimaryColor,
                height: 25,
              ),
              title: Text(
                lan(t.theme),
                style: GoogleFonts.quicksand(),
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/support.png",
                height: 25,
                color: kPrimaryColor,
              ),
              title: Text(
                lan(t.support),
                style: GoogleFonts.quicksand(),
              ),
            ),
          ],
        );
      },
    );
  }
}
