import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'band_profile_edit_widget.dart' show BandProfileEditWidget;
import 'package:flutter/material.dart';

class BandProfileEditModel extends FlutterFlowModel<BandProfileEditWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? tempBandPhoto;

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

  LatLng? latLong;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataR51 = false;
  FFUploadedFile uploadedLocalFile_uploadDataR51 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for BandNameField widget.
  FocusNode? bandNameFieldFocusNode1;
  TextEditingController? bandNameFieldTextController1;
  String? Function(BuildContext, String?)?
      bandNameFieldTextController1Validator;
  // State field(s) for BandBioField widget.
  FocusNode? bandBioFieldFocusNode;
  TextEditingController? bandBioFieldTextController;
  String? Function(BuildContext, String?)? bandBioFieldTextControllerValidator;
  // State field(s) for BandGenreField widget.
  FocusNode? bandGenreFieldFocusNode;
  TextEditingController? bandGenreFieldTextController;
  String? Function(BuildContext, String?)?
      bandGenreFieldTextControllerValidator;
  // State field(s) for BandLocField widget.
  FocusNode? bandLocFieldFocusNode;
  TextEditingController? bandLocFieldTextController;
  String? Function(BuildContext, String?)? bandLocFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in locationsearch widget.
  ApiCallResponse? apiResultfnt;
  // Stores action output result for [Custom Action - latlong] action in locationsearch widget.
  LatLng? latlongobject;
  // State field(s) for BandNameField widget.
  FocusNode? bandNameFieldFocusNode2;
  TextEditingController? bandNameFieldTextController2;
  String? Function(BuildContext, String?)?
      bandNameFieldTextController2Validator;
  // State field(s) for BandNameField widget.
  FocusNode? bandNameFieldFocusNode3;
  TextEditingController? bandNameFieldTextController3;
  String? Function(BuildContext, String?)?
      bandNameFieldTextController3Validator;
  bool isDataUploading_uploadData5yc = false;
  FFUploadedFile uploadedLocalFile_uploadData5yc =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5yc = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    bandNameFieldFocusNode1?.dispose();
    bandNameFieldTextController1?.dispose();

    bandBioFieldFocusNode?.dispose();
    bandBioFieldTextController?.dispose();

    bandGenreFieldFocusNode?.dispose();
    bandGenreFieldTextController?.dispose();

    bandLocFieldFocusNode?.dispose();
    bandLocFieldTextController?.dispose();

    bandNameFieldFocusNode2?.dispose();
    bandNameFieldTextController2?.dispose();

    bandNameFieldFocusNode3?.dispose();
    bandNameFieldTextController3?.dispose();
  }
}
