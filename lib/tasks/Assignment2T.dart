import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.tealAccent[100]),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? selectedTool;
  final Map<String, Widget> tools = {
    "Friendship Calculator": FriendshipCalculator(),
    "Currency Converter": CurrencyConverter(),
    "Temperature Converter": TemperatureConverter(),
    "BMI Calculator": BMICalculator(),
    "Length Converter": LengthConverter(),
    "Area Converter": AreaConverter(),
    "Volume Converter": VolumeConverter(),
    "Weight and Mass Converter": WeightMassConverter(),
    "Time Converter (Belgium to Pakistan)": TimeConverterBelgiumPakistan(),
    "Age Calculator": AgeCalculator(),
    "Time Converter (H to M or M to Sec)": TimeConverter(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Multi-Purpose Converter"))),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                "Select a Tool",
                style: TextStyle(color: Colors.black),
              ),
              value: selectedTool,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTool = newValue;
                });
              },
              items: tools.keys.map((String tool) {
                return DropdownMenuItem<String>(
                  value: tool,
                  child: Text(tool),
                );
              }).toList(),
            ),
            Expanded(
              child: selectedTool != null ? tools[selectedTool]! : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendshipCalculator extends StatelessWidget {
  final TextEditingController name1Controller = TextEditingController();
  final TextEditingController name2Controller = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  FriendshipCalculator({super.key});

  final Random random = Random();

  void calculateFriendship() {
    result.value = "Friendship Score: ${(90 + random.nextInt(11)).toString()}%";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: name1Controller,
              decoration: InputDecoration(labelText: "Name 1")),
          TextField(
              controller: name2Controller,
              decoration: InputDecoration(labelText: "Name 2")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: calculateFriendship, child: Text("Calculate")),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: result,
            builder: (context, value, child) => Text(value),
          ),
        ],
      ),
    );
  }
}

class CurrencyConverter extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  CurrencyConverter({super.key});

  void convertCurrency() {
    double amount = double.tryParse(amountController.text) ?? 0;
    result.value = "Converted: ${amount * 280} PKR";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount in USD"),
              keyboardType: TextInputType.number),
          SizedBox(height: 20),
          ElevatedButton(onPressed: convertCurrency, child: Text("Convert")),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: result,
            builder: (context, value, child) => Text(value),
          ),
        ],
      ),
    );
  }
}

class TemperatureConverter extends StatelessWidget {
  final TextEditingController tempController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  TemperatureConverter({super.key});

  void convertTemperature() {
    double tempC = double.tryParse(tempController.text) ?? 0;
    result.value = "Fahrenheit: ${(tempC * 9 / 5) + 32}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: tempController,
              decoration: InputDecoration(labelText: "Temperature in °C"),
              keyboardType: TextInputType.number),
          SizedBox(height: 20),
          ElevatedButton(onPressed: convertTemperature, child: Text("Convert")),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: result,
            builder: (context, value, child) => Text(value),
          ),
        ],
      ),
    );
  }
}

class BMICalculator extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  BMICalculator({super.key});

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 1;
    double bmi = weight / (height * height);
    result.value = "BMI: ${bmi.toStringAsFixed(2)}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "Weight in kg"),
              keyboardType: TextInputType.number),
          TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: "Height in meters"),
              keyboardType: TextInputType.number),
          SizedBox(height: 20),
          ElevatedButton(onPressed: calculateBMI, child: Text("Calculate")),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: result,
            builder: (context, value, child) => Text(value),
          ),
        ],
      ),
    );
  }
}

class LengthConverter extends StatelessWidget {
  final TextEditingController lengthController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  LengthConverter({super.key});

  void convertLength() {
    double meters = double.tryParse(lengthController.text) ?? 0;
    result.value = "Converted: ${meters * 100} cm";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: lengthController,
              decoration: InputDecoration(labelText: "Length in meters"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertLength, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class AreaConverter extends StatelessWidget {
  final TextEditingController areaController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  AreaConverter({super.key});

  void convertArea() {
    double squareMeters = double.tryParse(areaController.text) ?? 0;
    result.value = "Converted: ${squareMeters * 10.764} ft²";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: areaController,
              decoration: InputDecoration(labelText: "Area in m²"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertArea, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class VolumeConverter extends StatelessWidget {
  final TextEditingController volumeController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  VolumeConverter({super.key});

  void convertVolume() {
    double liters = double.tryParse(volumeController.text) ?? 0;
    result.value = "Converted: ${liters * 1000} mL";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: volumeController,
              decoration: InputDecoration(labelText: "Volume in Liters"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertVolume, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class WeightMassConverter extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  WeightMassConverter({super.key});

  void convertWeight() {
    double kg = double.tryParse(weightController.text) ?? 0;
    result.value = "Converted: ${kg * 2.205} lbs";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "Weight in kg"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertWeight, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class TimeConverterBelgiumPakistan extends StatelessWidget {
  final TextEditingController timeController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  TimeConverterBelgiumPakistan({super.key});

  void convertTime() {
    int belgiumTime = int.tryParse(timeController.text) ?? 0;
    int pakistanTime = (belgiumTime + 4) % 24;
    result.value =
        "Converted: $belgiumTime:00 in Belgium is $pakistanTime:00 in Pakistan";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: timeController,
              decoration:
                  InputDecoration(labelText: "Time in Belgium (24h format)"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertTime, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class AgeCalculator extends StatelessWidget {
  final TextEditingController birthYearController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  AgeCalculator({super.key});

  void calculateAge() {
    int birthYear =
        int.tryParse(birthYearController.text) ?? DateTime.now().year;
    int age = DateTime.now().year - birthYear;
    result.value = "Your Age: $age years";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: birthYearController,
              decoration: InputDecoration(labelText: "Birth Year"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: calculateAge, child: Text("Calculate")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}

class TimeConverter extends StatelessWidget {
  final TextEditingController timeController = TextEditingController();
  final ValueNotifier<String> result = ValueNotifier("");

  TimeConverter({super.key});

  void convertTime() {
    double time = double.tryParse(timeController.text) ?? 0;
    result.value =
        "Hours to Minutes: ${time * 60} min | Minutes to Seconds: ${time * 60} sec";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: "Enter Hours or Minutes"),
              keyboardType: TextInputType.number),
          ElevatedButton(onPressed: convertTime, child: Text("Convert")),
          ValueListenableBuilder(
              valueListenable: result,
              builder: (context, value, child) => Text(value)),
        ],
      ),
    );
  }
}
