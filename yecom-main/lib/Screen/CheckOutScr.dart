import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/common/addressShow.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'Order.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar

          SliverAppBars(
            title: 'CheckOut Screen',
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    t: 'Delivery Address',
                    style: labelTextStyle,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return OrderIdAdrContent(
                        value: i,
                        groupVal: _groupValue ?? 0,
                        t2: 'batla House, Sikar,jaipur ',
                        onChanged: (val) => setState(() {
                          _groupValue = i;
                        }),
                      );
                    },
                  ),
                  Center(
                    child: Btn(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      btnName: 'Add Address',
                      color: coffeColor,
                      txtColor: txtWhiteColor,
                    ),
                  ),
                  Divider(),
                ],
              ),
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
              childCount: 5,
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
          btnName: 'Order',
          txtColor: txtWhiteColor,
          color: coffeColor,
          onTap: () => navigationPush(context, OrderScreen()),
        ),
      ),
    );
  }
}

// !n
class OrderIdAdrContent extends StatelessWidget {
  final dynamic onChanged;
  final dynamic groupVal;
  final String? t2;
  final String? t1;
  final dynamic value;
  const OrderIdAdrContent(
      {Key? key, this.value, this.t1, this.groupVal, this.onChanged, this.t2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            child: Row(
              children: [
                Radio(
                  activeColor: offgreenColor,
                  value: value,
                  groupValue: groupVal,
                  onChanged: onChanged,
                ),
                Txt(t: t2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
