import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Grade Predictor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GradePredictionPage(),
    );
  }
}

class GradePredictionPage extends StatefulWidget {
  const GradePredictionPage({super.key});

  @override
  _GradePredictionPageState createState() => _GradePredictionPageState();
}

class _GradePredictionPageState extends State<GradePredictionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _assessment1Controller = TextEditingController();
  final TextEditingController _assessment2Controller = TextEditingController();

  String _predictedGrade = "";
  bool _isLoading = false;

  // Function to predict grade using API
  Future<void> _predictGrade() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      String rollNo = _rollNoController.text;
      double assessment1 = double.parse(_assessment1Controller.text);
      double assessment2 = double.parse(_assessment2Controller.text);

      // Prepare data for the request
      Map<String, dynamic> data = {
        "roll_no": rollNo,
        "assessment1": assessment1,
        "assessment2": assessment2,
      };

      // Send POST request to the API
      try {
        final response = await http.post(
          Uri.parse('https://linear-regression-api-sj2a.onrender.com/predict'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(data),
        );

        // Check the status code and handle response
        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          setState(() {
            _predictedGrade = "Predicted Grade: ${responseData['grade']}";
          });
        } else {
          setState(() {
            _predictedGrade =
                "Error: ${response.statusCode} - ${response.body}";
          });
        }
      } catch (e) {
        // Detailed error log
        setState(() {
          _predictedGrade = "Error: $e";
        });
      } finally {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Grade Predictor'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Enter your details to predict the grade:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _rollNoController,
                decoration: const InputDecoration(
                  labelText: 'Roll No',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Roll No';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _assessment1Controller,
                decoration: const InputDecoration(
                  labelText: 'Assessment 1 Grade',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.assignment),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Assessment 1 grade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _assessment2Controller,
                decoration: const InputDecoration(
                  labelText: 'Assessment 2 Grade',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.assignment),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Assessment 2 grade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _predictGrade,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Predict Grade',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              if (_predictedGrade.isNotEmpty)
                Center(
                  child: Text(
                    _predictedGrade,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
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
