import '/backend/backend.dart';
import '/components/filter_sheet/filter_sheet_widget.dart';
import '/components/gig_pop_up_sheet/gig_pop_up_sheet_widget.dart';
import '/components/n_a_vbar/n_a_vbar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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
              FFAppState().selectedGenres.toList(),
              FFAppState().filterRange)
          .toList()
          .cast<BandsRecord>();
      safeSetState(() {});
      logFirebaseEvent('MapPage_custom_action');
      _model.gigList = await actions.getGigDocsList(
        _model.mapDocList.toList(),
        FFAppState().mockedLatLong,
        FFAppState().filterRange,
      );
      logFirebaseEvent('MapPage_update_page_state');
      _model.gigDocList = _model.gigList!.toList().cast<GigsRecord>();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<BandsRecord>>(
            stream: FFAppState().mapQuery(
              requestFn: () => queryBandsRecord(
                limit: 40,
              ),
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
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: Container(
                          width: 425.4,
                          height: 600.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            borderRadius: BorderRadius.circular(2.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 3.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Stack(
                            children: [
                              if (_model.dataLoaded)
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) =>
                                        _model.googleMapsCenter = latLng,
                                    initialLocation: _model.googleMapsCenter ??=
                                        FFAppState().mockedLatLong!,
                                    markers: _model.gigDocList
                                        .map(
                                          (marker) => FlutterFlowMarker(
                                            marker.reference.path,
                                            marker.location!,
                                            () async {
                                              logFirebaseEvent(
                                                  'MAP_GoogleMap_j0icr5z9_ON_MARKER_TAP');
                                              logFirebaseEvent(
                                                  'GoogleMap_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          GigPopUpSheetWidget(
                                                        gigDisplaying: marker,
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
                                    showZoomControls: false,
                                    showLocation: false,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                    mapTakesGesturePreference: false,
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      height: 50.0,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              width: 300.0,
                                              child: Builder(builder: (_) {
                                                if (!textFieldFocusListenerRegistered) {
                                                  textFieldFocusListenerRegistered =
                                                      true;
                                                  _model.textFieldFocusNode!
                                                      .addListener(
                                                    () async {
                                                      logFirebaseEvent(
                                                          'MAP_TextField_huh9ns69_ON_FOCUS_CHANGE');
                                                      logFirebaseEvent(
                                                          'TextField_update_page_state');
                                                      _model.mapDocList = functions
                                                          .getListOfBandsToShowOnMap(
                                                              containerBandsRecordList
                                                                  .toList(),
                                                              _model
                                                                  .showActiveGigsOnly,
                                                              _model
                                                                  .textController
                                                                  .text,
                                                              FFAppState()
                                                                  .selectedGenres
                                                                  .toList(),
                                                              FFAppState()
                                                                  .filterRange)
                                                          .toList()
                                                          .cast<BandsRecord>();
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'TextField_custom_action');
                                                      _model.gigListFromTextField =
                                                          await actions
                                                              .getGigDocsList(
                                                        _model.mapDocList
                                                            .toList(),
                                                        FFAppState()
                                                            .mockedLatLong,
                                                        FFAppState()
                                                            .filterRange,
                                                      );
                                                      logFirebaseEvent(
                                                          'TextField_update_page_state');
                                                      _model.gigDocList = _model
                                                          .gigListFromTextField!
                                                          .toList()
                                                          .cast<GigsRecord>();
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                  );
                                                }
                                                return TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Search Bands:',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.jaldi(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.jaldi(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.jaldi(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                );
                                              }),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 20.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 20.0,
                                                icon: Icon(
                                                  Icons.filter_alt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MAP_PAGE_PAGE_filter_alt_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_bottom_sheet');
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
                                                              FilterSheetWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  logFirebaseEvent(
                                                      'IconButton_update_page_state');
                                                  _model.mapDocList = functions
                                                      .getListOfBandsToShowOnMap(
                                                          containerBandsRecordList
                                                              .toList(),
                                                          _model
                                                              .showActiveGigsOnly,
                                                          _model.textController
                                                              .text,
                                                          FFAppState()
                                                              .selectedGenres
                                                              .toList(),
                                                          FFAppState()
                                                              .filterRange)
                                                      .toList()
                                                      .cast<BandsRecord>();
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  _model.gigListFromTheButton =
                                                      await actions
                                                          .getGigDocsList(
                                                    _model.mapDocList.toList(),
                                                    FFAppState().mockedLatLong,
                                                    FFAppState().filterRange,
                                                  );
                                                  logFirebaseEvent(
                                                      'IconButton_update_page_state');
                                                  _model.gigDocList = _model
                                                      .gigListFromTheButton!
                                                      .toList()
                                                      .cast<GigsRecord>();
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.68),
                      child: wrapWithModel(
                        model: _model.nAVbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NAVbarWidget(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
