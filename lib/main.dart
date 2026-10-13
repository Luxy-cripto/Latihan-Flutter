import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan_1/Expanded/KartuDashboard.dart';
import 'package:latihan_1/Expanded/LatihanLayout.dart';
import 'package:latihan_1/Expanded/LayoutDua.dart';
import 'package:latihan_1/Expanded/LayoutSatu.dart';
import 'package:latihan_1/GridView/GridViewBuilder.dart';
import 'package:latihan_1/GridView/GridViewCount.dart';
import 'package:latihan_1/ListView/ListView.dart';
import 'package:latihan_1/ListView/ListViewBuilder.dart';
import 'package:latihan_1/ListView/ListViewCustom.dart';
import 'package:latihan_1/ListView/ListViewSeparated.dart';
import 'package:latihan_1/container_widget/containerDua.dart';
import 'package:latihan_1/container_widget/containerTiga.dart';
import 'package:latihan_1/container_widget/kartuContainer.dart';
import 'package:latihan_1/row_column_widget/ColumnWidget.dart';
import 'package:latihan_1/row_column_widget/RowColumnWidget.dart';
import 'package:latihan_1/row_column_widget/RowWidget.dart';
import 'package:latihan_1/row_column_widget/latihan.dart';
import 'package:latihan_1/row_column_widget/profileTw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Aja',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('RPL 2'),
        //   backgroundColor: Colors.blue,
        //   centerTitle: true,
        // ),
        body:
            GridViewCount(),
      ),
    );
  }
}

class ContainerTiga extends StatelessWidget {
  const ContainerTiga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerDua();
  }
}

class containerDua extends StatelessWidget {
  const containerDua({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelloWidget();
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello Flutter',
        style: TextStyle(
          color: Colors.indigo,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.amber,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
