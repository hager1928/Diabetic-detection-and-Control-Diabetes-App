// ignore_for_file: library_private_types_in_public_api

import 'package:final1/main.dart';
import 'package:final1/shared/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/consts.dart';


class FoodSelectionScreen extends StatefulWidget {
  const FoodSelectionScreen({super.key});

  @override
  _FoodSelectionScreenState createState() => _FoodSelectionScreenState();
}

class _FoodSelectionScreenState extends State<FoodSelectionScreen> {
  
  List<String> foodList = [
    'Fava Beans',
    'Falafel',
    'potato',
    'french fries',
    'boiled egg',
    'Omelette',
    'Shakshuka',
    'Cheese',
    'Cheddar',
    'cucumber',
    'tomato',
    'pepper',
    'rice',
    'pasta',
    'chicken',
    'meat',
    'pigeon',
    'kebab',
    'kofta',
    'okra',
    'zucchini',
    'pea',
    'beans',
    'lentils',
    'stuffed cabbage',
    'stuffed pepper',
    'stuffed eggplant'
  ];

  Map<String, bool> foodSelections = {
    'Fava Beans': false,
    'Falafel': false,
    'potato': false,
    'french fries': false,
    'boiled egg': false,
    'Omelette': false,
    'Shakshuka': false,
    'Cheese': false,
    'Cheddar': false,
    'cucumber': false,
    'tomato': false,
    'pepper': false,
    'rice': false,
    'pasta': false,
    'chicken': false,
    'meat': false,
    'pigeon': false,
    'kebab': false,
    'kofta': false,
    'okra': false,
    'zucchini': false,
    'pea': false,
    'beans': false,
    'lentils': false,
    'stuffed cabbage': false,
    'stuffed papper': false,
    'stuffed eggplant': false,
  };

  Map<String, double> foodCalories = {
    'Fava Beans': 110,
    'Falafel': 333,
    'potato': 87,
    'french fries': 319,
    'boiled egg': 155,
    'Omelette': 154,
    'Shakshuka': 150,
    'Cheese': 264,
    'Cheddar': 403,
    'cucumber': 15,
    'tomato': 18,
    'pepper': 31,
    'rice': 130,
    'pasta': 157,
    'chicken': 165,
    'meat': 250,
    'pigeon': 239,
    'kebab': 219,
    'kofta': 287,
    'okra': 33,
    'zucchini': 17,
    'pea': 81,
    'beans': 127,
    'lentils': 116,
    'stuffed cabbage': 113,
    'stuffed pepper': 101,
    'stuffed eggplant': 105,
  };

  Map<String, double> foodprotein = {
    'Fava Beans': 7.6,
    'Falafel': 13,
    'potato': 1.9,
    'french fries': 3.4,
    'boiled egg': 13,
    'Omelette': 10.9,
    'Shakshuka': 8,
    'Cheese': 14,
    'Cheddar': 25,
    'cucumber': .6,
    'tomato': .9,
    'pepper': 1,
    'rice': 2.4,
    'pasta': 5.8,
    'chicken': 31,
    'meat': 26,
    'pigeon': 28,
    'kebab': 18,
    'kofta': 18,
    'okra': 2,
    'zucchini': 1.2,
    'pea': 5.4,
    'beans': 9,
    'lentils': 9,
    'stuffed cabbage': 5.3,
    'stuffed pepper': 6.7,
    'stuffed eggplant': 4.4,
  };

  Map<String, double> foodfat = {
    'Fava Beans': .4,
    'Falafel': 19,
    'potato': .1,
    'french fries': 15,
    'boiled egg': 11,
    'Omelette': 11.8,
    'Shakshuka': 10,
    'Cheese': 21,
    'Cheddar': 33,
    'cucumber': .1,
    'tomato': .2,
    'pepper': .3,
    'rice': .2,
    'pasta': .8,
    'chicken': 3.6,
    'meat': 17,
    'pigeon': 14,
    'kebab': 16,
    'kofta': 23,
    'okra': .2,
    'zucchini': .3,
    'pea': .4,
    'beans': .6,
    'lentils': .4,
    'stuffed cabbage': 3.3,
    'stuffed pepper': 3.3,
    'stuffed eggplant': 5.8,
  };

  Map<String, double> foodcarb = {
    'Fava Beans': 19,
    'Falafel': 30,
    'potato': 20,
    'french fries': 41,
    'boiled egg': 1.1,
    'Omelette': .8,
    'Shakshuka': 8,
    'Cheese': 4.1,
    'Cheddar': 1.3,
    'cucumber': 3.6,
    'tomato': 3.9,
    'pepper': 7.5,
    'rice': 28,
    'pasta': 30,
    'chicken': 0,
    'meat': 0,
    'pigeon': 0,
    'kebab': 1.5,
    'kofta': 2,
    'okra': 7,
    'zucchini': 3.1,
    'pea': 14.5,
    'beans': 23.6,
    'lentils': 20,
    'stuffed cabbage': 16.3,
    'stuffed pepper': 11.2,
    'stuffed eggplant': 10.2,
  };

