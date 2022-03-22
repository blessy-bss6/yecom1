import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/common/addressShow.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'CheckOutScr.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final List<Widget> tabs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar

          SliverAppBars(
            title: 'Cart Screen',
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AddressPart(
                    trailing: IconBtn(icon: null),
                  ),
                ),
                Divider(),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: borderColor)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Pics(
                        src: 'assets/images/indianGod.png',
                        width: 120,
                        height: 100,
                      ),
                      BasicProdDetail(),
                      IconBtn(icon: Icons.delete, size: 20),
                    ],
                  ),
                ),
              ),
              childCount: 15,
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [Divider(), PriceList()],
            ),
          ),

          //  ! Sliver Product Content
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          height: 45,
          width: double.infinity,
          btnName: 'CheckOut',
          txtColor: txtWhiteColor,
          color: coffeColor,
          onTap: () => navigationPush(context, CheckOutScreen()),
        ),
      ),
    );
  }
}
