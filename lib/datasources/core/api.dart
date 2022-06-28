import 'package:dio/dio.dart';
import 'package:knolink/datasources/core/dio_singleton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'config.dart';

class CustomApi {
  final String _botUrl = "https://telegram.me/rekruti_5_bot";

  /// dio instance
  final Dio dio = DioSingleton().instance();

  /// launching bot
  void launchBot() async {
    if (await canLaunchUrlString(_botUrl)) {
      await launchUrl(
        Uri.parse(_botUrl),
        mode: LaunchMode.externalNonBrowserApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      );
    } else {
      throw Exception("Error launching Telegram");
    }
  }

  /// confirm code w/ uid
  Future<dynamic> confirmCode(String uid, String code) async {
    try {
      Response<Map> _res = await dio.get(
        "$rootUrl/api/Auth/codeverification",
        queryParameters: {
          'content-type': 'application/json',
          'id': uid,
          'authCode': code + uid,
        },
      );
      if (_res.statusCode == 200) {
        return _res.data;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
