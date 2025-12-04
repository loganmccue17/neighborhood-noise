import '/components/n_a_vbar/n_a_vbar_widget.dart';
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
  // Model for NAVbar component.
  late NAVbarModel nAVbarModel;

  @override
  void initState(BuildContext context) {
    nAVbarModel = createModel(context, () => NAVbarModel());
  }

  @override
  void dispose() {
    descriptionReadOnlyFocusNode?.dispose();
    descriptionReadOnlyTextController?.dispose();

    nAVbarModel.dispose();
  }
}
