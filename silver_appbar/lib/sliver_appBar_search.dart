import 'package:flutter/material.dart';

class SilverSearch extends StatelessWidget {
  const SilverSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'image/Kalaw.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              floating: true,
              pinned: true,
              snap: false,
              bottom: AppBar(
                backgroundColor:
                    const Color.fromARGB(31, 71, 115, 4).withOpacity(.99),
                title: const SizedBox(
                  height: 40,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term',
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.black26)),
                    child: Center(child: Text('Product $index')),
                  ),
                  childCount: 20,
                ))
          ],
        ),
      ),
    );
  }
}
