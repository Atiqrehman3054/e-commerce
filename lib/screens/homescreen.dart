import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/screens/detailscreen.dart';
import 'package:e_commerce_app/widgets/dropdownbutton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var _ratingController;
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Container(
          color: Colors.green,
        ),
      ),
      //appbar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Image.asset(
          "assets/images/logoE.PNG",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),

      //body////////////////
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: Colors.grey[100],
        child: Column(
          children: [
            //first row text and drop down button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 6,
                  child: Text(
                    "Our Product",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropButton(
                      item: const ["size", "date", "price"],
                      hinttext: "sort by",
                      ratingController: _ratingController),
                ),
              ],
            ),

            //grid view builder
            Expanded(
              child: GridView.builder(
                  itemCount: 12,
                  physics: ScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.58,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen()));
                      },
                      child: Container(
                        height: 400,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Container(
                                    width: 35,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "30%",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.grey[300],
                                    )),
                              ],
                            ),
                    
                            //shoes image in builder
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/shoes.PNG")),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                    
                                  //Two text widget
                                  Text(
                                    "Nike Air Max 20",
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "\$ 240.0",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                    
                                  //row for star icons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      starIcon(),
                                      starIcon(),
                                      starIcon(),
                                      starIcon(),
                                      starHalfIcon(),
                                      SizedBox(width: 10),
                                      Text(
                                        "(4.5)",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
