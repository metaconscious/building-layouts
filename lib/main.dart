import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter layout demo'),
            ),
            body: Column(
              children: [
                const TitleSection(
                  name: 'Oeschinen Lake Campground',
                  location: 'Kandersteg, Switzerland',
                  stars: 41,
                ),
                ButtonSection(buttons: <ButtonItem>[
                  ButtonItem(icon: Icons.call, color: color, label: 'CALL'),
                  ButtonItem(icon: Icons.near_me, color: color, label: 'ROUTE'),
                  ButtonItem(icon: Icons.share, color: color, label: 'SHARE'),
                ]),
              ],
            )));
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key, required this.buttons}) : super(key: key);

  final List<ButtonItem> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons,
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem(
      {Key? key, required this.icon, required this.color, required this.label})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
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
