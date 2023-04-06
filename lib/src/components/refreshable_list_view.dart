part of udy_flutter_layout;

class RefreshableListView extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final List<Widget> children;

  const RefreshableListView({
    Key? key,
    this.onRefresh,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onRefresh == null || onRefresh == () async {}
        ? ListView(
            padding: const EdgeInsets.all(0),
            children: children,
          )
        : RefreshIndicator(
            onRefresh: onRefresh!,
            displacement: 0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            backgroundColor: Colors.transparent,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: children,
            ),
          );
  }
}
