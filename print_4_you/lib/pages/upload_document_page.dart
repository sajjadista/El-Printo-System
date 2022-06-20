import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({Key? key}) : super(key: key);

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  PlatformFile? document;
  bool? isDocumentUploaded = false;

  void uploadDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf',
        'doc',
        'docx',
        'ppt',
        'pptx',
        'xls',
        'xlsx',
      ],
    );

    if (result != null) {
      document = result.files.single;
      setState(() {
        isDocumentUploaded = true;
      });
    }
  }

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
                  child: isDocumentUploaded!
                      ? ColoredBox(
                          color: Colors.white,
                          child: Row(children: [
                            Text(
                              document!.name,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    document = null;
                                    isDocumentUploaded = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Icon(
                                  Icons.highlight_remove_rounded,
                                  color: Colors.red,
                                ))
                          ]),
                        )
                      : SizedBox(
                          height: 75,
                          width: 215,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ), // Background color
                            ),
                            onPressed: () {
                              uploadDocument();
                            },
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
              onPressed: () {
                Navigator.pushNamed(context, "/printpref");
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
    );
  }
}
