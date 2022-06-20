import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrintingPreferencesPage extends StatefulWidget {
  const PrintingPreferencesPage({Key? key}) : super(key: key);

  @override
  State<PrintingPreferencesPage> createState() =>
      _PrintingPreferencesPageState();
}

class _PrintingPreferencesPageState extends State<PrintingPreferencesPage> {
  String? colorStyle;
  int? numberOfCopies;
  int? fromPage;
  int? toPage;
  bool? isAllPages = false;
  String? printQuality;
  String? paperSide;

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    print(colorStyle);
    print(numberOfCopies);
    print(fromPage);
    print(toPage);
    print(isAllPages);
    print(printQuality);
    print(paperSide);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Printing Preferences",
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "1. Color:",
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
                    value: "Black and White",
                    groupValue: colorStyle,
                    onChanged: (value) {
                      setState(() {
                        colorStyle = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Black and White",
                    style: TextStyle(
                      fontSize: 17,
                      color: colorStyle == "Black and White"
                          ? Colors.red
                          : Colors.black,
                      fontWeight: colorStyle == "Black and White"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Radio(
                    value: "Colored",
                    groupValue: colorStyle,
                    onChanged: (value) {
                      setState(() {
                        colorStyle = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Colored",
                    style: TextStyle(
                      fontSize: 17,
                      color:
                          colorStyle == "Colored" ? Colors.red : Colors.black,
                      fontWeight: colorStyle == "Colored"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "2. Number of Copies:",
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
                    width: 100,
                    child: TextField(
                      onChanged: (value) =>
                          setState(() => numberOfCopies = int.parse(value)),
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
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "3. Page Range:",
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
                  const Text(
                    "From   ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 50,
                    child: TextField(
                      controller: fromController,
                      onChanged: (value) =>
                          setState(() => fromPage = int.tryParse(value)),
                      cursorColor: Colors.red,
                      textAlign: TextAlign.center,
                      enabled: !isAllPages!,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  const Text(
                    "   to   ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 50,
                    child: TextField(
                      controller: toController,
                      onChanged: (value) =>
                          setState(() => toPage = int.tryParse(value)),
                      cursorColor: Colors.red,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      enabled: !isAllPages!,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Checkbox(
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                    value: isAllPages,
                    onChanged: (value) {
                      setState(() {
                        isAllPages = value;
                        if (isAllPages!) {
                          toPage = null;
                          fromPage = null;
                          toController.clear();
                          fromController.clear();
                        }
                      });
                    },
                  ),
                  const Text(
                    "All Pages",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "4. Print Quality:",
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
                    value: "Low",
                    groupValue: printQuality,
                    onChanged: (value) {
                      setState(() {
                        printQuality = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Low",
                    style: TextStyle(
                      fontSize: 17,
                      color: printQuality == "Low" ? Colors.red : Colors.black,
                      fontWeight: printQuality == "Low"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Radio(
                    value: "Medium",
                    groupValue: printQuality,
                    onChanged: (value) {
                      setState(() {
                        printQuality = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Medium",
                    style: TextStyle(
                      fontSize: 17,
                      color:
                          printQuality == "Medium" ? Colors.red : Colors.black,
                      fontWeight: printQuality == "Medium"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Radio(
                    value: "High",
                    groupValue: printQuality,
                    onChanged: (value) {
                      setState(() {
                        printQuality = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "High",
                    style: TextStyle(
                      fontSize: 17,
                      color: printQuality == "High" ? Colors.red : Colors.black,
                      fontWeight: printQuality == "High"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "5. Paper Side:",
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
                    value: "One-Sided",
                    groupValue: paperSide,
                    onChanged: (value) {
                      setState(() {
                        paperSide = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "One-Sided",
                    style: TextStyle(
                      fontSize: 17,
                      color:
                          paperSide == "One-Sided" ? Colors.red : Colors.black,
                      fontWeight: paperSide == "One-Sided"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Radio(
                    value: "Double-Sided",
                    groupValue: paperSide,
                    onChanged: (value) {
                      setState(() {
                        paperSide = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Double-Sided",
                    style: TextStyle(
                      fontSize: 17,
                      color: paperSide == "Double-Sided"
                          ? Colors.red
                          : Colors.black,
                      fontWeight: paperSide == "Double-Sided"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (colorStyle == null ||
                          numberOfCopies == null ||
                          ((fromPage == null || toPage == null) &&
                              (isAllPages == null || isAllPages == false)) ||
                          printQuality == null ||
                          paperSide == null)
                      ? const SizedBox()
                      : SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFE40323),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              prefs.setString("colorStyle", colorStyle!);
                              prefs.setInt("numberOfCopies", numberOfCopies!);
                              if (isAllPages == null || isAllPages == false) {
                                prefs.setInt("fromPage", fromPage!);
                                prefs.setInt("toPage", toPage!);
                              } else {
                                prefs.setBool("isAllPages", isAllPages!);
                              }
                              prefs.setString("printQuality", printQuality!);
                              prefs.setString("paperSide", paperSide!);
                              Navigator.pushNamed(context, "/deliverydetails");
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
      ),
    );
  }
}
