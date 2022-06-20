import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:print_4_you/pages/order_summary_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({Key? key}) : super(key: key);

  @override
  State<SelectPaymentPage> createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  String _selectedOption = "";

  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE40323),
        title: const Center(
            child: Text(
          "Payment Method",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Online banking",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 59.png', "CIMB Bank Berhad"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 60.png', "Maybank Berhad"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 61.png', "Bank Islam Malaysia Bhd"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 62.png', "Hong Leong Bank"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 63.png', "Al-Rajhi Bank"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 64.png', "RHB Bank"),
              const SizedBox(height: 50),
              const Text("E-wallet banking",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 68.png', "TNG E-Wallet"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 69.png', "ShopeePay"),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              _paymentMethod('assets/image 70.png', "PayPal"),
              _selectedOption == ""
                  ? const SizedBox()
                  : SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            DateTime eta = DateTime.now();
                            if (_prefs.getBool("standardDelivery")!) {
                              eta = DateTime.now()
                                  .add(const Duration(minutes: 60));
                            } else {
                              eta = DateTime.now()
                                  .add(const Duration(minutes: 30));
                            }
                            String pagerange;
                            if (_prefs.getBool("isAllPages")!) {
                              pagerange = "All pages";
                            } else {
                              pagerange =
                                  "${_prefs.getInt("fromPage")!}-${_prefs.getInt("toPage")!}";
                            }

                            final order = <String, dynamic>{
                              "color": _prefs.getBool("colorStyle"),
                              "doublesided": _prefs.getBool("paperSide"),
                              "eta": eta,
                              "filename": _prefs.getString("filename"),
                              "pagerange": pagerange
                            };

                            String docId = "";
                            final navigator = Navigator.of(context);

                            await db.collection("orders").add(order).then(
                                (DocumentReference doc) => docId = doc.id);

                            navigator.push(
                              MaterialPageRoute(
                                  builder: (context) => OrderSummaryPage(
                                        docId: docId,
                                      )),
                            );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFE40323))),
                          child: const Text(
                            "Proceed to online payment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethod(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.scale(
              scale: 1.5, child: Image(image: AssetImage(imagePath))),
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
          const Flexible(fit: FlexFit.tight, child: SizedBox()),
          Checkbox(
              activeColor: const Color(0xFFE40323),
              value: _selectedOption == text ? true : false,
              onChanged: (changed) => setState(() => _selectedOption = text))
        ],
      ),
    );
  }
}
