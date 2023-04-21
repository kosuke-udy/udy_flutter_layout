part of udy_flutter_layout;

class PageScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBarTitle;
  final void Function()? onBackButtonPressed;

  const PageScaffold({
    Key? key,
    // this.topBar,
    required this.body,
    this.appBarTitle,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: onBackButtonPressed == null,
        leading: onBackButtonPressed != null
            ? BackButton(
                onPressed: onBackButtonPressed!,
              )
            : null,
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
