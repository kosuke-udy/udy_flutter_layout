part of udy_flutter_layout;

class ScreenScaffold extends StatefulWidget {
  final Widget body, navRailLeading;
  final List<NavWidgetDestination> destinations;
  final Key navigatorKey;
  final void Function(int newIndex)? onDestinationSelected;

  const ScreenScaffold({
    Key? key,
    required this.body,
    required this.destinations,
    this.navRailLeading = const Icon(Icons.menu),
    this.navigatorKey = const Key("Navigator"),
    this.onDestinationSelected,
  }) : super(key: key);

  @override
  State<ScreenScaffold> createState() => _ScreenScaffoldState();
}

class _ScreenScaffoldState extends State<ScreenScaffold> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      internalAnimations: false,
      body: generateBodySlot(widget.body),
      primaryNavigation: generatePrimaryNavSlot(
        widget.destinations
            .map((e) => e.toNavigationRailDestination())
            .toList(),
        widget.onDestinationSelected ?? (_) {},
        widget.navigatorKey,
      ),
      bottomNavigation: generateBottomNavSlot(
        widget.destinations.map((e) => e.toBottomNavigationBarItem()).toList(),
        widget.onDestinationSelected ?? (_) {},
        widget.navigatorKey,
      ),
    );
  }

  static SlotLayout generateBodySlot(Widget body) {
    final keyMap = {
      Breakpoints.small: "Body Small",
      Breakpoints.medium: "Body Medium",
      Breakpoints.large: "Body Large",
    };

    return SlotLayout(
      config: keyMap.map((key, value) => MapEntry(
          key,
          SlotLayout.from(
            key: Key(value),
            builder: (_) => body,
          ))),
    );
  }

  SlotLayout generatePrimaryNavSlot(
    List<NavigationRailDestination> destinations,
    void Function(int) onDestinationSelected,
    Key navigatorKey,
  ) {
    Builder builder(dynamic _) => AdaptiveScaffold.standardNavigationRail(
          destinations: destinations,
          selectedIndex: _selectedNavIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              _selectedNavIndex = newIndex;
              onDestinationSelected(newIndex);
            });
          },
          leading: widget.navRailLeading,
        );
    const inAnimation = AdaptiveScaffold.leftOutIn;

    return SlotLayout(
      config: {
        // Breakpoints.small: SlotLayout.from(
        //   key: const Key("Primary Navigation Small"),
        //   builder: (_) => const SizedBox.shrink(),
        // ),
        Breakpoints.medium: SlotLayout.from(
          key: navigatorKey,
          inAnimation: inAnimation,
          builder: builder,
        ),
        Breakpoints.large: SlotLayout.from(
          key: navigatorKey,
          inAnimation: inAnimation,
          builder: builder,
        ),
      },
    );
  }

  SlotLayout generateBottomNavSlot(
    List<BottomNavigationBarItem> destinations,
    void Function(int) onDestinationSelected,
    Key navigatorKey,
  ) {
    return SlotLayout(
      config: {
        Breakpoints.small: SlotLayout.from(
          key: navigatorKey,
          builder: (_) => BottomNavigationBar(
            useLegacyColorScheme: false,
            type: BottomNavigationBarType.fixed,
            mouseCursor: SystemMouseCursors.none,
            items: destinations,
            currentIndex: _selectedNavIndex,
            onTap: (newIndex) {
              setState(() {
                _selectedNavIndex = newIndex;
                onDestinationSelected(newIndex);
              });
            },
          ),
        ),
      },
    );
  }
}
