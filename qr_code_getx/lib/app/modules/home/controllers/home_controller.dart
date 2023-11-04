import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  void downloadCatalog() async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Text('a'),
    ));
    // tạo một tập tin trống trong thư mục
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mydocument.pdf');
    // nhập byte dữ liệu -> tập tin trống
    await file.writeAsBytes(await pdf.save());
    // open dpf
    await OpenFile.open(file.path);
    print("open dpf");
  }

  void increment() => count.value++;

  Future<void> testPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  }
}
