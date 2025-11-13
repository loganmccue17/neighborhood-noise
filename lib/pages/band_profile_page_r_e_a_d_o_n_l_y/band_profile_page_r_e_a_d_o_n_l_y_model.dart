import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'band_profile_page_r_e_a_d_o_n_l_y_widget.dart'
    show BandProfilePageREADONLYWidget;
import 'package:flutter/material.dart';

class BandProfilePageREADONLYModel
    extends FlutterFlowModel<BandProfilePageREADONLYWidget> {
  ///  Local state fields for this page.

  bool isFollowing = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
