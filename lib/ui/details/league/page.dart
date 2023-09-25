part of 'imports.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LeagueVM>(
      create: (_) => LeagueVM(),
      child: Consumer<LeagueVM>(
        builder: (context, LeagueVM vm, _) {
          return WillPopScope(
            onWillPop: () async {
              await vm.saveAll();
              print("popppppppppppppppppppppp");
              return true;
            },
            child: Scaffold(
              body: vm.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: _Question(),
                            ),
                            _V(),
                            SizedBox(height: 10),
                            _Btn(),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
