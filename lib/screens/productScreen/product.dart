import 'dart:io';

import 'package:e_commerce_app/Controller/auth_control.dart';
import 'package:e_commerce_app/Controller/data_controller.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/screens/productScreen/product_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);




  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  DataController controller  = Get.put(DataController());
  AuthController controller1 = Get.put(AuthController());
  var _userImageFile;

  void  _pickedImage(File image) {
    _userImageFile = image;

    print("Atiq rheman");

  }
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> productData = {

    "p_name": "",
    "p_price": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": ""
  };




  addProduct() {
    if (_userImageFile == null) {
      Get.snackbar(
        "Opps",
        "Image Required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme
            .of(context)
            .errorColor,
        colorText: Colors.white,
      );
      return;
    }
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");

      print('Add for new product $productData');
      controller.addNewProduct(productData, _userImageFile);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Product'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                  const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product Name Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_name'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product Price Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_price'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number  Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['phone_number'] = value!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                 ProductImagePicker(_pickedImage),

                const SizedBox(
                  height: 30,
                ),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: kBackgroundColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0),
                     ),
                   ),
                  onPressed: addProduct,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
