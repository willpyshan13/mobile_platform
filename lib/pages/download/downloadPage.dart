import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
/// 下载页面
class DownloadPage extends StatefulWidget{

  var token = "";

  DownloadPage(String token){
    this.token = token;
  }
  @override
  State<StatefulWidget> createState() {
    return _DownloadPageState();
  }
}

class _DownloadPageState extends State<DownloadPage>{

  @override
  Widget build(BuildContext context) {
    return Container(child: WebView(initialUrl:'https://app.vvtechnology.cn:8024/dist/android/download/download.html?token='+widget.token));
  }
}
