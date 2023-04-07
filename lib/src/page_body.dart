part of udy_flutter_layout;

class PageBody extends StatelessWidget {
  final Widget child;

  const PageBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: child,
    );
  }
}
