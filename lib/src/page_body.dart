part of udy_flutter_layout;

class PageBody extends StatelessWidget {
  const PageBody({
    Key? key,
    required this.child,
    this.fillRemaining = false,
  }) : super(key: key);

  final Widget child;
  final bool fillRemaining;

  @override
  Widget build(BuildContext context) {
    return fillRemaining
        ? SliverFillRemaining(child: child)
        : SliverToBoxAdapter(child: child);
  }
}
