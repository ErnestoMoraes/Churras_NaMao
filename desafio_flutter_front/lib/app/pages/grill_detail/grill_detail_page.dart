import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_churas/app/core/ui/base_state/base_state.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_controller.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_state.dart';
import 'package:reserva_churas/app/pages/grill_detail/widgets/calendar_page.dart';
import 'package:reserva_churas/app/pages/grill_detail/widgets/details.dart';

class GrillDetailPage extends StatefulWidget {
  final GrillModel grillModel;
  final int indexModel;

  const GrillDetailPage({
    super.key,
    required this.grillModel,
    required this.indexModel,
  });

  @override
  State<GrillDetailPage> createState() => _GrillDetailPageState();
}

class _GrillDetailPageState
    extends BaseState<GrillDetailPage, GrillDetailController> {
  late List<String> selectedDates;
  @override
  void onReady() {
    super.onReady();
    controller.loadRents(widget.grillModel.rents);
    selectedDates = widget.grillModel.rents.map((e) => e.dateRent).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<GrillDetailController, GrillDetailState>(
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                  ),
                  child: Text(
                    widget.grillModel.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: context.colorsApp.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                  ),
                  child: Text(
                    widget.grillModel.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: context.colorsApp.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.01),
                Container(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.grillModel.photo,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                CalendarPage(
                  selectedDates: widget.grillModel.rents,
                ),
                const Details(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        state.grillId = widget.indexModel;
                        bool isOk = true;
                        for (var rental in state.rents) {
                          var databack = rental.dateRent.substring(0, 10);
                          var datahoje =
                              state.selectedDay.toString().substring(0, 10);

                          if (databack == datahoje) {
                            isOk = false;
                            break;
                          }
                        }
                        if (isOk) {
                          await context
                              .read<GrillDetailController>()
                              .addRents();
                        } else {
                          showError('Data já reservada');
                        }
                      },
                      child: Container(
                        width: context.percentWidth(.6),
                        height: context.screenHeight * 0.06,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'Reservar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: context.percentHeight(.03),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
