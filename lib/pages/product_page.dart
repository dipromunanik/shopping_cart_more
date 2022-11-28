import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_more/database/db_helper.dart';
import 'package:shopping_cart_more/pages/cart_page.dart';
import '../controller/product_controller.dart';

class ProductPage extends StatefulWidget {

  static const String routeName = 'product_page';

  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final dbHelper = DBHelper.instance;

  var addToCartVisible = true;
  int count = 1;
  int selecedIndex = 0;
  List<String> arrayList = [];
  List? addToCartVisibleList = [];

  @override
  void initState() {
    super.initState();

    final productItem = Provider.of<ProductController>(context, listen: false);
    productItem.getData();
  }

  @override
  Widget build(BuildContext context) {
    final productView = Provider.of<ProductController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('PRODUCT',
              style: TextStyle(color: Colors.white, fontSize: 19,fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
                },
                child: Badge(
                  badgeColor: Colors.white,
                  badgeContent:const Text(
                    '0',
                    style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                  child:const Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 25),
                ),
              ),
            )
          ],
        ),
        body: productView.loader
            ? Center(child: Container())
            : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 15),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productView.productList.data!.popularProduct!.length,
                      itemBuilder: (context, index) {
                        var item = productView.productList.data!.popularProduct![index];
                        return Card(
                          elevation: 2,
                          child: Container(
                              width: 184,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 6),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Image.network(
                                          '${'https://univarselfood.etrackersolution.com/'}${item.productImage}',
                                          width: 250,
                                          height: 100,
                                        ),
                                        const SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text('${item.productName}',
                                                  style: const TextStyle(
                                                      color: Color(0xff48484E),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.start),
                                              const SizedBox(height: 3),
                                              Row(
                                                children: [
                                                  Text('${item.subCategoryName} -',
                                                      style: const TextStyle(
                                                          fontSize: 15)),
                                                  const Text(' 100gm',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14)),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/taka.png',
                                                      height: 18,
                                                      width: 18,
                                                      color: const Color(0xffF57B80)),
                                                  Text(
                                                      '${item.branchProduct!.purchasePrice}',
                                                      style: const TextStyle(
                                                          color: Color(0xffF57B80),
                                                          fontSize: 17,
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                              const SizedBox(height: 2),
                                              Stack(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/taka.png',
                                                          height: 15,
                                                          width: 15,
                                                          color: Colors.grey),
                                                      Text(
                                                          '${item.branchProduct!.salePrice}',
                                                          style: const TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    endIndent: 113,
                                                    thickness: 1,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                                initialRating: 5,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 22,
                                                itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                                itemBuilder: (context, _) {
                                                  return const Icon(
                                                    Icons.star,
                                                    color: Color(0xff79AE09),
                                                    size: 5,
                                                  );
                                                },
                                                onRatingUpdate: (rating) {}),
                                            const SizedBox(width: 2),
                                            const Text(
                                              '(126)',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 23),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Visibility(
                                            visible: addToCartVisible,
                                            child: SizedBox(
                                              height: 45,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color(0xffF2F3F5),
                                                  elevation: 2,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    addToCartVisible =
                                                    !addToCartVisible;
                                                  });
                                                },
                                                child: const Text(
                                                  'ADD TO CART',
                                                  style: TextStyle(
                                                      color: Color(0xff79AE09),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Visibility(
                                            visible: !addToCartVisible,
                                            child: SizedBox(
                                              height: 45,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: const Color(0xff79AE09),
                                                    elevation: 2,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      addToCartVisible =
                                                      !addToCartVisible;
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              count--;
                                                              if (count < 1) {
                                                                addToCartVisible =
                                                                !addToCartVisible;
                                                              }
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                            size: 23,
                                                          )),
                                                      Text(
                                                        '$count',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              count++;
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 23,
                                                          )),
                                                    ],
                                                  )),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 3 / 5),
                    ),
                  ],
                ),
              ),
            ));
  }
}
