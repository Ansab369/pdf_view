
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  const PdfView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: SfPdfViewer.network(
          initialZoomLevel: 1.01,
          'https://paytym.net/storage/pdfs/EMP18_PS_22-09-2023.pdf',

        ),
      ),
    );
  }
}