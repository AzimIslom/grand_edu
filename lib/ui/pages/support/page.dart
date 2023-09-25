part of 'imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupportVM>(
      create: (_) => SupportVM(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: c.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                auth.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        body: Consumer<SupportVM>(
          builder: (context, SupportVM vm, _) {
            final now = DateTime.now().add(const Duration(minutes: 30));
            return vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : SafeArea(
                    child: vm.al == null
                        ? const _Empty()
                        : vm.al!.meeting.isBefore(now)
                            ? const _Feedback()
                            : const _Info(),
                  );
          },
        ),
      ),
    );
  }
}
