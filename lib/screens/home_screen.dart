import 'package:flutter/material.dart';
import 'package:pdf_view_app/provider/pdf_provider.dart';
import 'package:pdf_view_app/screens/widgets/pdf_view_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PdfProvider pdfProvider = Provider.of<PdfProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PDF View'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const PdfView(),
          const SizedBox(height: 50),
          Row(
            children: [
              const SizedBox(width: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 40,

                ),
                onPressed: () {
                  pdfProvider.sharePDF();
                },
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: CircleBorder(),
                ),
                child: const Icon(
                  Icons.download,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  pdfProvider.createFileOfPdfUrl();
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}