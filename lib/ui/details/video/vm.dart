part of 'imports.dart';

class VideoDetailVM extends ChangeNotifier {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final UnitModel unit;
  final ThemeModel theme;
  bool ori = false;
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'or1JlI3g5gw',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  VideoDetailVM(this.unit, this.theme);

  void change(bool val) {
    ori = val;
    // notifyListeners();
  }

  void save(BuildContext context) async {
    if (!unit.video) {
      unit.video = true;
      await fb.updateUnit(unit, theme.unit.toString());
    }
    _btnController.success();
    Navigator.pop(context, unit);
  }
}
