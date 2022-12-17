import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '/Enums/urls.dart';

class QRDialog extends StatelessWidget {
  final int id;

  const QRDialog({required this.id, super.key});

  final _qrSize = 300.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildQR(),
    );
  }

  Widget _buildQR() {
    return SizedBox(
      width: _qrSize,
      height: _qrSize,
      child: _buildQRContent(),
    );
  }

  Center _buildQRContent() {
    return Center(
      child: QrImage(
        data: _generateProfileUrl(),
        version: QrVersions.auto,
        size: _qrSize,
      ),
    );
  }

  String _generateProfileUrl() {
    return Urls.generateProfileLink(id);
  }
}
