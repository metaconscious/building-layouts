import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter layout demo'),
            ),
            body: Column(
              children: const [
                TitleSection(
                  name: 'Oeschinen Lake Campground',
                  location: 'Kandersteg, Switzerland',
                  stars: 41,
                ),
              ],
            )));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection(
      {Key? key,
      required this.name,
      required this.location,
      required this.stars})
      : super(key: key);

  final String name;
  final String location;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(stars.toString())
        ],
      ),
    );
  }
}
