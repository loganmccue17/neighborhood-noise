import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'band_pop_up_sheet_model.dart';
export 'band_pop_up_sheet_model.dart';

class BandPopUpSheetWidget extends StatefulWidget {
  const BandPopUpSheetWidget({
    super.key,
    required this.bandDisplaying,
  });

  final BandsRecord? bandDisplaying;

  @override
  State<BandPopUpSheetWidget> createState() => _BandPopUpSheetWidgetState();
}

class _BandPopUpSheetWidgetState extends State<BandPopUpSheetWidget> {
  late BandPopUpSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BandPopUpSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BAND_POP_UP_SHEET_bandPopUpSheet_ON_INIT');
      if ((currentUserDocument?.followedbands.toList() ?? [])
          .contains(widget.bandDisplaying?.reference)) {
        logFirebaseEvent('bandPopUpSheet_update_component_state');
        _model.isFollowing = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('bandPopUpSheet_update_component_state');
        _model.isFollowing = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'BAND_POP_UP_SHEET_Text_m3ltwss3_ON_TAP');
                        logFirebaseEvent('Text_navigate_to');

                        context.pushNamed(
                          BandProfilePageREADONLYWidget.routeName,
                          queryParameters: {
                            'bandRef': serializeParam(
                              widget.bandDisplaying?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Text(
                        valueOrDefault<String>(
                          widget.bandDisplaying?.bandName,
                          'Band',
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.jockeyOne(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'BAND_POP_UP_SHEET_COMP_close_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: ClipOval(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Image.network(
                              widget.bandDisplaying!.bandPhotoUrl,
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        if (!(_model.isFollowing ? true : false))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BAND_POP_UP_SHEET_FollowButton_ON_TAP');
                              logFirebaseEvent('FollowButton_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'followedbands': FieldValue.arrayUnion(
                                        [widget.bandDisplaying?.reference]),
                                  },
                                ),
                              });
                              logFirebaseEvent(
                                  'FollowButton_update_component_state');
                              _model.isFollowing = true;
                              safeSetState(() {});
                            },
                            text: 'Follow',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.jaldi(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        if (_model.isFollowing ? true : false)
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BAND_POP_UP_SHEET_UNFOLLOW_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'followedbands': FieldValue.arrayRemove(
                                        [widget.bandDisplaying?.reference]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_update_component_state');
                              _model.isFollowing = false;
                              safeSetState(() {});
                            },
                            text: 'Unfollow',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.jaldi(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Genre(s)',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.jaldi(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.bandDisplaying?.genre,
                        'Genreless',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.jaldi(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
