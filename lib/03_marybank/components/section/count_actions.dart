import 'package:flutter/material.dart';
import '/03_marybank/components/box_dard.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Ações da conta",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: (){},
              child: BoxCard(
                  boxContent: AccountActionsContent(
                icon: Icon(Icons.account_balance_wallet),
                text: "Depositar",
              )),
            ),
            InkWell(
              onTap: (){},
              child: BoxCard(
                  boxContent: AccountActionsContent(
                icon: Icon(Icons.cached),
                text: "Transferir",
              )),
            ),
            InkWell(
              onTap: (){},
              child: BoxCard(
                  boxContent: AccountActionsContent(
                icon: Icon(Icons.center_focus_strong),
                text: "Ler",
              )),
            )
          ])
        ],
      ),
    );
  }
}

class AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;

  const AccountActionsContent(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
