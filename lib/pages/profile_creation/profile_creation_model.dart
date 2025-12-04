import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_creation_widget.dart' show ProfileCreationWidget;
import 'package:flutter/material.dart';

class ProfileCreationModel extends FlutterFlowModel<ProfileCreationWidget> {
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

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataU8h = false;
  FFUploadedFile uploadedLocalFile_uploadDataU8h =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataU8h = '';

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  // State field(s) for InstrumentInput widget.
  FocusNode? instrumentInputFocusNode;
  TextEditingController? instrumentInputTextController;
  String? Function(BuildContext, String?)?
      instrumentInputTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for LocationInput widget.
  FocusNode? locationInputFocusNode;
  TextEditingController? locationInputTextController;
  String? Function(BuildContext, String?)? locationInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in locationsearch widget.
  ApiCallResponse? apiResultfnt;
  // Stores action output result for [Custom Action - latlong] action in locationsearch widget.
  LatLng? latlongobject;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProfileDataRecord? profileDataRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    nicknameInputFocusNode?.dispose();
    nicknameInputTextController?.dispose();

    instrumentInputFocusNode?.dispose();
    instrumentInputTextController?.dispose();

    locationInputFocusNode?.dispose();
    locationInputTextController?.dispose();
  }
}
