import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/api/appApi.dart';
import 'package:flutter_admin/components/cryButton.dart';
import 'package:flutter_admin/components/cryDialog.dart';
import 'package:flutter_admin/components/form1/crySelect.dart';
import 'package:flutter_admin/data/data1.dart';
import 'package:flutter_admin/models/index.dart';
import 'package:flutter_admin/models/app.dart';
import 'package:flutter_admin/models/requestBodyApi.dart';
import 'package:flutter_admin/models/responeBodyApi.dart';

import 'appEdit.dart';

class AppList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Curd1State();
  }
}

class Curd1State extends State {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int rowsPerPage = 10;
  MyDS myDS = new MyDS();
  App formData = App();

  reset() {
    this.formData = App();
    formKey.currentState.reset();
    myDS.requestBodyApi.params = formData.toJson();
    myDS.loadData();
  }

  query() {
    formKey.currentState.save();
    myDS.requestBodyApi.params = formData.toJson();
    myDS.loadData();
  }

  @override
  void initState() {
    super.initState();
    myDS.context = context;
    myDS.page.pageSize = rowsPerPage;
    myDS.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((c) {
      query();
    });
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: formKey,
      child: Wrap(
        children: <Widget>[
          CrySelect(
            label: '平台',
            value: "1",
            dataList: platformList,
            onSaved: (v) {
              myDS.platform = v;
            },
          ),
          CrySelect(
            label: '客户端',
            value: "1",
            dataList: deptIdList,
            onSaved: (v) {
              myDS.client = v;
            },
          ),
        ],
      ),
    );

    ButtonBar buttonBar = ButtonBar(
      alignment: MainAxisAlignment.start,
      children: <Widget>[
        CryButton(
          label: '查询',
          onPressed: () {
            query();
          },
        ),
        CryButton(
          label: '重置',
          onPressed: () {
            reset();
          },
        ),
        CryButton(
          label: '增加',
          onPressed: () {
            cryDialog(
              width: 900,
              context: context,
              title: '增加',
              body: AppEditPage(),
            ).then((v) {
              if (v != null) {
                query();
              }
            });
          },
        ),
        CryButton(
          label: '修改',
          onPressed: myDS.selectedCount != 1
              ? null
              : () {
                  if (myDS.selectedRowCount != 1) {
                    return;
                  }
                  App person = myDS.dataList.firstWhere((v) {
                    return v.selected;
                  });
                  cryDialog(
                    width: 900,
                    context: context,
                    title: '修改',
                    body: AppEditPage(id: person.appId.toString()),
                  ).then((v) {
                    if (v) {
                      query();
                    }
                  });
                },
        ),
        CryButton(
          label: '删除',
          onPressed: myDS.selectedCount < 1
              ? null
              : () {
                  cryConfirm(context, '确定删除', () async {
                    List ids = myDS.dataList.where((v) {
                      return v.selected;
                    }).map<String>((v) {
                      return v.appId.toString();
                    }).toList();
                    await AppApi.removeByIds(ids);
                    query();
                    Navigator.of(context).pop();
                  });
                },
        ),
      ],
    );

    Scrollbar table = Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          PaginatedDataTable(
            header: const Text('应用列表'),
            rowsPerPage: rowsPerPage,
            onRowsPerPageChanged: (int value) {
              setState(() {
                rowsPerPage = value;
                myDS.page.pageSize = rowsPerPage;
                myDS.loadData();
              });
            },
            availableRowsPerPage: <int>[2, 5, 10, 20],
            onPageChanged: myDS.onPageChanged,
            columns: <DataColumn>[
              DataColumn(
                label: const Text('应用名'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('appName', ascending),
              ),
              DataColumn(
                label: const Text('版本号'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('version', ascending),
              ),
              DataColumn(
                label: const Text('渠道'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('channel', ascending),
              ),
              DataColumn(
                label: const Text('下载链接'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('downloadUrl', ascending),
              ),
              DataColumn(
                label: const Text('更新内容'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('updateLog', ascending),
              ),
              DataColumn(
                label: const Text('创建时间'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('downloadUrl', ascending),
              ),
              DataColumn(
                label: const Text('修改时间'),
                onSort: (int columnIndex, bool ascending) =>
                    myDS.sort('downloadUrl', ascending),
              ),
              DataColumn(
                label: const Text('操作'),
              ),
            ],
            source: myDS,
          ),
        ],
      ),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          form,
          buttonBar,
          Expanded(
            child: table,
          ),
        ],
      ),
    );
  }
}

class MyDS extends DataTableSource {
  MyDS();

  var client = "1";
  var platform = "android";

  BuildContext context;
  List<App> dataList;
  int selectedCount = 0;
  RequestBodyApi requestBodyApi = RequestBodyApi();
  Page page = Page();

  sort(column, ascending) {
    page.orders[0].column = column;
    page.orders[0].asc = !page.orders[0].asc;
    loadData();
  }

  loadData() async {
    var params = {
      'page': '1',
      'limit': '100',
      'clientId': client,
      'platform': platform
    };
    ResponseBodyApi responseBodyApi = await AppApi.page(params);
    page = Page.fromJson(responseBodyApi.data);

    dataList = page.list.map<App>((v) {
      App person = App.fromJson(v);
      person.selected = false;
      return person;
    }).toList();
    selectedCount = 0;
    notifyListeners();
  }

  onPageChanged(firstRowIndex) {
    page.currPage = firstRowIndex / page.pageSize + 1;
    loadData();
  }

  @override
  DataRow getRow(int index) {
    if (dataList == null) {
      return null;
    }
    var dataIndex = index - page.pageSize * (page.currPage - 1);

    if (dataIndex >= dataList.length) {
      return null;
    }
    App person = dataList[dataIndex];

    return DataRow.byIndex(
      index: index,
      selected: person.selected,
      onSelectChanged: (bool value) {
        person.selected = value;
        selectedCount += value ? 1 : -1;
        notifyListeners();
      },
      cells: <DataCell>[
        DataCell(Text(person.appName ?? '--')),
        DataCell(Text(person.version ?? '--')),
        DataCell(Text(person.channel.toString() ?? '--')),
        DataCell(Text(person.downloadUrl ?? '--')),
        DataCell(Text(person.updateLog ?? '--')),
        DataCell(Text(
            DateTime.fromMillisecondsSinceEpoch(person.createTime).toString() ??
                '--')),
        DataCell(Text(
            DateTime.fromMillisecondsSinceEpoch(person.createTime).toString() ??
                '--')),
        DataCell(ButtonBar(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                cryDialog(
                  width: 900,
                  context: context,
                  title: '修改',
                  body: AppEditPage(id: person.appId.toString()),
                ).then((v) {
                  if (v) {
                    loadData();
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cryConfirm(context, '确定删除', () async {
                  await AppApi.removeByIds([person.appId]);
                  loadData();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => selectedCount;

  @override
  int get rowCount => getCount();

  int getCount() {
    if (dataList == null) {
      return 0;
    } else {
      return dataList.length;
    }
  }
}
