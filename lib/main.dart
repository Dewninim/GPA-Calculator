import 'package:flutter/material.dart';

void main() {
  runApp(GPACalculatorApp());
}

class GPACalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Make the app bar black
          iconTheme: IconThemeData(color: Colors.white, size: 30), // Make nav arrow white & bold
          titleTextStyle: TextStyle(
            color: Colors.white, // Make title white
            fontSize: 22,
            fontWeight: FontWeight.bold, // Make title bold
          ),
        ),
      ),
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List<TextEditingController> _courseNames = List.generate(6, (index) => TextEditingController());
  List<TextEditingController> _credits = List.generate(6, (index) => TextEditingController());
  List<TextEditingController> _grades = List.generate(6, (index) => TextEditingController());
  
  void _addModule() {
    setState(() {
      _courseNames.add(TextEditingController());
      _credits.add(TextEditingController());
      _grades.add(TextEditingController());
    });
  }

  double calculateGPA() {
    double totalPoints = 0;
    int totalCredits = 0;
    
    Map<String, double> gradeToPoint = {
      'A+': 4.0, 'A': 4.0, 'A-': 3.7, 'B+': 3.3, 'B': 3.0, 'B-': 2.7,
      'C+': 2.3, 'C': 2.0, 'C-': 1.7, 'D+': 1.3, 'D': 1.0, 'E': 0.0
    };

    for (int i = 0; i < _courseNames.length; i++) {
      if (_credits[i].text.isNotEmpty && _grades[i].text.isNotEmpty) {
        int credit = int.tryParse(_credits[i].text) ?? 0;
        double gradePoint = gradeToPoint[_grades[i].text.toUpperCase()] ?? 0.0;
        totalPoints += credit * gradePoint;
        totalCredits += credit;
      }
    }
    return totalCredits == 0 ? 0.0 : (totalPoints / totalCredits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Calculator')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Course Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 10),
            ...List.generate(_courseNames.length, (index) => buildInputRow(index)),
            SizedBox(height: 20),
            
            // Row for parallel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: _addModule,
                    child: Text(
                      'Add More Modules',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      double gpa = calculateGPA();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(gpa: gpa),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate, color: Colors.white, size: 24),
                        SizedBox(width: 8),
                        Text('Calculate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: TextField(
              controller: _courseNames[index], 
              decoration: InputDecoration(
                labelText: 'Course Name', 
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              style: TextStyle(color: Colors.black),
            )),
            SizedBox(width: 10),
            Expanded(child: TextField(
              controller: _credits[index], 
              decoration: InputDecoration(
                labelText: 'Credits', 
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ), 
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
            )),
            SizedBox(width: 10),
            Expanded(child: TextField(
              controller: _grades[index], 
              decoration: InputDecoration(
                labelText: 'Grade', 
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              style: TextStyle(color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double gpa;
  ResultScreen({required this.gpa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Result')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            'Your GPA: ${gpa.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
