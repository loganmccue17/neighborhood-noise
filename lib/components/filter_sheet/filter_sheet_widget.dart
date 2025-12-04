import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_sheet_model.dart';
export 'filter_sheet_model.dart';

/// Create a new component: "FilterSheet"
///
/// Genre selector:
///
/// CheckboxListTile for each genre
/// Update selectedGenres state
/// Radius slider:
///
/// Slider widget (5-100 range)
/// Update searchRadius state
/// Active Gigs toggle:
///
/// Switch widget
/// Update showActiveGigsOnly state
/// Apply button:
///
/// Close bottom sheet
/// Trigger query refresh on both views
class FilterSheetWidget extends StatefulWidget {
  const FilterSheetWidget({super.key});

  @override
  State<FilterSheetWidget> createState() => _FilterSheetWidgetState();
}

class _FilterSheetWidgetState extends State<FilterSheetWidget> {
  late FilterSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FILTER_SHEET_FilterSheet_ON_INIT_STATE');
      logFirebaseEvent('FilterSheet_update_component_state');
      _model.tempActiveGigsOnly = FFAppState().showActiveGigsOnly;
      safeSetState(() {});
    });

    _model.switchValue = FFAppState().showActiveGigsOnly;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                    Text(
                      'Filter Options',
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
                        logFirebaseEvent('FILTER_SHEET_COMP_close_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genre Keywords',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlutterFlowCheckboxGroup(
                          options: ['rock', 'jazz', 'pop', 'indie', 'rap'],
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.checkboxGroupValues = val);
                            logFirebaseEvent(
                                'FILTER_SHEET_CheckboxGroup_fettgnz9_ON_F');
                            logFirebaseEvent('CheckboxGroup_update_app_state');
                            FFAppState().selectedGenres = _model
                                .checkboxGroupValues!
                                .toList()
                                .cast<String>();
                            safeSetState(() {});
                          },
                          controller: _model.checkboxGroupValueController ??=
                              FormFieldController<List<String>>(
                            List.from(FFAppState().selectedGenres ?? []),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          checkboxBorderColor:
                              FlutterFlowTheme.of(context).secondaryText,
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
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          unselectedTextStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.jaldi(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          checkboxBorderRadius: BorderRadius.circular(4.0),
                          initialized: _model.checkboxGroupValues != null,
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Radius',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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
                    Container(
                      width: double.infinity,
                      child: Slider(
                        activeColor: FlutterFlowTheme.of(context).primary,
                        inactiveColor: FlutterFlowTheme.of(context).alternate,
                        min: 5.0,
                        max: 100.0,
                        value: _model.sliderValue ??= 25.0,
                        label: _model.sliderValue?.toStringAsFixed(1),
                        divisions: 19,
                        onChanged: (newValue) {
                          newValue = double.parse(newValue.toStringAsFixed(1));
                          safeSetState(() => _model.sliderValue = newValue);
                          EasyDebounce.debounce(
                            '_model.sliderValue',
                            Duration(milliseconds: 100),
                            () async {
                              logFirebaseEvent(
                                  'FILTER_SHEET_Slider_1wnow5as_ON_FORM_WID');
                              logFirebaseEvent('Slider_update_app_state');
                              FFAppState().filterRange = _model.sliderValue!;
                              safeSetState(() {});
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Gigs Only',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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
                    Switch(
                      value: _model.switchValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue = newValue);
                        if (newValue) {
                          logFirebaseEvent(
                              'FILTER_SHEET_Switch_9t99lqxt_ON_TOGGLE_O');
                          logFirebaseEvent('Switch_update_component_state');
                          _model.tempActiveGigsOnly = true;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent(
                              'FILTER_SHEET_Switch_9t99lqxt_ON_TOGGLE_O');
                          logFirebaseEvent('Switch_update_component_state');
                          _model.tempActiveGigsOnly = false;
                          safeSetState(() {});
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('FILTER_SHEET_APPLY_FILTERS_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().showActiveGigsOnly = _model.tempActiveGigsOnly;
                    safeSetState(() {});
                    logFirebaseEvent('Button_rebuild_component');
                    _model.updatePage(() {});
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Apply Filters',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.jaldi(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
