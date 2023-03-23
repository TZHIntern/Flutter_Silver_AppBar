import 'package:flutter/material.dart';

class SilverTabs extends StatelessWidget {
  const SilverTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: false,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Go'),
                    background: Image.asset(
                      'image/Kalaw.jpg',
                      fit: BoxFit.fill,
                    ),
                    stretchModes: const [StretchMode.zoomBackground],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SilverAppBarDelegate(const TabBar(tabs: [
                    Tab(
                      icon: Icon(
                        Icons.flight,
                        color: Colors.black26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_bike,
                        color: Colors.black26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_transit,
                        color: Colors.black26,
                      ),
                    )
                  ])),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                Icon(
                  Icons.flight,
                  size: 80,
                ),
                Icon(
                  Icons.directions_bike,
                  size: 80,
                ),
                Icon(
                  Icons.directions_transit,
                  size: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  late final TabBar _tabBar;
  _SilverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
