import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupSL();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl.get<MyGoRouter>().router,
      title: 'Fluttaku',
      theme: MyTheme.data,
    );
  }
}