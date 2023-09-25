part of 'imports.dart';

class _Watch extends StatelessWidget {
  const _Watch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoDetailVM>(
      builder: (context, VideoDetailVM vm, _) {
        return OrientationBuilder(
          builder: (context, Orientation or) {
            vm.change(or == Orientation.landscape);
            return YoutubePlayer(
              controller: vm.controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: kPrimaryColor,
              progressColors: const ProgressBarColors(
                playedColor: kPrimaryColor,
                handleColor: kPrimaryLightColor,
              ),
              onReady: () {
                vm.controller.addListener(
                  () {
                    vm.notifyListeners();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoDetailVM>(
      builder: (context, VideoDetailVM vm, _) {
        if (vm.ori) {
          return const SizedBox.shrink();
        } else {
          return Row(
            children: [
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashRadius: 25,
                icon: const Icon(
                  CupertinoIcons.chevron_left,
                  color: kPrimaryColor,
                  size: 30,
                ),
              ),
              Expanded(
                child: RoundedLoadingButton(
                  controller: vm._btnController,
                  onPressed: () {
                    vm.save(context);
                  },
                  color: kPrimaryColor,
                  child: Text(
                    lan(t.watched),
                    style: TextStyle(
                      color: c.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
