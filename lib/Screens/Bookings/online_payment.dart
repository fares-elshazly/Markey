import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/Screens/Shared/home.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Bookings/payment_confirmation_dialog.dart';
import '/Resources/strings.dart';

class OnlinePaymentScreen extends StatefulWidget {
  final String url;

  const OnlinePaymentScreen({required this.url, super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  late WebViewController _webViewController;

  final _successQuery = 'success=true';
  final _failQuery = 'success=false';

  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: MRKStrings.paymentTitle),
      body: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return WebViewWidget(controller: _webViewController);
  }

  void _initializeData() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(_navigationDelegate())
      ..loadRequest(Uri.parse(widget.url));
  }

  NavigationDelegate _navigationDelegate() {
    return NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.contains(_successQuery)) {
          _finish(true);
          return NavigationDecision.prevent;
        }
        if (request.url.contains(_failQuery)) {
          _finish(false);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
  }

  void _finish(bool isSuccess) {
    Get.offAllNamed(HomeScreen.routeName);
    Get.dialog(PaymentConfirmationDialog(isSuccess: isSuccess));
  }
}
