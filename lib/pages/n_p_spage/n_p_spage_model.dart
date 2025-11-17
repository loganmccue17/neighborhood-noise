import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'n_p_spage_widget.dart' show NPSpageWidget;
import 'package:flutter/material.dart';

class NPSpageModel extends FlutterFlowModel<NPSpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Npschoice widget.
  FormFieldController<List<String>>? npschoiceValueController;
  String? get npschoiceValue => npschoiceValueController?.value?.firstOrNull;
  set npschoiceValue(String? val) =>
      npschoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for UserImprovments widget.
  FocusNode? userImprovmentsFocusNode;
  TextEditingController? userImprovmentsTextController;
  String? Function(BuildContext, String?)?
      userImprovmentsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userImprovmentsFocusNode?.dispose();
    userImprovmentsTextController?.dispose();
  }
}
