import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:provider/provider.dart';

import 'second.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title: const Text('Home'),
        ),
        body: Consumer<NumbersListProvider>(
          builder: (context, numbersProviderModel, child) {
            List<int> numbers = numbersProviderModel.numbers;


            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(numbers.lastOrNull.toString() ?? 'No data'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SecondScreen()));
                    },
                    child: Text('Go to Second Screen')),
                Expanded(
                  child: ListView.builder(
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(numbers[index].toString()),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
