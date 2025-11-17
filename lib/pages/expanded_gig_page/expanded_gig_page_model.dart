import '/flutter_flow/flutter_flow_util.dart';
import 'expanded_gig_page_widget.dart' show ExpandedGigPageWidget;
import 'package:flutter/material.dart';

class ExpandedGigPageModel extends FlutterFlowModel<ExpandedGigPageWidget> {
  ///  Local state fields for this page.

  bool followingBand = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DescriptionReadOnly widget.
  FocusNode? descriptionReadOnlyFocusNode;
  TextEditingController? descriptionReadOnlyTextController;
  String? Function(BuildContext, String?)?
      descriptionReadOnlyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionReadOnlyFocusNode?.dispose();
    descriptionReadOnlyTextController?.dispose();
  }
}
