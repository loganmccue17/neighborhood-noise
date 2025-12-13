import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

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
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SETTINGS_COMP_SIGN_OUT_BTN_ON_TAP');
                logFirebaseEvent('Button_update_app_state');
                FFAppState().activeBand = null;
                safeSetState(() {});
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(LoginWidget.routeName);
              },
              text: 'Sign Out',
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: 250.0,
                height: 60.0,
                padding: EdgeInsets.all(24.0),
                iconPadding: EdgeInsets.all(0.0),
                color: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.jaldi(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SETTINGS_COMP_EDIT_PROFILE_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(ProfilePageEditWidget.routeName);
              },
              text: 'Edit Profile',
              icon: Icon(
                Icons.edit,
                size: 20.0,
              ),
              options: FFButtonOptions(
                width: 250.0,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.jaldi(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
