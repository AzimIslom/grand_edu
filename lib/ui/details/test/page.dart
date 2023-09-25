part of 'imports.dart';

class TestDetailPage extends StatelessWidget {
  final CatModel cat;
  final UnitModel unit;

  const TestDetailPage({
    Key? key,
    required this.cat,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TestDetailVM>(
      create: (_) => TestDetailVM(cat, unit),
      child: Scaffold(
        backgroundColor: c.white,
        body: SafeArea(
          child: Consumer<TestDetailVM>(
            builder: (context, TestDetailVM vm, _) {
              return WillPopScope(
                onWillPop: () async {
                  await vm.saveAll();
                  return true;
                },
                child: vm.showR
                    ? const _R()
                    : vm.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                _Num(),
                                Expanded(
                                  child: Center(
                                    child: _Question(),
                                  ),
                                ),
                                _V(),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 60,
                                  child: _Btn(),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
              );
            },
          ),
        ),
      ),
    );
  }
}
