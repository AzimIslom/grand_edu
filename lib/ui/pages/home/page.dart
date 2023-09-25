part of 'imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Consumer<HomeVM>(builder: (context, HomeVM vm, _) {
        return Scaffold(
          // drawerEnableOpenDragGesture: false,
          drawer: const _Drawer(),
          appBar: _appBar(context),
          body: SafeArea(
            child: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _Homework(
                        group: vm.group,
                        unit: vm.unit,
                        onBack: vm.init,
                      ),
                      const _Al(),
                      const SizedBox(height: 15),
                      const _Repeat(),
                      // const SizedBox(height: 15),
                      // const Divider(color: kPrimaryColor),
                      // const _League(),
                      const SizedBox(height: 5),
                      const Divider(color: kPrimaryColor),
                      const SizedBox(
                        height: 200,
                        child: _BarChart(),
                      ),
                      // const SizedBox(height: 15),
                      // const _Shop(),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
