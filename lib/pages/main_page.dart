import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:print_4_you/pages/home_page.dart';
import 'package:print_4_you/pages/orders_page.dart';
import 'package:print_4_you/pages/profile_page.dart';
import 'package:print_4_you/pages/shops_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  String title = "Print4You";
  List titles = ["Print4You", "Orders", "Shops", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE40323),
        title: Center(
            child: Text(
          titles[index],
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        automaticallyImplyLeading: false,
      ),
      body: mainPageContent(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xFFE40323),
        onTap: (int tappedIndex) => setState(() {
          index = tappedIndex;
          title = titles[index];
        }),
        currentIndex: index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shops"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget mainPageContent() {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        print('orders');
        return OrdersPage();
      case 2:
        return const ShopsPage();
      case 3:
        return const ProfilePage();
      default:
        throw Error();
    }
  }
}
