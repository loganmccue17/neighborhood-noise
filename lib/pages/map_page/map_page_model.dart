import '/backend/backend.dart';
import '/components/n_a_vbar/n_a_vbar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
  ///  Local state fields for this page.

  String searchText = ' ';

  bool showActiveGigsOnly = false;

  bool dataLoaded = false;

  List<BandsRecord> mapDocList = [];
  void addToMapDocList(BandsRecord item) => mapDocList.add(item);
  void removeFromMapDocList(BandsRecord item) => mapDocList.remove(item);
  void removeAtIndexFromMapDocList(int index) => mapDocList.removeAt(index);
  void insertAtIndexInMapDocList(int index, BandsRecord item) =>
      mapDocList.insert(index, item);
  void updateMapDocListAtIndex(int index, Function(BandsRecord) updateFn) =>
      mapDocList[index] = updateFn(mapDocList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MapPage widget.
  List<BandsRecord>? prefilteredList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for NAVbar component.
  late NAVbarModel nAVbarModel;

  @override
  void initState(BuildContext context) {
    nAVbarModel = createModel(context, () => NAVbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    nAVbarModel.dispose();
  }
}
