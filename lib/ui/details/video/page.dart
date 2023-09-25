part of 'imports.dart';

class VideoDetail extends StatelessWidget {
  final ThemeModel theme;
  final UnitModel unit;

  const VideoDetail({Key? key, required this.theme, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VideoDetailVM>(
      create: (_) => VideoDetailVM(unit, theme),
      child: const Scaffold(
        // appBar: GlassAppBar(
        //   leading: IconButton(
        //     splashRadius: 25,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       CupertinoIcons.chevron_left,
        //       color: kPrimaryColor,
        //       size: 30,
        //     ),
        //   ),
        //   border: 0,
        //   blur: 20,
        //   centerTitle: true,
        //   title: Text(
        //     lan(t.video),
        //     style: GoogleFonts.josefinSans(
        //       fontSize: 22.5,
        //       fontWeight: FontWeight.w700,
        //       color: kPrimaryColor,
        //     ),
        //     maxLines: 2,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        body: Center(
          child: _Watch(),
        ),
        floatingActionButton: _Btn(),
      ),
    );
  }
}
