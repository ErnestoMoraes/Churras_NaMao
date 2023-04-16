import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/pages/grill_detail/widgets/calendar_page.dart';
import 'package:reserva_churas/app/pages/grill_detail/widgets/details.dart';

class GrillDetailPage extends StatelessWidget {
  const GrillDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe de Produto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.screenWidth,
              height: context.screenHeight * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://montcalefatores.com.br/wp-content/uploads/2022/03/foto-1-calefator-3-1.jpg'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const CalendarPage(),
            const Details(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: context.percentWidth(.4),
                    height: context.screenHeight * 0.06,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: context.percentWidth(.4),
                    height: context.screenHeight * 0.06,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Salvar',
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
            SizedBox(height: context.percentHeight(.03)),
          ],
        ),
      ),
    );
  }
}
