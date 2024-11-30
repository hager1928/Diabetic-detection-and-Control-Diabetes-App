import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'diabetes_check.dart';
import 'food.dart';
import 'shared/consts.dart';
import 'shared/provider/app_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
    child: const My(),
  ));
}

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        colorScheme: const ColorScheme.light(
            background: Colors.white, secondary: Colors.blue),
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 0;

  double _weight = 0;

  double _bmi = 0;

  double _cal = 0;

  String _mealType = '';

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 20,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _height = double.parse(value);
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _weight = double.parse(value);
                    });
                  },
                ),
                freev(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bmi = _weight / ((_height / 100) * (_height / 100));
                    });
                  },
                  child: const Text('Calculate BMI'),
                ),
                freev(),
                _bmi == 0
                    ? const SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'BMI: ${_bmi.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          freev(),
                          Text(
                            'You are ${_getBMIStatus(_bmi, _weight)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                freev(v: 32),
                const Text(
                  'Select your meal type:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                freev(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      title: const Text('Breakfast'),
                      value: 'breakfast',
                      groupValue: _mealType,
                      onChanged: (value) {
                        setState(() {
                          _mealType = value!;
                          prov.changeCal((_cal * 0.25).toDouble());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'you need to gain ${prov.calories} calories in breakfast'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Lunch'),
                      value: 'lunch',
                      groupValue: _mealType,
                      onChanged: (value) {
                        setState(() {
                          _mealType = value!;
                          prov.changeCal((_cal * 0.5).toDouble());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'you need to gain ${prov.calories} calories in launch'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Dinner'),
                      value: 'dinner',
                      groupValue: _mealType,
                      onChanged: (value) {
                        setState(
                          () {
                            _mealType = value!;
                            prov.changeCal((_cal * 0.25).toDouble());

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'you need to gain ${prov.calories} calories in dinner'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyApp()),
                    );
                  },
                  child: const Text('DiabetesCheck'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodSelectionScreen(),
                      ),
                    );
                  },
                  child: const Text('pickYourFood'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getBMIStatus(double bmi, double weight) {
    if (bmi < 18.5) {
      _cal = weight * 30;

      return 'Underweight, you need to gain ${_cal.toStringAsFixed(1)} calories and you can eat food with high calories as potatos , macaroni ,baked pastries ';
    } else if (bmi < 25 && bmi > 18.5) {
      _cal = weight * 25;

      return 'Normal weight, maintain your calorie intake at ${_cal.toStringAsFixed(1)} calories eat food rich in fiber to make you feel full as whole grains ,legumes(lentile and beans),vegetable and fruits';
    } else if (bmi > 25) {
      _cal = weight * 20;

      return 'Overweight, you need to reduce your calorie intake to ${_cal.toStringAsFixed(1)} calories so you should eating food with low calories as salad ,egg ,vegetables(zucchini , beans) ,oats';
    } else {
      _cal = weight * 15;

      return 'Obese, you need to reduce your calorie intake to ${_cal.toStringAsFixed(1)} calories';
    }
  }
}
