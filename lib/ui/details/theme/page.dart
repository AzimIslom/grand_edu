part of 'imports.dart';

class ThemeDetail extends StatelessWidget {
  final ThemeModel theme;

  const ThemeDetail({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeDetailVM>(
      create: (_) => ThemeDetailVM(theme),
      child: Consumer<ThemeDetailVM>(
        builder: (context, ThemeDetailVM vm, _) {
          return Scaffold(
            appBar: GlassAppBar(
              leading: IconButton(
                splashRadius: 25,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  CupertinoIcons.chevron_left,
                  color: kPrimaryColor,
                  size: 30,
                ),
              ),
              border: 0,
              blur: 20,
              centerTitle: true,
              title: Text(
                theme.title,
                style: GoogleFonts.josefinSans(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          _Formula(
                            theme: theme,
                            unit: vm.unit,
                            onBack: (unit) {
                              vm.onBack(unit, false);
                            },
                          ),
                          const SizedBox(height: 10),
                          _Video(
                            theme: theme,
                            unit: vm.unit,
                            onBack: (unit) {
                              vm.onBack(unit, false);
                            },
                          ),
                          const SizedBox(height: 7.5),
                          const Divider(color: kPrimaryColor),
                          const SizedBox(height: 7.5),
                          _Cats(
                            theme: theme,
                            unit: vm.unit,
                            onBack: (unit) {
                              vm.onBack(unit, true);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
