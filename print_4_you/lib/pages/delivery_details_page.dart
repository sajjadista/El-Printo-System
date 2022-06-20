import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:print_4_you/pages/shops_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryDetailsPage extends StatefulWidget {
  const DeliveryDetailsPage({Key? key}) : super(key: key);

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  String? deliveryAddress;
  String? deliveryType;

  late SharedPreferences prefs;

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
    setState(() {
      deliveryType = "Standard";
    });
  }

  @override
  Widget build(BuildContext context) {
    print(deliveryAddress);
    print(deliveryType);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Delivery Details",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFE40323),
          titleTextStyle: GoogleFonts.montserratTextTheme().headline6,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "1. Delivery Address:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 300,
                      child: TextField(
                        onChanged: (value) =>
                            setState(() => deliveryAddress = value),
                        maxLines: null,
                        cursorColor: Colors.red,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "2. Delivery Type:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      autofocus: true,
                      value: "Standard",
                      groupValue: deliveryType,
                      onChanged: (value) {
                        setState(() {
                          deliveryType = value.toString();
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      "Standard",
                      style: TextStyle(
                        fontSize: 17,
                        color: deliveryType == "Standard"
                            ? Colors.red
                            : Colors.black,
                        fontWeight: deliveryType == "Standard"
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: "Express",
                      groupValue: deliveryType,
                      onChanged: (value) {
                        setState(() {
                          deliveryType = value.toString();
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      "Express",
                      style: TextStyle(
                        fontSize: 17,
                        color: deliveryType == "Express"
                            ? Colors.red
                            : Colors.black,
                        fontWeight: deliveryType == "Express"
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    deliveryType == "Standard"
                        ? "assets/standard.png"
                        : "assets/express.png",
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (deliveryAddress == null || deliveryType == null)
                        ? const SizedBox()
                        : SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFE40323),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ), // Background color
                              ),
                              onPressed: () {
                                prefs.setBool("standardDelivery",
                                    (deliveryType == "Standard"));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShopsPage(fromHomePage: false)),
                                );
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
