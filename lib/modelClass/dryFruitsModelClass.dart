
class DryFruitsModelClass {
  String? nutsName;
  int? price;
  String? nutsIcon;
  String? benefits;
  List<Nutrition>? nutrition;

  DryFruitsModelClass(
      {this.nutsName,
        this.price,
        this.nutsIcon,
        this.benefits,
        this.nutrition});

  DryFruitsModelClass.fromJson(Map<String, dynamic> json) {
    nutsName = json['nutsName'];
    price = json['price'];
    nutsIcon = json['nutsIcon'];
    benefits = json['benefits'];
    if (json['nutrition'] != null) {
      nutrition = <Nutrition>[];
      json['nutrition'].forEach((v) {
        nutrition!.add(Nutrition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nutsName'] = nutsName;
    data['price'] = price;
    data['nutsIcon'] = nutsIcon;
    data['benefits'] = benefits;
    if (nutrition != null) {
      data['nutrition'] = nutrition!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nutrition {
  String? calories;
  String? fat;
  String? sodium;
  String? carbohydrates;
  String? fiber;
  String? sugars;
  String? protein;
  String? iron;
  String? magnesium;
  String? copper;
  String? manganese;
  List<Vitamins>? vitamins;

  Nutrition(
      {this.calories,
        this.fat,
        this.sodium,
        this.carbohydrates,
        this.fiber,
        this.sugars,
        this.protein,
        this.iron,
        this.magnesium,
        this.copper,
        this.manganese,
        this.vitamins});

  Nutrition.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    fat = json['fat'];
    sodium = json['sodium'];
    carbohydrates = json['carbohydrates'];
    fiber = json['fiber'];
    sugars = json['sugars'];
    protein = json['protein'];
    iron = json['iron'];
    magnesium = json['magnesium'];
    copper = json['copper'];
    manganese = json['manganese'];
    if (json['vitamins'] != null) {
      vitamins = <Vitamins>[];
      json['vitamins'].forEach((v) {
        vitamins!.add(Vitamins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calories'] = calories;
    data['fat'] = fat;
    data['sodium'] = sodium;
    data['carbohydrates'] = carbohydrates;
    data['fiber'] = fiber;
    data['sugars'] = sugars;
    data['protein'] = protein;
    data['iron'] = iron;
    data['magnesium'] = magnesium;
    data['copper'] = copper;
    data['manganese'] = manganese;
    if (vitamins != null) {
      data['vitamins'] = vitamins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vitamins {
  String? vitaminB6;
  String? vitaminK;
  String? vitaminE;

  Vitamins({this.vitaminB6, this.vitaminK,this.vitaminE});

  Vitamins.fromJson(Map<String, dynamic> json) {
    vitaminB6 = json['vitamin-b6'];
    vitaminK = json['vitamin-k'];
    vitaminE = json['vitamin-e'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vitamin-b6'] = vitaminB6;
    data['vitamin-k'] = vitaminK;
    data['vitamin-e'] = vitaminE;
    return data;
  }
}