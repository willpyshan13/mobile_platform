import 'package:flutter/material.dart';
import 'package:flutter_admin/pages/app/appList.dart';
import 'package:flutter_admin/vo/pageVO.dart';
import 'package:flutter_admin/vo/selectOptionVO.dart';

List<SelectOptionVO> deptIdList = [
  SelectOptionVO(value: '1', label: 'Life'),
  SelectOptionVO(value: '2', label: 'Rider'),
  SelectOptionVO(value: '3', label: 'Partner'),
  SelectOptionVO(value: '4', label: 'BdTools'),
];
List<SelectOptionVO> platformList = [
  SelectOptionVO(value: '1', label: 'android'),
  SelectOptionVO(value: '2', label: 'ios'),
];
List<SelectOptionVO> genderList = [
  SelectOptionVO(value: '1', label: '男'),
  SelectOptionVO(value: '2', label: '女'),
];

List<PageVO> testPageVOAll = <PageVO>[
  PageVO(id: "4", icon: Icons.people, title: 'app管理', widget: AppList()),
];