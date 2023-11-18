import 'dart:async';

import 'package:equipo_estrella/controllers/user_controller.dart';
import 'package:equipo_estrella/controllers/volunteering_controller.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:equipo_estrella/widgets/cards/activity_card.dart';
import 'package:equipo_estrella/widgets/scrollable_volunteering_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  VolunteeringModel? _volunteeringModel;
  final _search = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    initializeState();
    _search.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        logger.i(_search.text);
      });
    });
  }

  Future<void> initializeState() async {
    var volunteeringController =
        ref.read(volunteeringControllerProvider.notifier);

    var userController = ref.read(userControllerProvider.notifier);

    var currentUser = await userController.getCurrUser();

    logger.i(
        "Current user: ${currentUser.id} ${currentUser.email} ${currentUser.currVolunteering}");

    var currVol = await volunteeringController
        .getVolunteering(currentUser.currVolunteering);

    setState(() {
      _volunteeringModel = currVol;
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.i("VolunteeringModel: $_volunteeringModel");
    return Container(
        margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(children: [
          TextField(
              controller: _search,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search, size: 24),
              )),
          if (_volunteeringModel != null)
            Column(children: [
              const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 24),
                  child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Tu actividad",
                        style: TextStyle(fontSize: 24),
                      ))),
              ActivityCard(vModel: _volunteeringModel!),
            ]),
          const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 24),
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Voluntariados",
                    style: TextStyle(fontSize: 24),
                  ))),
          Expanded(
              child: ScrollableVolunteeringCardList(searchQuery: _search.text)),
        ]));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _search.removeListener(_onSearchChanged);
    _search.dispose();
    super.dispose();
  }
}
