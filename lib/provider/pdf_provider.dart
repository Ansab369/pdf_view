import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PdfProvider with ChangeNotifier {
  String downloadedFilePath = '';

  Future createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      const url = "https://paytym.net/storage/pdfs/EMP18_PS_22-09-2023.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");

      downloadedFilePath = file.path;
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }

// check file is downloaded or not
  sharePDF() async {
    if (downloadedFilePath == '') {
      await createFileOfPdfUrl();
      await shareFile();
    } else {
      await shareFile();
    }
  }

  // share file
  shareFile() async {
    final result = await Share.shareXFiles(
      [XFile(downloadedFilePath)],
      subject: 'Share PDF',
      text: 'Share PDF',
    );

    if (result.status == ShareResultStatus.dismissed) {
      print('Did you not like the pictures?');
    }
  }
}
