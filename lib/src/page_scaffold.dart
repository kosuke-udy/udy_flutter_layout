part of udy_flutter_layout;

class PageScaffold extends StatelessWidget {
  final Widget body;
  // final Widget? topBar;
  final Widget? appBarTitle;

  const PageScaffold({
    Key? key,
    // this.topBar,
    required this.body,
    this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       floating: true,
      //       pinned: true,
      //       snap: true,
      //       stretch: false,
      //       titleTextStyle: Theme.of(context)
      //           .textTheme
      //           .displayMedium!
      //           .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      //       title: appBarTitle,
      //     ),
      //     PageBody(
      //       child: body,
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        title: appBarTitle,
      ),
      body: body,
    );
  }
}
