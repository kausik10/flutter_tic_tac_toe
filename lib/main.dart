import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  List<String> inputItem = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _onTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2.0),
              ),
              // padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  inputItem[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      if (isCross && inputItem[index] == '') {
        inputItem[index] = 'X';
      } else if (!isCross && inputItem[index] == '') {
        inputItem[index] = 'O';
      }
      isCross = !isCross;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (inputItem[0] == inputItem[1] &&
        inputItem[0] == inputItem[2] &&
        inputItem[0] != '') {
      _showWinDialog(inputItem[0]);
    }
    if (inputItem[3] == inputItem[4] &&
        inputItem[3] == inputItem[5] &&
        inputItem[3] != '') {
      _showWinDialog(inputItem[3]);
    }
    if (inputItem[6] == inputItem[7] &&
        inputItem[6] == inputItem[8] &&
        inputItem[6] != '') {
      _showWinDialog(inputItem[6]);
    }
    if (inputItem[0] == inputItem[3] &&
        inputItem[0] == inputItem[6] &&
        inputItem[0] != '') {
      _showWinDialog(inputItem[0]);
    }
    if (inputItem[1] == inputItem[4] &&
        inputItem[1] == inputItem[7] &&
        inputItem[1] != '') {
      _showWinDialog(inputItem[1]);
    }
    if (inputItem[2] == inputItem[5] &&
        inputItem[2] == inputItem[8] &&
        inputItem[2] != '') {
      _showWinDialog(inputItem[2]);
    }
    if (inputItem[0] == inputItem[4] &&
        inputItem[0] == inputItem[8] &&
        inputItem[0] != '') {
      _showWinDialog(inputItem[0]);
    }
    if (inputItem[2] == inputItem[4] &&
        inputItem[2] == inputItem[6] &&
        inputItem[2] != '') {
      _showWinDialog(inputItem[2]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner is $winner'),
        );
      },
    );
  }
}
