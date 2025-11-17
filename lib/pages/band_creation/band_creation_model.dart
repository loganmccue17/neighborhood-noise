import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'band_creation_widget.dart' show BandCreationWidget;
import 'package:flutter/material.dart';

class BandCreationModel extends FlutterFlowModel<BandCreationWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? bandPhotoUrl;

  double? lat;

  double? long;

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

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData2a0 = false;
  FFUploadedFile uploadedLocalFile_uploadData2a0 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for BandName widget.
  FocusNode? bandNameFocusNode;
  TextEditingController? bandNameTextController;
  String? Function(BuildContext, String?)? bandNameTextControllerValidator;
  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in locationsearch widget.
  ApiCallResponse? apiResultfnt;
  // Stores action output result for [Custom Action - latlong] action in locationsearch widget.
  LatLng? latlongobject;
  // State field(s) for Genre widget.
  FocusNode? genreFocusNode;
  TextEditingController? genreTextController;
  String? Function(BuildContext, String?)? genreTextControllerValidator;
  bool isDataUploading_uploadDataPe6 = false;
  FFUploadedFile uploadedLocalFile_uploadDataPe6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataPe6 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BandsRecord? createdBand;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bandNameFocusNode?.dispose();
    bandNameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    genreFocusNode?.dispose();
    genreTextController?.dispose();
  }
}
