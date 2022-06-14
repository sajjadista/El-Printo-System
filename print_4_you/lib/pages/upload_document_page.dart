import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({Key? key}) : super(key: key);

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upload Document(s)",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 75,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: const Color(0xFFE40323),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: SizedBox(
                    height: 75,
                    width: 215,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ), // Background color
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.file_upload_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            "Upload Document",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFE40323),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ), // Background color
              ),
              onPressed: () {},
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
    );
  }
}
