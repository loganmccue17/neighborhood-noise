import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  bool isDataUploading_uploadDataOxk = false;
  FFUploadedFile uploadedLocalFile_uploadDataOxk =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataOxk = '';

  // Stores action output result for [Backend Call - Create Document] action in CreatePostButton widget.
  PostsRecord? postDocRef;
  // State field(s) for PostDescriptionTextField widget.
  FocusNode? postDescriptionTextFieldFocusNode;
  TextEditingController? postDescriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      postDescriptionTextFieldTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for GigDescription widget.
  FocusNode? gigDescriptionFocusNode;
  TextEditingController? gigDescriptionTextController;
  String? Function(BuildContext, String?)?
      gigDescriptionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GigsRecord? gigPosting;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    postDescriptionTextFieldFocusNode?.dispose();
    postDescriptionTextFieldTextController?.dispose();

    gigDescriptionFocusNode?.dispose();
    gigDescriptionTextController?.dispose();
  }
}
