import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/drawers.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/Screen/cartScr.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'CategoryScr.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          SliverAppBar(
            // expandedHeight: 6.0,
            // flexibleSpace: const FlexibleSpaceBar(
            //   title: Text('Available seats'),
            // ),
            backgroundColor: coffeColor,
            title: Text(
              'Gold Gift Ideas',
              style: whiteTextStyle,
            ),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    child: SearchBox(
                      controller: searchController,
                    ),
                  ),
                )),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_bag),
                tooltip: 'Cart',
                onPressed: () => navigationPush(context, CartScreen()),
              ),
            ],
          ),
          SliverList(
            delegate:
                SliverChildListDelegate([ImgSlider(), CategoryListItem()]),
          ),

          // ! First List
          SliverPadding(
            padding: const EdgeInsets.all(3),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Special Offers ',
                        style: labelTextStyle,
                      )),
                ],
              ),
            ),
          ),
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
                    imageUrl: 'assets/images/Wooden-Pooja-Mandir.png',
                    title: 'Categoryname',
                  );
                }, childCount: 5)),
          ),

          // ! First List
          SliverPadding(
            padding: const EdgeInsets.all(3),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'For Return Gift',
                        style: labelTextStyle,
                      )),
                ],
              ),
            ),
          ),
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
                    imageUrl: 'assets/images/Oxidized.png',
                    title: 'product',
                  );
                }, childCount: 6)),
          )
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}

// !  Vertical list for Category
class CategoryListItem extends StatelessWidget {
  CategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ! Title Value
              Text(
                'Shop By Category',
                style: labelTextStyle,
              ),

              Btn(
                padding: EdgeInsets.only(left: 6, right: 6),
                height: 30,
                btnName: 'VIEW ALL',
                style: TextStyle(fontSize: 13, color: blackColor),
                color: Color.fromARGB(246, 200, 200, 214),
                onTap: () => navigationPush(context, CategoryScreen()),
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 5),
                child: InkWell(
                  // onTap: () => navigationPush(context, ProductShowScreen()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ! Pic Section
                      Container(
                        child: Pics(
                          src: 'assets/images/Brass.png',
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // ! Bottom Name
                      Container(
                        margin: EdgeInsets.only(top: 2.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'name $i',
                          style: mediumTextStyle,
                        ),
                      ),
                      // ! Bottom Name
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '$i product',
                          style: smallTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Product GridList
