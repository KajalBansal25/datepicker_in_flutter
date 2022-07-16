import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('hello calender')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({
    Key? key,
     // required this.firstDay, required this.lastDay, required this.today,
  }) : super(key: key);
// DateTime today=DateTime.now();
// DateTime firstDay=DateTime(2018, 9, 7);
// DateTime lastDay=DateTime(2030);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _settingModalBottomSheet();
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }

  void _settingModalBottomSheet() {
    const double imageRadius = 50;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          constraints: const BoxConstraints(
            minHeight: 700,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: imageRadius),
                    // padding: const EdgeInsets.only(top: imageRadius),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),

                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.calendar_month),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Custom dates',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'From',
                                    style: TextStyle(
                                        color: Colors.lightGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Feb 10,2020',
                                    style: TextStyle(
                                        color: Colors.lightGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Icon(Icons.chevron_right),
                              Column(
                                children: const [
                                  Text(
                                    'To',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Feb 10,2020',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TableCalendar(
                            focusedDay: DateTime.now(),
                            firstDay: DateTime(2018, 9, 7),
                            lastDay: DateTime(2030),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.message),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              IconButton(
                                icon: const Icon(Icons.message),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
