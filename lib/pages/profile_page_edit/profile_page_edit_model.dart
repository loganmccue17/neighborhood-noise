import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_edit_widget.dart' show ProfilePageEditWidget;
import 'package:flutter/material.dart';

class ProfilePageEditModel extends FlutterFlowModel<ProfilePageEditWidget> {
  ///  Local state fields for this page.

  List<String> locationOutput = [];
  void addToLocationOutput(String item) => locationOutput.add(item);
  void removeFromLocationOutput(String item) => locationOutput.remove(item);
  void removeAtIndexFromLocationOutput(int index) =>
      locationOutput.removeAt(index);
  void insertAtIndexInLocationOutput(int index, String item) =>
      locationOutput.insert(index, item);
  void updateLocationOutputAtIndex(int index, Function(String) updateFn) =>
      locationOutput[index] = updateFn(locationOutput[index]);

  LatLng? latlong;

  double? lat;

  double? long;

  FFUploadedFile? tempPhotoUrl;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataR52 = false;
  FFUploadedFile uploadedLocalFile_uploadDataR52 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for InstrumentTextField widget.
  FocusNode? instrumentTextFieldFocusNode;
  TextEditingController? instrumentTextFieldTextController;
  String? Function(BuildContext, String?)?
      instrumentTextFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for LocTextField widget.
  FocusNode? locTextFieldFocusNode;
  TextEditingController? locTextFieldTextController;
  String? Function(BuildContext, String?)? locTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in locationsearch widget.
  ApiCallResponse? apiResultfnt;
  // Stores action output result for [Custom Action - latlong] action in locationsearch widget.
  LatLng? latlongobject;
  bool isDataUploading_uploadData5yd = false;
  FFUploadedFile uploadedLocalFile_uploadData5yd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5yd = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    instrumentTextFieldFocusNode?.dispose();
    instrumentTextFieldTextController?.dispose();

    locTextFieldFocusNode?.dispose();
    locTextFieldTextController?.dispose();
  }
}
