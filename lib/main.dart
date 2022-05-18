import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/view/login.dart';
import 'package:test_project/src/viewModel/Login_provider.dart';
import 'package:test_project/src/viewModel/sample_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProviderr>(
          create: (_) => LoginProviderr(),
        ),
        ChangeNotifierProvider<SampleProvider>(
          create: (_) => SampleProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:Login()
      ),
    );
  }
}

