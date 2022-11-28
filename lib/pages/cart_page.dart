import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {

  static const String routeName = 'cart_page';

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:const IconThemeData(color: Colors.black),
          backgroundColor:Colors.green,
          title:const Text('Cart',style: TextStyle(color: Colors.black)),
          actions:const [
            Padding(
              padding: EdgeInsets.only(right: 13),
              child: Center(child: Text('Delete',style: TextStyle(color: Colors.black,fontSize: 20),)),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 10,
          child: Container(
            height: 62,
            decoration:const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Colors.black26,
                        width: 1
                    )
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const [
                        Icon(Icons.shopping_cart,color: Color(0x0ff79ae09),size: 21),
                        SizedBox(width: 2),
                        Text('Food',style: TextStyle(fontSize: 12,color: Color(0x0ff79AE09),fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text('Shopping: ',style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold,wordSpacing: 1)),
                              Image.asset('assets/images/taka.png',height: 14,width: 14,color: const Color(0xff79AE09)),
                              Text('100'.toString(),style:const TextStyle(color: Color(0xff79AE09),fontSize: 15,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Total: ',style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/taka.png',height: 16,width: 16,color: const Color(0xff79AE09)),
                              Text('100'.toString(),style:const TextStyle(color: Color(0xff79AE09),fontSize: 18,fontWeight: FontWeight.bold)),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(width: 18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
                            },
                            child: Container(
                              height: 45,
                              width: 110,
                              decoration: BoxDecoration(
                                color:const Color(0xff79AE09),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child:const Center(child: Text('Checkout',style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  wordSpacing: 1
                              ),)),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 1,
                child: SizedBox(
                  height: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset('assets/images/food.jpg',height: 60,width: 100)),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Vim Dishwashing Bar - 125gm',style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'Oswald',wordSpacing: 1),),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Image.asset('assets/images/taka.png',height: 14,width: 14,color: const Color(0xff79AE09)),
                              Text('100'.toString(),style:const TextStyle(color: Color(0xff79AE09),fontSize: 15,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/taka.png',height: 11,width: 11,color: Colors.grey),
                                  Text('120'.toString(),style:const TextStyle(color: Colors.grey,fontSize: 11,fontWeight: FontWeight.bold)),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.remove,color: Colors.black,size: 17),
                            const SizedBox(width: 4),
                            Container(
                              height: 30,
                              width: 45,
                              decoration:BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Center(
                                child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18)),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.add,color: Colors.black,size: 17,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
