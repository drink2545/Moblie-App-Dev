import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class card_music extends StatelessWidget {
  const card_music({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network('https://picsum.photos/seed/244/600',
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 100,
                  height: 30,
                  child: Text(
                    'Music name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}