import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gig_post_component_model.dart';
export 'gig_post_component_model.dart';

class GigPostComponentWidget extends StatefulWidget {
  const GigPostComponentWidget({
    super.key,
    required this.gigDocReference,
  });

  final DocumentReference? gigDocReference;

  @override
  State<GigPostComponentWidget> createState() => _GigPostComponentWidgetState();
}

class _GigPostComponentWidgetState extends State<GigPostComponentWidget> {
  late GigPostComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GigPostComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GigsRecord>(
      stream: GigsRecord.getDocument(widget.gigDocReference!),
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

        final containerGigsRecord = snapshot.data!;

        return Container(
          width: 300.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 4.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('GIG_POST_COMPONENT_Row_2agj2yuv_ON_TAP');
                logFirebaseEvent('Row_navigate_to');

                context.pushNamed(
                  ExpandedGigPageWidget.routeName,
                  queryParameters: {
                    'gig': serializeParam(
                      containerGigsRecord.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder<BandsRecord>(
                    stream: BandsRecord.getDocument(
                        containerGigsRecord.bandPosted!),
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

                      final imageBandsRecord = snapshot.data!;

                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'GIG_POST_COMPONENT_Image_komb6uxm_ON_TAP');
                          logFirebaseEvent('Image_navigate_to');

                          context.pushNamed(
                            BandProfilePageREADONLYWidget.routeName,
                            queryParameters: {
                              'bandRef': serializeParam(
                                containerGigsRecord.bandPosted,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.network(
                            imageBandsRecord.bandPhotoUrl,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    valueOrDefault<String>(
                      containerGigsRecord.locationName,
                      'N/A',
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
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    containerGigsRecord.description,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.jaldi(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
