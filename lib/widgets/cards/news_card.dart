import 'package:equipo_estrella/commons/colors.dart';
import 'package:equipo_estrella/commons/fonts.dart';
import 'package:equipo_estrella/commons/shadows.dart';
import 'package:equipo_estrella/widgets/views/expanded_new.dart';
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
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExpandedNew(
                                          category: category,
                                          title: title,
                                          imageUrl: imageUrl,
                                          subtitle: subtitle,
                                          body:
                                              "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes.\n La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten.\nLos beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.",
                                        )))
                          },
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
