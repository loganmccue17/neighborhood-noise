import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'n_p_spage_model.dart';
export 'n_p_spage_model.dart';

class NPSpageWidget extends StatefulWidget {
  const NPSpageWidget({super.key});

  static String routeName = 'NPSpage';
  static String routePath = '/nPSpage';

  @override
  State<NPSpageWidget> createState() => _NPSpageWidgetState();
}

class _NPSpageWidgetState extends State<NPSpageWidget> {
  late NPSpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NPSpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NPSpage'});
    _model.userImprovmentsTextController ??= TextEditingController();
    _model.userImprovmentsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              borderRadius: BorderRadius.circular(0.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondary,
                width: 3.0,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.asset(
                                  'assets/images/Logo(2).png',
                                  width: 75.0,
                                  height: 100.0,
                                  fit: BoxFit.contain,
                                  alignment: Alignment(-1.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'N_P_SPAGE_PAGE_Icon_djf3sbkl_ON_TAP');
                              logFirebaseEvent('Icon_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                loginCount: 0,
                              ));
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed(ProfilePageWidget.routeName);
                            },
                            child: Icon(
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 45.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'How likely are you to recommend Neighborhood Noise to a friend?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.jockeyOne(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: FlutterFlowChoiceChips(
                      key: ValueKey('nps_value'),
                      options: [
                        ChipData(' 1'),
                        ChipData(' 2'),
                        ChipData(' 3'),
                        ChipData('4'),
                        ChipData('6'),
                        ChipData('7'),
                        ChipData('8'),
                        ChipData('9'),
                        ChipData('10')
                      ],
                      onChanged: (val) async {
                        safeSetState(
                            () => _model.npschoiceValue = val?.firstOrNull);
                        logFirebaseEvent(
                            'N_P_SNpschoice_ON_FORM_WIDGET_SELECTED');
                        logFirebaseEvent('Npschoice_update_app_state');
                        FFAppState().npsScoreStr = _model.npschoiceValue!;
                        safeSetState(() {});
                      },
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.jaldi(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        iconSize: 15.0,
                        elevation: 0.0,
                        borderColor: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              font: GoogleFonts.jaldi(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 5.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      alignment: WrapAlignment.center,
                      controller: _model.npschoiceValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      wrapped: true,
                    ),
                  ),
                  Text(
                    'What are some things we can improve on ?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.jockeyOne(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Container(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.userImprovmentsTextController,
                      focusNode: _model.userImprovmentsFocusNode,
                      autofocus: false,
                      enabled: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.jaldi(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintText: 'Give us your thoughts...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.jaldi(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.jaldi(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondary,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator: _model.userImprovmentsTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('N_P_SPAGE_PAGE_Submit_ON_TAP');
                        logFirebaseEvent('Submit_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          nPSData: functions.toInt(_model.npschoiceValue!),
                          nPSString: _model.userImprovmentsTextController.text,
                          npsGatePassed: true,
                        ));
                        logFirebaseEvent('Submit_navigate_to');

                        context.pushNamed(ProfilePageWidget.routeName);
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        height: 38.9,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 60.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
