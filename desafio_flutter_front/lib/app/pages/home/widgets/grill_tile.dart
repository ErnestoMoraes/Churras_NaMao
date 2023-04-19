// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';
import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:reserva_churas/app/pages/home/widgets/available_grill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GrillTile extends StatefulWidget {
  final GrillModel grill;
  final int index;

  const GrillTile({
    Key? key,
    required this.grill,
    required this.index,
  }) : super(key: key);

  @override
  State<GrillTile> createState() => _GrillTileState();
}

class _GrillTileState extends State<GrillTile> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _goDetail(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      //Envio para login
      final loginResult = await navigator.pushNamed('/auth/login');
    }
    //Envio para detalhes
    await navigator.pushNamed('/grill_detail', arguments: {
      'grill': widget.grill,
      'index': widget.index,
    });
  }

  bool validate = false;
  List<bool> list = [];
  bool _isHoje() {
    widget.grill.rents.forEach((rent) {
      var dataRent = DateTime.parse(rent.dateRent).toString();
      var databack = dataRent.substring(0, 10);
      var datahoje = DateTime.now().toString().substring(0, 10);
      if (databack == datahoje) {
        list.add(true);
      } else {
        list.add(false);
      }
    });
    if (list.contains(true)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorsApp.secondary,
      child: InkWell(
        onTap: () {
          _goDetail(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isHoje() ? const AvailableGrill() : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: context.screenHeight * 0.01,
                        left: context.screenHeight * 0.015,
                      ),
                      child: Text(
                        widget.grill.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.h1.copyWith(
                          color: context.colorsApp.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: context.screenHeight * 0.01,
                        left: context.screenHeight * 0.015,
                      ),
                      child: Text(
                        widget.grill.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.h2.copyWith(
                          color: context.colorsApp.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.screenHeight * 0.015,
                          vertical: 5.0,
                        ),
                        margin:
                            EdgeInsets.only(left: context.screenHeight * 0.015),
                        decoration: BoxDecoration(
                          color: context.colorsApp.primary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Agendar reserva',
                              textAlign: TextAlign.center,
                              style: context.textStyles.h3.copyWith(
                                color: context.colorsApp.white,
                                fontSize: context.screenWidth * 0.035,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.colorsApp.white,
                              size: context.screenWidth * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: context.screenHeight * 0.01,
                  right: context.screenHeight * 0.015,
                  left: context.screenHeight * 0.01,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: cupertinoActivityIndicatorSmall,
                    image: widget.grill.photo,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
