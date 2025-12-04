import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'find_band_member_widget.dart' show FindBandMemberWidget;
import 'package:flutter/material.dart';

class FindBandMemberModel extends FlutterFlowModel<FindBandMemberWidget> {
  ///  Local state fields for this component.

  DocumentReference? foundUser;

  ///  State fields for stateful widgets in this component.

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? potentialMember;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
