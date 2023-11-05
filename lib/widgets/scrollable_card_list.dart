import 'package:flutter/material.dart';

//TODO: sliver -> sirve para tener distintos scrolleables
class ScrollableCardList extends StatelessWidget {
  final Widget widgetChild;

  const ScrollableCardList({
    Key? key,
    required this.widgetChild,
  }) : super(key: key);

  //TODO: fix the list divider. Im not sure its actually 24 pixels tall
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: widgetChild,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
          height: 0,
        ),
      ),
    );
  }
}
