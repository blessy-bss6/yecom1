import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Screen/ProdList.dart';
import 'package:shop/utils/common.dart';
import 'CategoryScr.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          // SliverAppBars(
          //   title: 'SubCategory List',
          // ),
          SliverAppBars(
            title: 'SubCategory List',
            bottomChild: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: SearchBox(
                  controller: searchController,
                ),
              ),
            ),
          ),

          // ! Category List
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.9),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CategeoryGridProdList(
                    // onTap: () => navigationPush(context, ProductShowScreen()),
                    imageUrl: 'assets/images/indianGod.png',
                    title: 'SubCategory List',
                    onTap: () => navigationPush(context, ProductListScreen()),
                  );
                }, childCount: 5)),
          ),
        ],
      ),
    );
  }
}
