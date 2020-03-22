import 'package:flutter/material.dart';
import 'package:flutter_admin/pages/person/personList.dart';
import 'package:flutter_admin/pages/userInfo/userInfoEdit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_admin/pages/dash/dashboard1.dart';
import 'package:flutter_admin/vo/listTileVO.dart';
import 'package:flutter_admin/vo/pageVO.dart';
import 'package:flutter_admin/vo/selectOptionVO.dart';

List<SelectOptionVO> deptIdList = [
  SelectOptionVO(value: 'Life', label: 'Life'),
  SelectOptionVO(value: 'Rider', label: 'Rider'),
  SelectOptionVO(value: 'Partner', label: 'Partner'),
  SelectOptionVO(value: 'BdTools', label: 'BdTools'),
];
List<SelectOptionVO> platformList = [
  SelectOptionVO(value: 'android', label: 'android'),
  SelectOptionVO(value: 'ios', label: 'ios'),
];
List<SelectOptionVO> genderList = [
  SelectOptionVO(value: '1', label: '男'),
  SelectOptionVO(value: '2', label: '女'),
];

List<PageVO> testPageVOAll = <PageVO>[
  PageVO(id: "4", icon: Icons.people, title: 'app管理', widget: PersonList()),
];

List<ListTileVO> todoList = [
  ListTileVO(title: '江西：清理“影子药师” 整治“挂证”乱象', trailing: '2020-01-11'),
  ListTileVO(title: '刘鹤会见国际科技合作奖获奖外国专家', trailing: '2020-01-11'),
  ListTileVO(title: '刘鹤在京检查2020年春运工作时强调：全面小康之年，让回家的路更温馨、更安全', trailing: '2020-01-11'),
  ListTileVO(title: '怀报国之志，勇攀创新高峰——国家科技奖励大会引发热烈反响', trailing: '2020-01-11'),
  ListTileVO(title: '宁夏回族自治区党委国家安全委员会办公室原副主任于霆被“双开”', trailing: '2020-01-11'),
  ListTileVO(title: '“冷板凳”拼出“热产业” 上海张江迈向科创策源高地', trailing: '2020-01-11'),
  ListTileVO(title: '北京已有8个区签约195名责任规划师', trailing: '2020-01-11'),
  // ListTileVO(title: '河北：生产安全事故起数和死亡人数实现“双下降”', trailing: '2020-01-11'),
  // ListTileVO(title: '我国增值肥料产量居全球之首', trailing: '2020-01-11'),
  // ListTileVO(title: '重庆工业经济逐步回暖', trailing: '2020-01-11'),
  // ListTileVO(title: '2019年闽台交流合作深化 入闽台胞逾387万', trailing: '2020-01-11'),
  // ListTileVO(title: '“中国天眼”通过国家验收 未来将加强国内外开放共享', trailing: '2020-01-11'),
];
List<ListTileVO> linkList = [
  ListTileVO(title: 'google'),
  ListTileVO(title: 'baidu'),
  ListTileVO(title: 'oracle'),
  ListTileVO(title: 'flutter'),
  ListTileVO(title: 'vue'),
  ListTileVO(title: 'javascript'),
  ListTileVO(title: 'java'),
];
