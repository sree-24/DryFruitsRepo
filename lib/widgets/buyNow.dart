import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/providerClass/dryFruitsProviderClass.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuyNow'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Consumer<DryFruitsProviderClass>(builder: (context, model, child) {
        return Center(
            child: Column(
          children: [
            Text("Total Items: ${model.cartItems.length}"),
            Text("Total Rupees.₹${model.calculateTotalPrice()}")
          ],
        ));
      }),
    );
  }
}
