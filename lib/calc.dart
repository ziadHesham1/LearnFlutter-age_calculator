import 'package:flutter/material.dart';

var i = 0;
String output = 'your age is 0 years old';
var controller = TextEditingController();
DateTime _selectedDate = DateTime.now();

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalculateState();
}

class CalculateState extends State {
  @override
  Widget build(BuildContext context) {
    return myPage();
  }

  Scaffold myPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('caculate my age'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            myTextField(),
            const SizedBox(height: 30),
            Text(
              output,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAge,
              child: const Text('calculate'),
            )
          ],
        ),
      ),
    );
  }

  TextField myTextField() {
    return TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'enter your birth year',
           ),
        );
  }

  void calculateAge() => setState(() {
        i = DateTime.now().year - int.parse(controller.text);
        output = 'your age is $i years old';
      });
}
