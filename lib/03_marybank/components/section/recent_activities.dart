import 'package:flutter/material.dart';
import '/03_marybank/components/box_dard.dart';
import '/03_marybank/components/color_dot.dart';
import '/03_marybank/themes/theme_colors.dart';
import '/03_marybank/components/content_division.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BoxCard(boxContent: _RecentActivityContent()),
    );
  }
}

class _RecentActivityContent extends StatelessWidget {
  const _RecentActivityContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity['spent']),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Saída'),
                    Text(
                      'R\$9900.27',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity['income']),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Entrada'),
                    Text(
                      'R\$9900.27',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text('Limite de gastos R\$432.90'),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: LinearProgressIndicator(
            value: 0.5,
            minHeight: 8.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ContentDivision(),
        ),
        Text(
            'Esse mês você gastou R\$2000.00 com jogos. Tente baixar esses custos !'),
        TextButton(
          onPressed: () {},
          child: Text(
            'Diga-me como !',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
