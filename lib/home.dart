import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          const Text('Day1', style: TextStyle(fontSize: 24)),
          Container(
            color: const Color.fromARGB(255, 34, 255, 137),
            height: 50,
          ),
          Text('Day2', style: TextStyle(fontSize: 24)),
          SizedBox(
            height: 50,
            child: Container(
              color: const Color.fromARGB(255, 34, 255, 137),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: 20,
              // ),
              Text('Sản phẩm a', style: TextStyle(fontSize: 24)),
              Text('100.000VND', style: TextStyle(fontSize: 24)),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        height: 50,
        child: const Center(
          child: Text('Bottom Navigation Bar'),
        ),
      ),
    );
  }
}
