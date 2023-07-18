import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setupSL();
  runApp(const MyApp());
  initializeDateFormatting();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: sl.get<MyGoRouter>().router,
      title: 'Fluttaku',
      theme: MyTheme.data,
    );
  }
}