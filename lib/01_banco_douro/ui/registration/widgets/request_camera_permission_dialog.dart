import 'package:flutter/material.dart';

import '../../_core/themes/colors.dart';

Future<dynamic> showRequestCameraPermissionDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const Dialog(
        child: _RequestDeniedCameraPermissionDialog(),
      );
    },
  );
}

class _RequestDeniedCameraPermissionDialog extends StatelessWidget {
  const _RequestDeniedCameraPermissionDialog();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          const Icon(
            Icons.camera_alt_outlined,
            color: AppColors.orange,
          ),
          const Text(
            "Precisamos de acesso à sua câmera",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          const Text(
            "Para continuar o cadastro, a aplicação precisa de autorização para acessar a sua câmera.",
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              TextButton(
                onPressed: () => _onNotNowClicked(context),
                child: const Text("Agora não"),
              ),
              ElevatedButton(
                onPressed: () => _onConfirmClicked(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                child: const Text("Autorizar câmera"),
              ),
            ],
          )
        ],
      ),
    );
  }

  _onNotNowClicked(BuildContext context) {
    Navigator.pop(context);
  }

  _onConfirmClicked(BuildContext context) {
    Navigator.pop(context);
  }
}
