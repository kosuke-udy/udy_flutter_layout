part of udy_flutter_layout;

class ContentsScaffold extends StatelessWidget {
  const ContentsScaffold({
    Key? key,
    this.topBar = const TopBar(),
    required this.body,
  }) : super(key: key);

  final TopBar topBar;
  final ContentsBody body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          topBar,
          body,
        ],
      ),
    );
  }
}
