import 'package:flutter/material.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});


  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NumbersListProvider>(context, listen: false)
              .addNumber();
          
        },
        child: const Icon(Icons.plus_one),
      ),
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Consumer<NumbersListProvider>(

        builder: (context, value, child) {
          List<int> numbers = value.numbers;
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(numbers.lastOrNull.toString() ?? 'No data'),
            Expanded(
              
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Text(numbers[index].toString()),
                );
              },),
            )
          ],
        );
      
        },
      )
    );
  }
}