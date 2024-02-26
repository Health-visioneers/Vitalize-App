import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class RecordsProvider extends ChangeNotifier{
  List<String> imagePath = [""];


  Future<String> convertToPdf() async{
    final pdf = PdfDocument();

    for (String path in imagePath){
      final page = pdf.pages.add();
      final bytes = File(path).readAsBytesSync();
      final image = PdfBitmap(bytes);

      page.graphics.drawImage(
        image,
        Rect.fromLTWH(0,0, page.getClientSize().width, page.getClientSize().height)
      );
      
     
    }
    final outputDir = await getTemporaryDirectory();
    final output = File('${outputDir.path}/output.pdf');
    var result = await output.writeAsBytes(pdf.saveSync());
    print(result);
    return "${outputDir.path}/output.pdf";
  }
}

// TODO : uploadRecord();
// fetchrecords and view using pdf viewer
// TODO : Home screen carosal, daily health updated 
