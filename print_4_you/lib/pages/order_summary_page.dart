import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _prefs,
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          final Stream<QuerySnapshot> order = FirebaseFirestore.instance
              .collection('orders')
              .where('filename',
                  isEqualTo: snapshot.data!.getString("filename"))
              .snapshots();

          return Scaffold(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: order,
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Something went wrong.");
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const Text("Connection done");
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            String formattedDate = DateFormat('hh:mm a')
                                .format(snapshot.data!.docs[0]["eta"].toDate());
                            return Text(
                              formattedDate,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Text("Something went wrong");
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
                              Navigator.pushReplacementNamed(
                                  context, "/mainpage");
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
              ));
        } else if (snapshot.hasError) {
          return Text("Something went wrong: ${snapshot.error}");
        } else {
          return const Text("Something went wrong.");
        }
      },
    );
  }
}
