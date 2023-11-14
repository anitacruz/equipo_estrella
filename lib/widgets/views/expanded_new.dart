import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ExpandedNew extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;

  const ExpandedNew({
    Key? key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backbutton color white
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: ManosColors.neutral100,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Novedades",
              style: ManosFonts.sub1(color: ManosColors.neutral100)),
          backgroundColor: ManosColors.secondary100,
        ),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category,
                        style:
                            ManosFonts.overline(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: ManosFonts.h2(),
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      imageUrl,
                      height: 160,
                      width: 1000,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      subtitle,
                      style: ManosFonts.sub1(color: ManosColors.secondary200),
                    ),
                    const SizedBox(height: 16),
                    Text(body,
                        style: ManosFonts.b1(color: ManosColors.neutral0)),
                    const SizedBox(height: 16),
                    Container(
                        alignment: Alignment.center,
                        child:
                            Text("Comparte esta nota", style: ManosFonts.h2())),
                    const SizedBox(height: 16),
                    PrimaryButton(
                        text: "Compartir",
                        onPressedMethod: () => _shareDeepLink(context))
                  ],
                ))));
  }

  _shareDeepLink(BuildContext context) {
    var currentLink = ModalRoute.of(context)?.settings.name;
    Share.share(currentLink!);
  }
}
