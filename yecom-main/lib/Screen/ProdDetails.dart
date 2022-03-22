import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'cartScr.dart';

// class ProdcutDeatilsScreen extends StatelessWidget {
//   ProdcutDeatilsScreen({Key? key}) : super(key: key);

//   final List<Widget> tabs = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Product Details',
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [],
//         ),
//       ),
//     );
//   }
// }

class ProdDetailScreen extends StatefulWidget {
  ProdDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  final List img = [
    'assets/images/IndianGod.png',
    'assets/images/god-idols.png',
    // // 'assets/images/snacks.png',
    'assets/images/Brass.png',
    // 'assets/images/pulse.png',
    // 'assets/images/watermelon.png',
  ];

  dynamic listImgSrc;

  imgcallBack(dynamic imgSrc) {
    // print('callBack $imgSrc');
    setState(() {
      listImgSrc = imgSrc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Product Details',
        centerTitle: true,
      ),
      body:
          // SingleChildScrollView(
          // child:
          SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ! Image Section
            Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: Pics(
                src: listImgSrc != null
                    ? listImgSrc.toString()
                    : 'assets/images/Wooden-Pooja-Mandir.png',
                width: 300,
                height: 200,
              ),
            ),
            heightSizedBox(5.0),
            //  Image List Section
            ImgHorizontalList(
              cheight: 80,
              prodList: img,
              callBack: imgcallBack,
              itemBorder: listImgSrc != null ? listImgSrc.toString() : null,
            ),
            // !  Product Content
            ProdDetailsContent(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Txt(
                  t: 'GitHub, Inc. is a provider of Internet hosting for software development and version control using Git. It offers the distributed version control and source code management functionality of Git, plus its own features. ',
                  style: smallTextStyle,
                ),
              ),
            )

            // ! Btn  for Cart
          ],
        ),
      ),
      // ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Btn(
      //     // alignment: Alignment.bottomLeft,
      //     height: 45,
      //     width: double.infinity,
      //     btnName: 'Add to Cart',
      //     txtColor: txtWhiteColor,
      //     color: coffeColor,
      //     onTap: () => navigationPush(context, CartScreen()),
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          onTap: () => navigationPush(context, CartScreen()),
          alignment: Alignment.bottomLeft,
          height: 45,
          width: double.infinity,
          btnName: 'Add to Cart',
          txtColor: offWhiteColor,
          color: coffeColor,
        ),
      ),
    );
  }
}

class ProdDetailsContent extends StatefulWidget {
  const ProdDetailsContent({
    Key? key,
  }) : super(key: key);

  @override
  State<ProdDetailsContent> createState() => _ProdDetailsContentState();
}

class _ProdDetailsContentState extends State<ProdDetailsContent> {
  dynamic price;
  dynamic quantity;
  dynamic fullPrice;

  plusCallBack(dynamic cartItem) {
    setState(() {
      price = cartItem * 150;
      quantity = cartItem;
      fullPrice = cartItem * 300;
      // print(' plus $cartItem');
    });
  }

  minusCallBack(dynamic cartItem) {
    setState(() {
      // print('minus $cartItem');
      price = cartItem * 150;
      quantity = cartItem;
      fullPrice = cartItem * 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [lineLeft(), lineRight()],
          ),
        ],
      ),
    );
  }

  Widget lineLeft() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Title
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          // alignment: Alignment.topLeft,
          child: Txt(
            t: 'Product Tititle for this prodct dshjhdsj',
            fontSize: 15,
            style: labelTextStyle,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: '${quantity != null ? quantity : 1} KG',
            fontSize: 20,
            color: greyColor,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          child: CartBtn(
            plusCallBack: plusCallBack,
            minusCallBack: minusCallBack,
          ),
        ),
      ],
    );
  }

  Widget lineRight() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 8.0),
      child: Column(
        children: [
          Txt(
            t: 'MRP : Rs${fullPrice != null ? fullPrice : 900}',
            decoration: TextDecoration.lineThrough,
            fontSize: 13,
            color: greyColor,
          ),
          Txt(
            t: 'Rs ${price != null ? price : 500}',
            fontSize: 17,
            color: offgreenColor,
          ),
        ],
      ),
    );
  }
}
