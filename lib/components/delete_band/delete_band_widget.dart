import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_band_model.dart';
export 'delete_band_model.dart';

class DeleteBandWidget extends StatefulWidget {
  const DeleteBandWidget({super.key});

  @override
  State<DeleteBandWidget> createState() => _DeleteBandWidgetState();
}

class _DeleteBandWidgetState extends State<DeleteBandWidget> {
  late DeleteBandModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteBandModel());

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
      height: 250.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryText,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Text(
                      'Delete Band',
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
                                color: FlutterFlowTheme.of(context).tertiary,
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
                  AuthUserStreamWidget(
                    builder: (context) => Builder(
                      builder: (context) {
                        final availableUsersBands =
                            (currentUserDocument?.usersBands.toList() ?? [])
                                .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: availableUsersBands.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, availableUsersBandsIndex) {
                            final availableUsersBandsItem =
                                availableUsersBands[availableUsersBandsIndex];
                            return StreamBuilder<BandsRecord>(
                              stream: BandsRecord.getDocument(
                                  availableUsersBandsItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final textBandsRecord = snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DELETE_BAND_COMP_Text_h7j78mn4_ON_TAP');
                                    for (int loop1Index = 0;
                                        loop1Index <
                                            textBandsRecord.bandMembers.length;
                                        loop1Index++) {
                                      final currentLoop1Item = textBandsRecord
                                          .bandMembers[loop1Index];
                                      logFirebaseEvent('Text_backend_call');
                                      unawaited(
                                        () async {
                                          await currentLoop1Item.update({
                                            ...mapToFirestore(
                                              {
                                                'users_bands':
                                                    FieldValue.arrayRemove([
                                                  textBandsRecord.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }(),
                                      );
                                    }
                                    for (int loop2Index = 0;
                                        loop2Index <
                                            textBandsRecord.gigs.length;
                                        loop2Index++) {
                                      final currentLoop2Item =
                                          textBandsRecord.gigs[loop2Index];
                                      logFirebaseEvent('Text_backend_call');
                                      unawaited(
                                        () async {
                                          await currentLoop2Item.delete();
                                        }(),
                                      );
                                    }
                                    for (int loop3Index = 0;
                                        loop3Index <
                                            textBandsRecord.posts.length;
                                        loop3Index++) {
                                      final currentLoop3Item =
                                          textBandsRecord.posts[loop3Index];
                                      logFirebaseEvent('Text_backend_call');
                                      unawaited(
                                        () async {
                                          await currentLoop3Item.delete();
                                        }(),
                                      );
                                    }
                                    if (FFAppState().activeBand ==
                                        textBandsRecord.reference) {
                                      if ((currentUserDocument?.usersBands
                                                      .toList() ??
                                                  [])
                                              .length >
                                          1) {
                                        logFirebaseEvent('Text_backend_call');
                                        await textBandsRecord.reference
                                            .delete();
                                        logFirebaseEvent(
                                            'Text_update_app_state');
                                        FFAppState().activeBand =
                                            (currentUserDocument?.usersBands
                                                        .toList() ??
                                                    [])
                                                .lastOrNull;
                                        safeSetState(() {});
                                      } else {
                                        logFirebaseEvent('Text_backend_call');
                                        unawaited(
                                          () async {
                                            await textBandsRecord.reference
                                                .delete();
                                          }(),
                                        );
                                        logFirebaseEvent(
                                            'Text_update_app_state');
                                        FFAppState().activeBand = null;
                                        _model.updatePage(() {});
                                      }
                                    } else {
                                      logFirebaseEvent('Text_backend_call');
                                      unawaited(
                                        () async {
                                          await textBandsRecord.reference
                                              .delete();
                                        }(),
                                      );
                                    }

                                    logFirebaseEvent('Text_navigate_to');

                                    context
                                        .pushNamed(ProfilePageWidget.routeName);
                                  },
                                  child: Text(
                                    textBandsRecord.bandName,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.jockeyOne(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
