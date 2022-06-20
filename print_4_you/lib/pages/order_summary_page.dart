import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSummaryPage extends StatefulWidget {
  final String docId;

  const OrderSummaryPage({Key? key, required this.docId}) : super(key: key);

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order =
        FirebaseFirestore.instance.collection('orders').doc(widget.docId).get();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Order Summary",
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
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your prints are on the way!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/delivery.png",
                  height: 275,
                  width: 275,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Estimated time of delivery:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: order,
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            orderSnapshot) {
                      if (orderSnapshot.hasData) {
                        String formattedDate = DateFormat('hh:mm a')
                            .format(orderSnapshot.data!["eta"].toDate());
                        return Text(
                          formattedDate,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return const Text("Something went wrong.");
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 280,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFE40323),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ), // Background color
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/mainpage");
                        },
                        child: const Text(
                          "Return to homepage",
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
          )),
    );
  }
}
