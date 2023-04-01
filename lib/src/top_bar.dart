part of udy_flutter_layout;

class TopBar extends StatelessWidget {
  final SliverAppBar sliverAppBar;

  const TopBar({
    Key? key,
    required this.sliverAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sliverAppBar;
  }

  factory TopBar.md({
    Key? key,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? elevation,
    double? scrolledUnderElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    bool forceElevated = false,
    Color? backgroundColor,
    Color? foregroundColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    bool primary = true,
    bool? centerTitle,
    bool excludeHeaderSemantics = false,
    double? titleSpacing,
    double? collapsedHeight,
    double? expandedHeight,
    bool floating = true,
    bool pinned = true,
    bool snap = true,
    bool stretch = false,
    double stretchTriggerOffset = 100.0,
    AsyncCallback? onStretchTrigger,
    ShapeBorder? shape,
    // double? toolbarHeight,
    double? leadingWidth,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) =>
      TopBar(
        sliverAppBar: SliverAppBar.medium(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          scrolledUnderElevation: scrolledUnderElevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          forceElevated: forceElevated,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          collapsedHeight: collapsedHeight,
          expandedHeight: expandedHeight,
          floating: floating,
          pinned: pinned,
          snap: snap,
          stretch: stretch,
          stretchTriggerOffset: stretchTriggerOffset,
          onStretchTrigger: onStretchTrigger,
          shape: shape,
          // toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
        ),
      );
}
