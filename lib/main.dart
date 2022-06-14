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
                const ImageSection(path: 'images/lake.jpg'),
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
                const TextSection(
                  description:
                      'Lake Oeschinen lies at the foot of the Blüemlisalp '
                      'in the Bernese Alps. Situated 1,578 meters above sea '
                      'level, it is one of the larger Alpine Lakes. A '
                      'gondola ride from Kandersteg, followed by a half-hour '
                      'walk through pastures and pine forest, leads you to '
                      'the lake, which warms to 20 degrees Celsius in the '
                      'summer. Activities enjoyed here include rowing, and '
                      'riding the summer toboggan run.',
                )
              ],
            )));
  }
}

class TextSection extends StatelessWidget {
  const TextSection({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
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

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
