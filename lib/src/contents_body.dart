part of udy_flutter_layout;

class ContentsBody extends StatelessWidget {
  const ContentsBody({
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
