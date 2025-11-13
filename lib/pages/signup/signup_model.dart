import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Confirmpass widget.
  FocusNode? confirmpassFocusNode;
  TextEditingController? confirmpassTextController;
  late bool confirmpassVisibility;
  String? Function(BuildContext, String?)? confirmpassTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for CreatePass widget.
  FocusNode? createPassFocusNode;
  TextEditingController? createPassTextController;
  late bool createPassVisibility;
  String? Function(BuildContext, String?)? createPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    confirmpassVisibility = false;
    createPassVisibility = false;
  }

  @override
  void dispose() {
    confirmpassFocusNode?.dispose();
    confirmpassTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    createPassFocusNode?.dispose();
    createPassTextController?.dispose();
  }
}
