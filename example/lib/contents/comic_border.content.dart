import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:easy_design_system/easy_design_system.dart';

class ComicBorderScreen extends StatefulWidget {
  static const String routeName = '/ComicBorderThemeData';
  const ComicBorderScreen({super.key});

  @override
  State<ComicBorderScreen> createState() => _ComicBorderScreenState();
}

class _ComicBorderScreenState extends State<ComicBorderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComicBorderThemeData'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MarkdownBlock(data: '''
# ComicBorder

- Why?
  - The comic theme is known to have a thick outline border, but it doesn't apply the border to every widget.
  - The widgets like 'Container', 'SizedBox', etc are not supported by the Flutter theme system to add thick border.
  - To add a thick border, we created an extension method called `comicBorder` that wraps with Container(s) apply the comic theme border to the widget.

- Purpose
  - You can add not only the outline border, but also the inner border with a different color.


- Example:
```dart
Container(
  padding: const EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(24.0),
  ),
  child: const Text('Hello, Easy Design System!'),
).comicBorder(),

/// Display a Container with a border containing background image and text.
Container(
  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
  decoration: BoxDecoration(
    image: const DecorationImage(
      image: NetworkImage('https://picsum.photos/200/300'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(32),
  ),
  child: const Text('Easy Design System with decoration!'),
).comicBorder(
  margin: const EdgeInsets.all(8.0),
  outlineColor: Colors.blue,
  inlineColor: Colors.amber,
  borderRadius: 32,
),

Container(
  padding: const EdgeInsets.all(32),
  decoration: BoxDecoration(
    image: const DecorationImage(
      image: NetworkImage('https://picsum.photos/401/200'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(22.0),
  ),
  child: const Text('Without inner border!'),
).comicBorder(
  outlineColor: Colors.black,
  spacing: 0,
),

const SizedBox(
  child: Text('12+'),
).comicBorder(
  margin: const EdgeInsets.all(8.0),
  spacing: 0,
),

const CircleAvatar(
  radius: 48,
  backgroundImage: NetworkImage('https://picsum.photos/200/300'),
).comicBorder(
  margin: const EdgeInsets.all(8.0),
  outlineColor: Colors.blue,
  inlineColor: Colors.white,
  borderRadius: 64,
),

```
      '''),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                const Icon(Icons.notifications),
                Positioned(
                  top: -12,
                  right: -9,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ).comicBorder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 0,
                    ),
                    borderRadius: 12,
                    spacing: 0,
                  ),
                ),
              ],
            ),

            ///
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: const Text('Hello, Easy Design System!'),
            ).comicBorder(),

            /// Display a Container with a border containing background image and text.
            Container(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Text('Easy Design System with decoration!'),
            ).comicBorder(
              margin: const EdgeInsets.all(8.0),
              outlineColor: Colors.blue,
              inlineColor: Colors.amber,
              borderRadius: 32,
            ),

            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/401/200'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: const Text('Without inner border!'),
            ).comicBorder(
              outlineColor: Colors.black,
              spacing: 0,
            ),

            const SizedBox(
              child: Text('12+'),
            ).comicBorder(
              margin: const EdgeInsets.all(8.0),
              spacing: 0,
            ),

            const CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ).comicBorder(
              margin: const EdgeInsets.all(8.0),
              outlineColor: Colors.blue,
              inlineColor: Colors.white,
              borderRadius: 64,
            ),

            const SafeArea(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}
