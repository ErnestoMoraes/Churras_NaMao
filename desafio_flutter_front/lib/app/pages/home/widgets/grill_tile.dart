import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';
import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:reserva_churas/app/pages/home/widgets/available_grill.dart';

class GrillTile extends StatelessWidget {
  final GrillModel grill;

  const GrillTile({
    Key? key,
    required this.grill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorsApp.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (grill.id % 2 == 0) const AvailableGrill(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: context.screenHeight * 0.01,
                      left: context.screenHeight * 0.015,
                    ),
                    child: Text(
                      grill.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.h1.copyWith(
                        color: context.colorsApp.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: context.screenHeight * 0.01,
                      left: context.screenHeight * 0.015,
                    ),
                    child: Text(
                      grill.description,
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
                        children: [
                          Text(
                            'Programar reserva',
                            style: context.textStyles.h3.copyWith(
                              color: context.colorsApp.white,
                              fontSize: context.screenWidth * 0.04,
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
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FadeInImage.assetNetwork(
                  placeholder: cupertinoActivityIndicator,
                  image: grill.photo,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
