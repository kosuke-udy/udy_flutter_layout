part of udy_flutter_layout;

class ScreenScaffold extends StatefulWidget {
  final Widget body, navRailLeading;
  final List<NavWidgetDestination> destinations;

  const ScreenScaffold({
    Key? key,
    required this.body,
    required this.destinations,
    this.navRailLeading = const Icon(Icons.menu),
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
      primaryNavigation: generatePrimaryNavSlot(widget.destinations
          .map<NavigationRailDestination>(
              (e) => e.toNavigationRailDestination())
          .toList()),
      bottomNavigation: generateBottomNavSlot(widget.destinations
          .map<NavigationDestination>((e) => e.toNavigationDestination())
          .toList()),
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
  ) {
    Builder builder(dynamic _) => AdaptiveScaffold.standardNavigationRail(
          destinations: destinations,
          selectedIndex: _selectedNavIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              _selectedNavIndex = newIndex;
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
          key: const Key("Primary Navigation Medium"),
          inAnimation: inAnimation,
          builder: builder,
        ),
        Breakpoints.large: SlotLayout.from(
          key: const Key("Primary Navigation Large"),
          inAnimation: inAnimation,
          builder: builder,
        ),
      },
    );
  }

  SlotLayout generateBottomNavSlot(
    List<NavigationDestination> destinations,
  ) {
    return SlotLayout(
      config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key("Bottom Navigation Small"),
          builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
            destinations: destinations,
            currentIndex: _selectedNavIndex,
            onDestinationSelected: (newIndex) {
              setState(() {
                _selectedNavIndex = newIndex;
              });
            },
          ),
        ),
      },
    );
  }
}
