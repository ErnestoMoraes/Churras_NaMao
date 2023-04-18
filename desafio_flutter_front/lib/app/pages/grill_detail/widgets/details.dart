import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, dynamic>> dias = {
      0: {'color': context.colorsApp.white, 'text': 'Dia de Hoje'},
      1: {'color': Colors.red, 'text': 'Dia com Reserva'},
      2: {'color': context.colorsApp.primary, 'text': 'Dia Selecionado'},
    };
    return Column(
      children: dias.entries.map((entry) {
        final dia = entry.value;
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(color: context.colorsApp.secondary),
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: dia['color'],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                dia['text'],
                style: context.textStyles.textInputLabel.copyWith(
                  color: context.colorsApp.white,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