  Map<String, double> foodQuantities = {
    'Fava Beans': 0,
    'Falafel': 0,
    'potato': 0,
    'french fries': 0,
    'booled egg': 0,
    'Omelette': 0,
    'Shakshuka': 0,
    'Cheese': 0,
    'Cheddar': 0,
    'cucumber': 0,
    'tomato': 0,
    'pepper': 0,
    'rice': 0,
    'pasta': 0,
    'chicken': 0,
    'meat': 0,
    'pigeon': 0,
    'kebab': 0,
    'kofta': 0,
    'okra': 0,
    'zucchini': 0,
    'pea': 0,
    'beans': 0,
    'lentils': 0,
    'stuffed cabbage': 0,
    'stuffed pepper': 0,
    'stuffed eggplant': 0,
  };

  String get selectedFood {
    final selectedFoods = foodSelections.keys
        .where((food) => foodSelections[food] == true)
        .toList();

    return selectedFoods.isEmpty ? '' : selectedFoods.first;
  }

  double get totalCalories {
    double total = 0;

    foodSelections.forEach((food, isSelected) {
      if (isSelected) {
        total += (foodCalories[food] ?? 0.0) * (foodQuantities[food] ?? 0.0);
      }
    });

    return total;
  }

  double get carbCalories {
    double total1 = 0;

    foodSelections.forEach((food, isSelected) {
      if (isSelected) {
        total1 += (foodcarb[food] ?? 0.0) * (foodQuantities[food] ?? 0.0) * 4;
      }
    });

    return total1;
  }

  double get proteinCalories {
    double total1 = 0;

    foodSelections.forEach((food, isSelected) {
      if (isSelected) {
        total1 +=
            (foodprotein[food] ?? 0.0) * (foodQuantities[food] ?? 0.0) * 4;
      }
    });

    return total1;
  }

  double get fatCalories {
    double total1 = 0;

    foodSelections.forEach((food, isSelected) {
      if (isSelected) {
        total1 += (foodfat[food] ?? 0.0) * (foodQuantities[food] ?? 0.0) * 9;
      }
    });

    return total1;
  }

  int get carbGrams {
    return (carbCalories / 4).round();
  }

  int get proteinGrams {
    return (proteinCalories / 4).round();
  }

  int get fatGrams {
    return (fatCalories / 9).round();
  }

  void handleFoodSelection(String food, bool? isSelected) {
    setState(() {
      foodSelections[food] = isSelected ?? false;
    });
  }

  void handleFoodQuantityChange(String food, String value) {
    setState(() {
      foodQuantities[food] =
          value == '' || value.isEmpty ? 0.0 : double.parse(value);
    });
  }

  void handleSubmitButton() {
    final selectedFood = foodSelections.keys
        .where((food) => foodSelections[food] == true)
        .toList();

    if (selectedFood.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one food'),
        ),
      );

      return;
    }

    // const calories = 1000; // set your desired threshold here
    final renaining = Provider.of<AppProvider>(context,listen: false).calories - totalCalories;

    final message = totalCalories <Provider.of<AppProvider>(context,listen: false).calories
        ? 'Bon appétit the remaining $renaining calories as snack within 3h '
        : 'Too high calories, you should consume ${Provider.of<AppProvider>(context, listen: false).calories} calories or lower';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    print(Provider.of<AppProvider>(context, listen: false).calories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Choices'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 80),
        child: ListView(
          children: [
            for (final food in foodList)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(food),
                    value: foodSelections[food] ?? false,
                    onChanged: (isSelected) {
                      setState(() {
                        foodSelections[food] = isSelected ?? false;
                      });
                    } /* =>
                        handleFoodSelection(food, isSelected) */
                    ,
                  ),
                  if (foodSelections[food] == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Calories: ${foodCalories[food]}, '),
                              Text('carb: ${foodcarb[food]}, '),
                              Text('Protein: ${foodprotein[food]}, '),
                              Text('fat: ${foodfat[food]}, '),
                            ],
                          ),
                        ),
                        freev(),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'Quantity',
                                isDense: true,
                                border: OutlineInputBorder()),
                            onChanged: (value) =>
                                handleFoodQuantityChange(food, value),
                          ),
                        ),
                      ],
                    ),
                  const Divider(),
                ],
              ),
            if (totalCalories > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Recommended Daily Intake:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Carbohydrates:${carbGrams}g ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Protein: ${proteinGrams}g',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fat: ${fatGrams}g',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.teal.withOpacity(.3),
                    child: Text(
                      'Total Calories: $totalCalories',
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleSubmitButton,
        child: const Icon(Icons.check),
      ),
    );
  }
}
