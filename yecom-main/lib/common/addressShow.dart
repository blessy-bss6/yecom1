import 'package:flutter/material.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

class AddressPart extends StatelessWidget {
  final Widget? trailing;
  const AddressPart({Key? key, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(
            t: 'Delivery Location',
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                IconBtn(
                  icon: Icons.location_on,
                  size: 30,
                  // height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        t: 'Your Location',
                        fontSize: 13,
                      ),
                      Txt(t: '55, bagHouse , kota,Kota'),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topRight,
                child: trailing != null
                    ? IconBtn(icon: Icons.chevron_right)
                    : null),
          ]),
        ],
      ),
    );
  }
}

// ! Price List
class PriceList extends StatelessWidget {
  final String? heading;
  final BoxDecoration? decoration;
  const PriceList({Key? key, this.heading, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Column(
        children: [
          Container(
            child: heading != null
                ? Text(
                    heading ?? '',
                    style: labelTextStyle,
                  )
                : null,
          ),
          datas(
            t1: 'Subtotal',
            t2: 'Rs 900',
          ),
          datas(
            t1: 'Shpping Charge',
            t2: 'Rs 70',
          ),
          datas(
              t1: 'Total Discount',
              t2: '- Rs 300',
              style: TextStyle(color: offgreenColor, fontSize: 15)),
          datas(
            t1: 'Tax Charge',
            t2: 'Rs 00.00',
          ),
          datas(
              t1: 'Promo Code',
              t2: '- Rs 400',
              style: TextStyle(color: offgreenColor, fontSize: 15)),
          heightSizedBox(3.0),
          Container(
              // margin: EdgeInsets.all(),
              decoration: BoxDecoration(color: brownWhiteColor),
              padding: EdgeInsets.all(5),
              child: datas(
                t1: 'Total Pay',
                t2: 'Rs 1200',
              ))
        ],
      ),
    );
  }

  Widget datas({String? t1, String? t2, TextStyle? style}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 1.5, bottom: 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Txt(
            t: t1,
            style: style ?? labelTextStyle,
          ),
          Txt(
            t: t2,
            style: style ?? labelTextStyle,
          )
        ],
      ),
    );
  }
}

class BasicProdDetail extends StatefulWidget {
  final bool? cartBtn, mrpTxt;
  const BasicProdDetail({Key? key, this.cartBtn, this.mrpTxt})
      : super(key: key);

  @override
  State<BasicProdDetail> createState() => _BasicProdDetailState();
}

class _BasicProdDetailState extends State<BasicProdDetail> {
  dynamic price;
  dynamic quantity;
  dynamic fullPrice;

  plusCallBack(dynamic cartItem) {
    setState(() {
      price = cartItem * 50;
      quantity = cartItem;
      fullPrice = cartItem * 90;
      // print(' plus $cartItem');
    });
  }

  minusCallBack(dynamic cartItem) {
    setState(() {
      // print('minus $cartItem');
      price = cartItem * 50;
      quantity = cartItem;
      fullPrice = cartItem * 90;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Txt(
          t: 'Title Name',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        Txt(
          t: '${quantity != null ? quantity : 1}',
          fontSize: 17,
          color: greyColor,
        ),
        Row(
          children: [
            Container(
              child: widget.mrpTxt == false
                  ? null
                  : Txt(
                      t: 'MRP : Rs${fullPrice != null ? fullPrice : 900} ',
                      decoration: TextDecoration.lineThrough,
                      fontSize: 13,
                      color: greyColor,
                    ),
            ),

            // widthSizedBox(2.0),
            Txt(
              t: 'Rs ${price != null ? price : 500}',
              style: labelTextStyle,
            ),
          ],
        ),
        heightSizedBox(2.0),
        Container(
          child: widget.cartBtn == false
              ? null
              : CartBtn(
                  plusCallBack: plusCallBack,
                  minusCallBack: minusCallBack,
                ),
        )
      ],
    );
  }
}
