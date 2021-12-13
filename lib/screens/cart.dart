import 'dart:ui';

import 'package:e_commerce_app/screens/detailscreen.dart';
import 'package:e_commerce_app/screens/productScreen/product.dart';
import 'package:e_commerce_app/screens/productScreen/show_product.dart';
import 'package:e_commerce_app/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatefulWidget {
  MyCart({required this.add, Key? key});

  bool? add;

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const AddProduct());
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(ShowProduct());
            },
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.add == true ? true : false,
            child: Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[200],
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Text("SubTotal:"),
                              Text(
                                "\$1250",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("Taxes"),
                              Text(
                                "\$40",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "\$269.00",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Get.to(ShowProduct());
                              },
                              minWidth: 30,
                              height: 40,
                              elevation: 0,
                              color: Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart_rounded,
                                      color: Colors.blue[700]),
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.blue[700]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
