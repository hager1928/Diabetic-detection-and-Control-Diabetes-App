import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var result;
var pregnant;
var glucose;
var bloodpressure;
var skin;
var insulin;
var BMI;
var diabetes;
var age;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> fetchData() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/state');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "pregnant": pregnant,
      "glucose": glucose,
      "bloodpressure": bloodpressure,
      "skin": skin,
      "insulin": insulin,
      "BMI": BMI,
      "diabetes": diabetes,
      "age": age
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      setState(() {
        result = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Diabetes Prediction",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (pg) => pregnant = pg,
                decoration: InputDecoration(
                  labelText: "Number of times pregnant",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (gl) => glucose = gl,
                decoration: InputDecoration(
                  labelText: "Glucose Concentration",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (bp) => bloodpressure = bp,
                decoration: InputDecoration(
                  labelText: "Blood Pressure (mm Hg)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (sk) => skin = sk,
                decoration: InputDecoration(
                  labelText: "Skin Thickness (mm)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (inl) => insulin = inl,
                decoration: InputDecoration(
                  labelText: "Insulin (mu U/ml)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (ms) => BMI = ms,
                decoration: InputDecoration(
                  labelText: "Body Mass Index",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (db) => diabetes = db,
                decoration: InputDecoration(
                  labelText: "Diabetes Pedigree Function",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (ag) => age = ag,
                decoration: InputDecoration(
                  labelText: "Age (years)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: fetchData,
                  child: Text(
                    "Predict",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
