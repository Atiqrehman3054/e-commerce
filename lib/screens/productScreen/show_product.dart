import 'package:e_commerce_app/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProduct extends StatelessWidget {
   ShowProduct({Key? key}) : super(key: key);

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getLoginUserProduct();
    });

    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        title: const Text("ShowProduct"),
      ),
      body:  GetBuilder<DataController>(
        builder: (controller) => controller.loginUserData.isEmpty
            ? const Center(
          child: Text('😔 NO DATA FOUND PLEASE ADD DATA 😔'),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: ListView.builder(
            itemCount: controller.loginUserData.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        controller.loginUserData[index].productimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Product Name: ${controller.loginUserData[index].productname}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Price: ${controller.loginUserData[index].productprice.toString()}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('Edit'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),

    ),);
  }
}
