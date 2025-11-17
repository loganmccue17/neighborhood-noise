import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  double? lat;

  double? long;

  LatLng? latlongoutput;

  List<String> locationOutput = [];
  void addToLocationOutput(String item) => locationOutput.add(item);
  void removeFromLocationOutput(String item) => locationOutput.remove(item);
  void removeAtIndexFromLocationOutput(int index) =>
      locationOutput.removeAt(index);
  void insertAtIndexInLocationOutput(int index, String item) =>
      locationOutput.insert(index, item);
  void updateLocationOutputAtIndex(int index, Function(String) updateFn) =>
      locationOutput[index] = updateFn(locationOutput[index]);

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
  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in locationsearch widget.
  ApiCallResponse? apiResultfnt;
  // Stores action output result for [Custom Action - latlong] action in locationsearch widget.
  LatLng? latlongobject;
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

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    gigDescriptionFocusNode?.dispose();
    gigDescriptionTextController?.dispose();
  }
}
