import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: index == 0
          ? AppBar(
              actions: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image(
                    width: 120,
                    image: AssetImage('assets/logo.png'),
                  ),
                )
              ],
              title: RichText(
                  text: TextSpan(
                      style: const TextStyle(height: 1.5),
                      children: <TextSpan>[
                    TextSpan(
                        text: "Print4You\n",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "We deliver your documents wherever, whenever.\n",
                        style: GoogleFonts.montserrat(color: Colors.white)),
                    TextSpan(
                        text: "Welcome back, Muhammad!",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ])),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xFFE40323),
                        Color.fromARGB(255, 148, 2, 24),
                        Colors.black
                      ]),
                ),
              ),
              toolbarHeight: 200,
            )
          : AppBar(
              backgroundColor: const Color(0xFFE40323),
              title: Center(
                  child: Text(
                titles[index],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
        return OrdersPage();
      case 2:
        return ShopsPage(fromHomePage: true);
      case 3:
        return const ProfilePage();
      default:
        throw Error();
    }
  }
}
