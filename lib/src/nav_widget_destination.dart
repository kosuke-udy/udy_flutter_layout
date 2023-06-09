part of udy_flutter_layout;

class NavWidgetDestination {
  NavWidgetDestination({
    required this.icon,
    this.selectedIcon,
    required this.labelText,
    this.labelBuilder,
    this.bottomBarTooltip,
    this.railPadding,
    this.drawerBackgroundColor,
  });

  late Widget icon;
  late Widget? selectedIcon;
  late String labelText;
  late Widget Function(String)? labelBuilder;
  late String? bottomBarTooltip;
  late EdgeInsetsGeometry? railPadding;
  late Color? drawerBackgroundColor;

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: selectedIcon,
      label: labelText,
      tooltip: bottomBarTooltip,
    );
  }

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: labelText,
      tooltip: bottomBarTooltip,
    );
  }

  NavigationRailDestination toNavigationRailDestination() {
    final builder = labelBuilder ?? (String text) => Text(text);
    return NavigationRailDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: builder(labelText),
      padding: railPadding,
    );
  }

  NavigationDrawerDestination toNavigationDrawerDestination() {
    final builder = labelBuilder ?? (String text) => Text(text);
    return NavigationDrawerDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: builder(labelText),
    );
  }
}
