import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> pendingOrders = FirebaseFirestore.instance
      .collection('orders')
      .where('eta', isGreaterThan: Timestamp.fromDate(DateTime.now()))
      .snapshots();

  final Stream<QuerySnapshot> completedOrders = FirebaseFirestore.instance
      .collection('orders')
      .where('eta', isLessThanOrEqualTo: Timestamp.fromDate(DateTime.now()))
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text("Current Orders",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          _orderList(pendingOrders, false),
          const SizedBox(height: 30),
          const Text("Previous Orders",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          _orderList(completedOrders, true),
        ],
      ),
    );
  }

  Widget _orderList(Stream<QuerySnapshot<Object?>>? stream, bool completed) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("1");
          return const Text("Something went wrong.");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print("2");
          return const Text("Connection done");
        }

        if (snapshot.connectionState == ConnectionState.active) {
          print("3");
          try {
            return Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: snapshot.data!.docs.map((order) {
                  DateTime etaDatetime = (order['eta'] as Timestamp).toDate();
                  int etaCountdownMins =
                      etaDatetime.difference(DateTime.now()).inMinutes;
                  int etaCountDownHrs =
                      etaDatetime.difference(DateTime.now()).inHours;

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: const Color(0xFFE40323),
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order['filename'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    order['pagerange'] == "All pages"
                                        ? "All pages"
                                        : "Pages " + order['pagerange'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    order['color']
                                        ? 'Color'
                                        : 'Black and white',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    order['doublesided']
                                        ? 'Double-sided'
                                        : 'One-sided',
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              completed
                                  ? const SizedBox()
                                  : Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            etaCountDownHrs > 0
                                                ? "$etaCountDownHrs hour(s) $etaCountdownMins min(s)"
                                                : "$etaCountdownMins min(s)",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFE40323)),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          )),
                    ),
                  );
                }).toList(),
              ),
            );
          } on Exception catch (e) {
            return Text("Something went wrong: $e");
          }
        }
        print("4");

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text("Loading");
      },
    );
  }
}
