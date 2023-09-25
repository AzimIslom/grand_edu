part of 'imports.dart';

class SaveDetail extends StatelessWidget {
  final AllSaveModel all;
  final int unit;

  const SaveDetail({
    Key? key,
    required this.all,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SaveDetailVM>(
      create: (_) => SaveDetailVM(all, unit),
      child: Consumer<SaveDetailVM>(
        builder: (context, SaveDetailVM vm, _) {
          return WillPopScope(
            onWillPop: () async {
              await vm.saveAll();
              return true;
            },
            child: Scaffold(
              backgroundColor: c.white,
              appBar: AppBar(
                backgroundColor: c.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () async {
                    await vm.saveAll();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.chevron_left,
                    color: kPrimaryColor,
                    size: 30,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "${vm.current + 1}/${vm.questions.length}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      vm.remove(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              body: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: Center(
                        child: _Question(),
                      ),
                    ),
                    _V(),
                    SizedBox(height: 20),
                    _Btn(),
                    SizedBox(height: 30),
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
