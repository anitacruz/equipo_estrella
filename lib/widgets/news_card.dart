import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String category;

  const NewsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 328,
        decoration: ManosShadows.shadow1,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 118, fit: BoxFit.fitWidth),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.toUpperCase(), style: ManosFonts.overline()),
                    Text(
                      title,
                      style: ManosFonts.sub1(),
                    ),
                    Text(subtitle,
                        style: ManosFonts.b2(color: ManosColors.neutral75)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 119),
                        TextButton(
                          onPressed: () {},
                          child: Text("Leer Más",
                              style: ManosFonts.button(
                                  color: ManosColors.primary200)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
