import '/components/n_a_vbar/n_a_vbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for NAVbar component.
  late NAVbarModel nAVbarModel;

  @override
  void initState(BuildContext context) {
    nAVbarModel = createModel(context, () => NAVbarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nAVbarModel.dispose();
  }
}
