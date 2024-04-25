import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/providerClass/dryFruitsProviderClass.dart';
import 'package:sample_demo/widgets/dryFruits.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DryFruitsProviderClass(), child: const MyApp()));
  Fluttertoast.showToast;
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
      home: const DryFruits(title: 'Flutter Demo Home Page'),
    );
  }
}
