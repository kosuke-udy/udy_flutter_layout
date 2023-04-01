part of udy_flutter_layout;

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    this.topBar,
    required this.body,
  }) : super(key: key);

  final Widget? topBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          topBar ?? TopBar.md(),
          body,
        ],
      ),
    );
  }
}
