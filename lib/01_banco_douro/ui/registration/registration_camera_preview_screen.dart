import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiro_app_flutter/01_banco_douro/utils/registration_capture_types.dart';

class RegistrationCameraPreviewScreen extends StatefulWidget {
  final CameraDescription cameraDescription;
  final RegistrationCaptureTypes captureTypes;

  const RegistrationCameraPreviewScreen(
      {super.key, required this.cameraDescription, required this.captureTypes});

  @override
  State<RegistrationCameraPreviewScreen> createState() =>
      _RegistrationCameraPreviewScreenState();
}

class _RegistrationCameraPreviewScreenState
    extends State<RegistrationCameraPreviewScreen> {
  CameraController? cameraController;

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSelfie ? Colors.white : Colors.black,
      body: Center(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 750),
            child: (cameraController != null &&
                    cameraController!.value.isInitialized)
                ? AspectRatio(
                    aspectRatio: 1 / cameraController!.value.aspectRatio,
                    child: CameraPreview(
                      cameraController!,
                      child: Stack(
                        children: [
                          Image.asset(
                            _getImageByType,
                            width: MediaQuery.of(context).size.width * 1,
                            fit: BoxFit.fill,
                          ),
                          Visibility(
                            visible: isSelfie,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 32.0),
                                child: Text(
                                  'Alinhe o rosto com o guia\n E olhe para camera',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isSelfie,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 32),
                                child: IconButton(
                                  onPressed: () {
                                    _onCaptureButtonClicked();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isSelfie,
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text('Clique para capturar'),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isSelfie,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Transform.rotate(
                                  angle: pi/2,
                                  child: IconButton.filled(
                                    onPressed: () {
                                      _onCaptureButtonClicked();
                                    },
                                    iconSize: 48,
                                    icon: Icon(Icons.camera_alt),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : CircularProgressIndicator()),
      ),
    );
  }

  String get _getImageByType {
    switch (widget.captureTypes) {
      case RegistrationCaptureTypes.selfie:
        return "assets/images/bancodouro/guides/guide_selfie.png";

      case RegistrationCaptureTypes.cnh:
        return "assets/images/bancodouro/guides/guide_cnh.png";

      case RegistrationCaptureTypes.rg:
        return "assets/images/bancodouro/guides/guide_cnh.png";
    }
  }

  bool get isSelfie {
    return widget.captureTypes == RegistrationCaptureTypes.selfie;
  }

  Future<void> _initializeCamera() async {
    cameraController = CameraController(
        widget.cameraDescription, ResolutionPreset.medium,
        enableAudio: false);

    if (cameraController != null) {
      await cameraController!.initialize();

      switch (widget.cameraDescription.sensorOrientation) {
        case 0:
          cameraController!
              .lockCaptureOrientation(DeviceOrientation.portraitUp);
          break;
        case 90:
          cameraController!
              .lockCaptureOrientation(DeviceOrientation.portraitUp);
          break;
        case 180:
          cameraController!
              .lockCaptureOrientation(DeviceOrientation.portraitDown);
          break;
        case 270:
          cameraController!
              .lockCaptureOrientation(DeviceOrientation.portraitUp);
          break;
      }
      setState(() {});
    }
  }

  _onCaptureButtonClicked() {}
}
