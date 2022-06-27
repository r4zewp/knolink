import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomApi {
  final String _botUrl = "https://telegram.me/rekruti_5_bot";
  final String _rootUrl = "";
  final Dio dio = DioSingleton().instance();

  /// launching bot
  void launchBot() async {
    await launchUrl(
      Uri.parse(_botUrl),
      mode: LaunchMode.externalNonBrowserApplication,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
      ),
    );
  }

  /// confirm code w/ uid
  void confirmCode() async {}
}
