import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatefulWidget {
  PDFViewer({
    super.key,
    
  });


  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documnet.pdf",style: TextStyle(fontFamily: 'metro',fontSize: 16),),
      ),
      body: SafeArea(
        child: Center(
          child: PDFView(
            filePath:'/data/user/0/com.example.vitaliz/cache/output.pdf',
            autoSpacing: false,
            pageFling: false,

            onPageError: (page, error){
              print(error.toString());
            },
          

          ),
        ),
      ),
    );
  }
}

//'/data/user/0/com.example.vitaliz/cache/output.pdf',

