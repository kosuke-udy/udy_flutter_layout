part of udy_flutter_layout;

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    Key? key,
    required this.body,
    this.destinations,
  }) : super(key: key);

  final Widget body;
  final List<NavWidgetDestination>? destinations;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      internalAnimations: false,
      body: generateBodySlot(body),
      primaryNavigation: destinations != null
          ? generatePrimaryNavSlot(destinations!
              .map<NavigationRailDestination>(
                  (e) => e.toNavigationRailDestination())
              .toList())
          : null,
      bottomNavigation: destinations != null
          ? generateBottomNavSlot(destinations!
              .map<NavigationDestination>((e) => e.toNavigationDestination())
              .toList())
          : null,
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

  static SlotLayout generatePrimaryNavSlot(
    List<NavigationRailDestination> destinations,
  ) {
    Builder builder(dynamic _) => AdaptiveScaffold.standardNavigationRail(
          destinations: destinations,
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

  static SlotLayout generateBottomNavSlot(
    List<NavigationDestination> destinations,
  ) {
    return SlotLayout(
      config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key("Bottom Navigation Small"),
          builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
              destinations: destinations),
        ),
      },
    );
  }
}
