import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
/// 下载页面
class DownloadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DownloadPageState();
  }
}

class _DownloadPageState extends State<DownloadPage>{
  @override
  Widget build(BuildContext context) {
    return Container(child: QrImage(
      data: 'www.baidu.com',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    ));
  }
}
