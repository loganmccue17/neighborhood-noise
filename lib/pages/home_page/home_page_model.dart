import '/components/band_posts/band_posts_widget.dart';
import '/components/n_a_vbar/n_a_vbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for bandPosts dynamic component.
  late FlutterFlowDynamicModels<BandPostsModel> bandPostsModels;
  // Model for NAVbar component.
  late NAVbarModel nAVbarModel;

  @override
  void initState(BuildContext context) {
    bandPostsModels = FlutterFlowDynamicModels(() => BandPostsModel());
    nAVbarModel = createModel(context, () => NAVbarModel());
  }

  @override
  void dispose() {
    bandPostsModels.dispose();
    nAVbarModel.dispose();
  }
}
