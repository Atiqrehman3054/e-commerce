

import 'package:e_commerce_app/screens/cart.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/screens/homescreen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: Image.asset(
          "assets/images/logoE.PNG",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red[500],
            ),
          ),
        ],
      ),
      body: Container(
        // color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Container(
                    width: 35,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "30%",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: Image(
                      image: AssetImage(
                        "assets/images/shoes.PNG",
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.grey[100]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nike Air Max 200",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900]),
                        ),
                        Container(
                          child: Row(
                            children: [starIcon(), Text("(4.5)")],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(right: 60),
                      child: Text(
                        "Built for natural motion,the Nike Flex shoes",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "size:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          sizeContainerColour(Colors.blue.shade300, "US 6"),
                          sizeContainerColour(Colors.white, "US 7"),
                          sizeContainerColour(Colors.white, "US 8"),
                          sizeContainerColour(Colors.white, "US 9"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Availabe Colors:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          colorSelectionCircle(Colors.yellow),
                          colorSelectionCircle(Colors.red),
                          colorSelectionCircle(Colors.pink.shade200),
                          colorSelectionCircle(Colors.blue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$269.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyCart()));
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
    );
  }
}
