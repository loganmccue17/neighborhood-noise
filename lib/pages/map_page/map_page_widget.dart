import '/backend/backend.dart';
import '/components/band_pop_up_sheet/band_pop_up_sheet_widget.dart';
import '/components/filter_sheet/filter_sheet_widget.dart';
import '/components/n_a_vbar/n_a_vbar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  static String routeName = 'MapPage';
  static String routePath = '/mapPage';

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool textFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MapPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAP_PAGE_PAGE_MapPage_ON_INIT_STATE');
      logFirebaseEvent('MapPage_update_page_state');
      _model.dataLoaded = false;
      logFirebaseEvent('MapPage_firestore_query');
      _model.prefilteredList = await queryBandsRecordOnce();
      logFirebaseEvent('MapPage_update_page_state');
      _model.mapDocList = functions
          .getListOfBandsToShowOnMap(
              _model.prefilteredList!.toList(),
              false,
              '',
              FFAppState().mockedLatLong,
              FFAppState().selectedGenres.toList(),
              FFAppState().filterRange)
          .toList()
          .cast<BandsRecord>();
      safeSetState(() {});
      logFirebaseEvent('MapPage_update_page_state');
      _model.dataLoaded = true;
      safeSetState(() {});
      logFirebaseEvent('MapPage_rebuild_page');
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<BandsRecord>>(
            stream: queryBandsRecord(
              limit: 40,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<BandsRecord> containerBandsRecordList = snapshot.data!;

              return Container(
                decoration: BoxDecoration(
                  color: Color(0xFF36382E),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(0.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 3.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Neighborhood Noise',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.jaldi(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Logo(2).png',
                                      width: 60.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 300.0,
                              child: Builder(builder: (_) {
                                if (!textFieldFocusListenerRegistered) {
                                  textFieldFocusListenerRegistered = true;
                                  _model.textFieldFocusNode!.addListener(
                                    () async {
                                      logFirebaseEvent(
                                          'MAP_TextField_huh9ns69_ON_FOCUS_CHANGE');
                                      logFirebaseEvent(
                                          'TextField_update_page_state');
                                      _model.mapDocList = functions
                                          .getListOfBandsToShowOnMap(
                                              containerBandsRecordList.toList(),
                                              _model.showActiveGigsOnly,
                                              _model.textController.text,
                                              FFAppState().mockedLatLong,
                                              FFAppState()
                                                  .selectedGenres
                                                  .toList(),
                                              FFAppState().filterRange)
                                          .toList()
                                          .cast<BandsRecord>();
                                      safeSetState(() {});
                                    },
                                  );
                                }
                                return TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Search Bands:',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.jaldi(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.jaldi(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.jaldi(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 300.0,
                                  height: 500.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).primary,
                                        FlutterFlowTheme.of(context).secondary
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Visibility(
                                    visible: _model.dataLoaded,
                                    child: FlutterFlowGoogleMap(
                                      controller: _model.googleMapsController,
                                      onCameraIdle: (latLng) =>
                                          _model.googleMapsCenter = latLng,
                                      initialLocation:
                                          _model.googleMapsCenter ??=
                                              FFAppState().mockedLatLong!,
                                      markers: _model.mapDocList
                                          .map(
                                            (marker) => FlutterFlowMarker(
                                              marker.reference.path,
                                              marker.latlong!,
                                              () async {
                                                logFirebaseEvent(
                                                    'MAP_GoogleMap_j0icr5z9_ON_MARKER_TAP');
                                                logFirebaseEvent(
                                                    'GoogleMap_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            BandPopUpSheetWidget(
                                                          bandDisplaying:
                                                              marker,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          )
                                          .toList(),
                                      markerColor: GoogleMarkerColor.violet,
                                      markerImage: MarkerImage(
                                        imagePath: 'assets/images/Logo.png',
                                        isAssetImage: true,
                                        size: 20.0 ?? 20,
                                      ),
                                      mapType: MapType.normal,
                                      style: GoogleMapStyle.standard,
                                      initialZoom: 14.0,
                                      allowInteraction: true,
                                      allowZoom: true,
                                      showZoomControls: true,
                                      showLocation: true,
                                      showCompass: false,
                                      showMapToolbar: false,
                                      showTraffic: false,
                                      centerMapOnMarkerTap: true,
                                      mapTakesGesturePreference: true,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 60.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 20.0,
                                    icon: Icon(
                                      Icons.filter_alt,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 15.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MAP_PAGE_PAGE_filter_alt_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FilterSheetWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      logFirebaseEvent(
                                          'IconButton_update_page_state');
                                      _model.mapDocList = functions
                                          .getListOfBandsToShowOnMap(
                                              containerBandsRecordList.toList(),
                                              _model.showActiveGigsOnly,
                                              _model.textController.text,
                                              FFAppState().mockedLatLong,
                                              FFAppState()
                                                  .selectedGenres
                                                  .toList(),
                                              FFAppState().filterRange)
                                          .toList()
                                          .cast<BandsRecord>();
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.nAVbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NAVbarWidget(),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
