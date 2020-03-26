import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/api/personApi.dart';
import 'package:flutter_admin/components/cryButton.dart';
import 'package:flutter_admin/components/form1/cryInput.dart';
import 'package:flutter_admin/components/form1/crySelect.dart';
import 'package:flutter_admin/components/form1/crySelectDate.dart';
import 'package:flutter_admin/data/data1.dart';
import 'package:flutter_admin/models/app.dart';
import 'package:flutter_admin/models/responeBodyApi.dart';

class EditPage extends StatefulWidget {
  final String id;
  const EditPage({Key key, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EditPageState();
  }
}

class EditPageState extends State<EditPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  App formData = App();
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      PersonApi.getById({'id': widget.id}).then((ResponseBodyApi res) {
        formData = App.fromJson(res.data);
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: formKey,
      child: Wrap(
        children: <Widget>[
          CryInput(
            value: formData.appName,
            label: '应用名',
            onSaved: (v) {
              formData.appName = v;
            },
            validator: (v) {
              return v.isEmpty ? '必填' : null;
            },
          ),
          CryInput(
            value: formData.channel,
            label: '渠道',
            onSaved: (v) {
              formData.channel = v;
            },
          ),
          CrySelect(
            label: '版本号',
            value: formData.version,
            dataList: genderList,
            onSaved: (v) {
              formData.version = v;
            },
          ),
          CrySelectDate(
            context: context,
            value: formData.downloadUrl,
            label: '下载链接',
            onSaved: (v) {
              formData.downloadUrl = v;
            },
          ),
        ],
      ),
    );
    ButtonBar buttonBar = ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        CryButton(
          label: '保存',
          onPressed: () {
            FormState form = formKey.currentState;
            if (!form.validate()) {
              return;
            }
            form.save();
            PersonApi.saveOrUpdate(formData.toJson()).then((res) {
              BotToast.showText(text: "保存成功");
              // BotToast.showSimpleNotification(title: "init");
              Navigator.pop(context, true);
            });
          },
        ),
        CryButton(
          label: '取消',
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    DecoratedBox footer = DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: buttonBar,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        form,
        SizedBox(height: 20),
        footer,
      ],
    );
  }
}
