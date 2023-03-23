import 'package:flutter/material.dart';

class SilverPersistent extends StatelessWidget {
  const SilverPersistent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MySilverAppBar(expandedHeight: 200),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              ListCardWidget(text1: 'Full Name', text2: 'George John Carter'),
              ListCardWidget(text1: "Father's name", text2: 'John Carter'),
              ListCardWidget(text1: 'Gender', text2: 'Male'),
              ListCardWidget(text1: 'Marital Status', text2: 'Single'),
              ListCardWidget(text1: 'Email', text2: 'george@gmail.com'),
              ListCardWidget(text1: 'Username', text2: 'George'),
              ListCardWidget(text1: 'Country', text2: 'India'),
              ListCardWidget(text1: 'Phone', text2: '099876543'),
              ListCardWidget(text1: 'City', text2: 'Hyderabad'),
              ListCardWidget(text1: 'PinCode', text2: '5004'),
              ListCardWidget(text1: 'Company', text2: 'All Shake'),
              ListCardWidget(text1: 'Position', text2: 'Leader'),
            ]))
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ListCardWidget({required String text1, required String text2}) {
  return Card(
    margin: const EdgeInsets.all(8),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                text1,
                style: const TextStyle(fontSize: 18),
              )),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                text2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ),
  );
}

class MySilverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  MySilverAppBar({required this.expandedHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 254, 194, 103),
                    Color.fromARGB(255, 121, 221, 239),
                  ])),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: const Text(
              'My Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 23),
            ),
          ),
        ),
        Positioned(
            top: expandedHeight / 4 - shrinkOffset,
            left: MediaQuery.of(context).size.width / 4,
            child: Opacity(
              opacity: 1 - shrinkOffset / expandedHeight,
              child: Column(
                children: [
                  const Text(
                    'Check Out My Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: SizedBox(
                      height: expandedHeight,
                      width: MediaQuery.of(context).size.width / 2,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'asset/profile.webp',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
