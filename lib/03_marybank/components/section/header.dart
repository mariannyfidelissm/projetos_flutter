import 'package:flutter/material.dart';
import '../../themes/theme_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ThemeColors.headerGradient),
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'R\$ 1000.00',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                // ),
                Text.rich(
                  TextSpan(text: 'R\$', children: [
                    TextSpan(
                      text: '1000.00', style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ]),
                ),
                Text('Balanço disponível'),
              ],
            ),
            Icon(
              Icons.account_circle,
              size: 42.0,
              color: Colors.white70,
            )
          ],
        ),
      ),
    );
  }
}
