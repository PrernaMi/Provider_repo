import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/list_provider.dart';
import 'package:state_management_provider/provider_page.dart';

import 'home_page.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>ProviderPage()),
            ChangeNotifierProvider(create: (context)=>ListProvider()),
  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

