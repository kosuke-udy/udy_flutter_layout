part of udy_flutter_layout;

class RefreshableListView extends StatelessWidget {
  final List<Widget> children;
  final Future<void> Function()? onRefresh;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final EdgeInsets padding;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  const RefreshableListView({
    Key? key,
    required this.children,
    this.onRefresh,
    this.shrinkWrap = false,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.padding = const EdgeInsets.all(0),
    this.scrollDirection = Axis.vertical,
    this.cacheExtent = 2000,
    this.reverse = false,
    this.controller,
    this.primary,
    this.itemExtent,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listView = ListView(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      children: children,
    );

    return Scrollbar(
      child: onRefresh == null || onRefresh == () async {}
          ? listView
          : RefreshIndicator(
              onRefresh: onRefresh!,
              displacement: 0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              backgroundColor: Colors.transparent,
              child: listView,
            ),
    );
  }
}
