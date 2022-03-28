import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider_OverView_01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue[100],
              child: Text(
                'MyHomePage',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            CounterA(counter: counter, increment: increment),
            SizedBox(height: 20),
            Middle(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatefulWidget {
  const CounterA({Key? key, required this.counter, required this.increment})
      : super(key: key);
  final int counter;
  final VoidCallback increment;

  @override
  State<CounterA> createState() => _CounterAState();
}

class _CounterAState extends State<CounterA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.red[100],
      child: Column(
        children: [
          Text(
            '${widget.counter}',
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: widget.increment,
            child: Text(
              'Increment',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({Key? key, required this.counter}) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(counter: counter),
          SizedBox(width: 20),
          Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatefulWidget {
  const CounterB({Key? key, required this.counter}) : super(key: key);
  final int counter;

  @override
  State<CounterB> createState() => _CounterBState();
}

class _CounterBState extends State<CounterB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: EdgeInsets.all(10),
      child: Text(
        '${widget.counter}',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: EdgeInsets.all(10),
      child: Text(
        'Sibling',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
