import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_creation_widget.dart' show ProfileCreationWidget;
import 'package:flutter/material.dart';

class ProfileCreationModel extends FlutterFlowModel<ProfileCreationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for LocationInput widget.
  FocusNode? locationInputFocusNode;
  TextEditingController? locationInputTextController;
  String? Function(BuildContext, String?)? locationInputTextControllerValidator;
  bool isDataUploading_uploadDataU8h = false;
  FFUploadedFile uploadedLocalFile_uploadDataU8h =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataU8h = '';

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

    locationInputFocusNode?.dispose();
    locationInputTextController?.dispose();
  }
}
