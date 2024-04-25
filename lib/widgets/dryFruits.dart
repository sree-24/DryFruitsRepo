import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/providerClass/dryFruitsProviderClass.dart';
import 'cart.dart';

class DryFruits extends StatelessWidget {
  const DryFruits({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dry Fruits',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.amberAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Add your search functionality here
                  },
                ),
                Consumer<DryFruitsProviderClass>(
                    builder: (context, model, child) {
                  return Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()),
                          );
                        },
                      ),
                      model.cartCount > 0
                          ? Positioned(
                              top: 0,
                              right: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Colors.red, // You can set any color here
                                ),
                                // color: Colors.red,
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  model.cartCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  );
                }),
              ],
            ),
          )
        ],
      ),
      body: Consumer<DryFruitsProviderClass>(builder: (context, model, child) {
        if (model.dataList.isEmpty) {
          model.fetchData();
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: model.dataList.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    color: Colors.grey,
                    child: ListTile(
                      leading:
                          Image.network(model.dataList[index].nutsIcon ?? ''),
                      title: Text(model.dataList[index].nutsName ?? ''),
                      subtitle: Text(
                          "Rs.₹${model.dataList[index].price.toString() ?? ''}"),
                      trailing: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        child: Container(
                          color: Colors.limeAccent,
                          height: 30,
                          width: 100,
                          child: InkWell(
                            onTap: () {
                              model.addToCart(index);
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                children: [
                                  Text("Add To Cart"),
                                  Spacer(),
                                  Icon(Icons.shopping_cart, size: 15),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
