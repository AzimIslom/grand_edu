part of 'imports.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedVM>(
      create: (_) => SavedVM(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<SavedVM>(
            builder: (context, SavedVM vm, _) {
              print(vm.saves.saves);
              return vm.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : vm.saves.saves.isEmpty
                      ? Center(
                          child: Lottie.asset(
                            "assets/icons/empty.json",
                            repeat: false,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          itemCount: vm.saves.saves.length,
                          itemBuilder: (_, int index) {
                            final inner = vm.saves.saves[index];
                            final theme = themes.firstWhere(
                                (element) => element.unit == inner.unit);
                            return _Item(
                              theme: theme,
                              inner: inner,
                              all: vm.saves,
                              onBack: () {
                                vm.init();
                              },
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
