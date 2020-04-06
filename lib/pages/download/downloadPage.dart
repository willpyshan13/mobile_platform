import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
    return Container(child: QrImage(
      data: 'https://app.vvtechnology.cn:8024/dist/android/download/download.html?token='+widget.token,
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    ));
  }
}
