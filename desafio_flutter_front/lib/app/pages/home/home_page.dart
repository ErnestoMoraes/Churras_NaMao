import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_churas/app/core/ui/base_state/base_state.dart';
import 'package:reserva_churas/app/core/ui/widgets/my_appbar.dart';
import 'package:reserva_churas/app/pages/home/home_controller.dart';
import 'package:reserva_churas/app/pages/home/home_state.dart';
import 'package:reserva_churas/app/pages/home/widgets/bag_grills_widget.dart';
import 'package:reserva_churas/app/pages/home/widgets/grill_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadGrills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(
                state.errorMessage ?? 'Erro não identificado',
              );
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.grills.length,
                  itemBuilder: (context, index) {
                    final grill = state.grills[index];
                    return Column(
                      children: [
                        GrillTile(grill: grill, index: index),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.grills.isNotEmpty,
                child: BagGrillsWidget(
                  grills: state.grills,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
