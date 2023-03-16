part of udy_flutter_layout;

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    this.titleData,
    this.actions,
  }) : super(key: key);

  final String? titleData;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return titleData != null
        ? SliverAppBar.medium(
            pinned: true, snap: true, floating: true, title: Text(titleData!))
        : const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
          );
  }
}
