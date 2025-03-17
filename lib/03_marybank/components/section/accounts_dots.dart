import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/03_marybank/components/box_dard.dart';
import 'package:primeiro_app_flutter/03_marybank/components/color_dot.dart';
import 'package:primeiro_app_flutter/03_marybank/components/content_division.dart';

class AccountsDots extends StatelessWidget {
  const AccountsDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(
              "Pontos da conta",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          BoxCard(boxContent: AccountDotsContent())

        ]
      ),
    );
  }
}

class AccountDotsContent extends StatelessWidget {
  const AccountDotsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pontos totais:'),
        Text('3000'),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ContentDivision(),
        ),
        Text('Objetivos', style: Theme.of(context).textTheme.titleMedium,),
        Row(

          children: [
          ColorDot(color: Colors.red),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Entrega grátis: 15000 pts'),
          )
        ],),
        Row(children: [
          ColorDot(color: Colors.blue),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('1 mês de streaming: 30000 pts'),
          )
        ],)
      ],
    );
  }
}
