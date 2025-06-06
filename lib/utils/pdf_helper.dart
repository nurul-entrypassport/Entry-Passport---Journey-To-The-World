import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class PDFHelper {
  /// Loads a PDF from assets and returns the file path
  static Future<String> loadAssetPDF(String assetPath) async {
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final List<int> bytes = data.buffer.asUint8List();
      
      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      
      // Extract filename from asset path
      final fileName = assetPath.split('/').last;
      final filePath = '$tempPath/$fileName';
      
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      
      return filePath;
    } catch (e) {
      throw Exception('Failed to load PDF from assets: $e');
    }
  }
  
  /// Creates a sample PDF for testing when actual PDFs aren't available
  static Future<String> createSamplePDF(String chapterTitle) async {
    try {
      // In a real app, you would generate a PDF here
      // For now, we'll just return a placeholder path
      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final filePath = '$tempPath/sample_${chapterTitle.replaceAll(' ', '_').toLowerCase()}.pdf';
      
      // This is just a placeholder - in a real app you would create an actual PDF
      final file = File(filePath);
      if (!await file.exists()) {
        await file.writeAsString('This is a sample PDF for $chapterTitle');
      }
      
      return filePath;
    } catch (e) {
      throw Exception('Failed to create sample PDF: $e');
    }
  }
}
