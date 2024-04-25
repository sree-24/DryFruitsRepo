import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/providerClass/dryFruitsProviderClass.dart';
import 'package:sample_demo/widgets/buyNow.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.amberAccent,
        ),
        body:
            Consumer<DryFruitsProviderClass>(builder: (context, model, child) {
          return model.cartItems.isEmpty
              ?  const Center(
                child: Column(
                    children:[
                       Image(image: NetworkImage("https://schoolville.com/assets/img/empty-cart-illustration.gif")),
                      Text(
                      'Your cart is empty!',
                      style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ]),
              )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.84,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10, end: 10, top: 5, bottom: 5),
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            shrinkWrap: true,
                            itemCount: model.cartItems.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              model.cartItems[index].nutsIcon ??
                                                  '',
                                              height: 80,
                                              width: 80,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model.cartItems[index]
                                                            .nutsName ??
                                                        '',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: CupertinoColors
                                                            .label,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    "Rs.₹${(model.cartItems[index]
                                                            .price ??
                                                        0.0)} ",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: CupertinoColors
                                                            .darkBackgroundGray,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 3),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ExpansionTile(
                                          title: const Text(
                                            "Benefits",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Text(
                                                model.cartItems[index]
                                                        .benefits ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (model.cartItems[index].nutrition !=
                                            null)
                                          ExpansionTile(
                                            title: const Text(
                                              "Nutrition Details",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children:
                                                      model.cartItems[index]
                                                          .nutrition!
                                                          .map(
                                                              (nutritionData) =>
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${_buildNutritionText(nutritionData.calories)}'
                                                                        '${_buildNutritionText(nutritionData.fat)}'
                                                                        '${_buildNutritionText(nutritionData.carbohydrates)}'
                                                                        '${_buildNutritionText(nutritionData.copper)}'
                                                                        '${_buildNutritionText(nutritionData.fiber)}'
                                                                        '${_buildNutritionText(nutritionData.iron)}'
                                                                        '${_buildNutritionText(nutritionData.magnesium)}'
                                                                        '${_buildNutritionText(nutritionData.manganese)}'
                                                                        '${_buildNutritionText(nutritionData.protein)}'
                                                                        '${_buildNutritionText(nutritionData.sodium)}'
                                                                        '${_buildNutritionText(nutritionData.sugars)}',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      if (nutritionData
                                                                              .vitamins !=
                                                                          null)
                                                                        ...nutritionData
                                                                            .vitamins!
                                                                            .map((e) =>
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (e.vitaminE != null || e.vitaminK != null || e.vitaminB6 != null)
                                                                                      const Text(
                                                                                        "Vitamins",
                                                                                        style: TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 18,
                                                                                          color: Colors.black,
                                                                                        ),
                                                                                      ),
                                                                                    Text('${_buildNutritionText(e.vitaminK)}${_buildNutritionText(e.vitaminB6)}${_buildNutritionText(e.vitaminE)}'),
                                                                                  ],
                                                                                ))
                                                                      // Display other nutrition properties similarly
                                                                    ],
                                                                  ))
                                                          .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.amberAccent,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.red,
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () {
                                              model.clearCart();
                                            },
                                            child: const Text(
                                              "Clear Cart",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.green,
                                      ),
                                      child:  Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BuyNow()));
                                            },
                                            child: const Text(
                                              "Buy Now",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
        }));
  }

  String _buildNutritionText(String? value) {
    if (value != null && value.isNotEmpty) {
      return '$value\n';
    } else {
      return '';
    }
  }
}
