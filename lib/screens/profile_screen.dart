
import 'package:e_commerce_app/Controller/auth_control.dart';
import 'package:e_commerce_app/Controller/data_controller.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/update_screen.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  DataController dataController = Get.put(DataController());
  AuthController authController = Get.put(AuthController());

  late String title = "";
  late String email= "";



  UIUpdate() async{
    var response = await dataController.UserData();

    setState(() {
      title = response.docs[0]['user_name'];
      email = response.docs[0]['email'];
    });
    print("inside Response: UserName is " + response.docs[0]['joinDate']);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UIUpdate();
  }




  BoxDecoration decoration =  BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: AppColors.baseWhiteColor,
  );
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.70,
      centerTitle: true,
      backgroundColor: AppColors.baseWhiteColor,
      title: const Text(
        "Account",
        style: TextStyle(color: AppColors.baseBlackColor),
      ),
      actions: [
        IconButton(
          onPressed: () async{
            // List<dynamic> data = await dataController.NameUpdate("zeshanq","aticxcgfggfgcfccffcqrehman@gemil.com");
            // title = data[0];
            //
            // email = data[1];
            //
            // setState(() {
            //
            //
            // });

            Get.to(UpdateScreen())?.then((value){
              UIUpdate();

            });
          },
          icon: SvgPicture.asset(
            "assets/images/Edit.svg",
            color: AppColors.baseBlackColor,
            width: 25,
          ),
        ),
      ],
      shadowColor: AppColors.baseGrey10Color,
    );
  }

  Widget buildlistTileWidget(
      {required String leading, required String trailing}) {
    return Container(
      decoration: decoration,
      child: ListTile(
        tileColor: AppColors.baseWhiteColor,
        leading: Text(
          leading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          trailing,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildBottomListTile(
      {required String leading, required String trailing}) {
    return Column(
      children: [
        Container(
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              onTap: () {},
              tileColor: AppColors.baseWhiteColor,
              leading: Text(
                leading,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Wrap(
                spacing: 5,
                children: [
                  Text(
                    trailing,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseGrey30Color,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: decoration,
              height: 200,
              margin: const EdgeInsets.only(bottom: 10),

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    const Center(
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.red,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/originals/7b/48/65/7b48654b92587f3df86c21d7071bad42.jpg",
                              scale: 1),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Peshawar Pakistan",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: decoration,
              margin: const EdgeInsets.only(bottom: 10),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  children: [
                    buildlistTileWidget(
                        leading: "Full Name", trailing: title),
                    const Divider(),
                    buildlistTileWidget(
                        leading: "Email", trailing: email),
                    const Divider(),
                    buildlistTileWidget(
                        leading: "Address", trailing: "Peshawar Pakistan"),
                    const Divider(),
                    buildlistTileWidget(
                        leading: "Payment", trailing: "6001\t****\t*****1119"),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),

              child: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  children: [
                    buildBottomListTile(leading: "WhisList", trailing: "5"),

                    buildBottomListTile(leading: "My Bag", trailing: "3"),

                    buildBottomListTile(
                        leading: "My Order", trailing: "1 in transit"),

                  ],
                ),
              ),
            ),
            AppButton(name: "Log Out", onpressed: (){
              Get.to(LoginScreen());

            },),
          ],
        ),
      ),
    );
  }
}
