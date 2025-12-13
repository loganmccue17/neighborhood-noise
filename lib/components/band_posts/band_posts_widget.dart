import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'band_posts_model.dart';
export 'band_posts_model.dart';

class BandPostsWidget extends StatefulWidget {
  const BandPostsWidget({
    super.key,
    required this.postReference,
  });

  final DocumentReference? postReference;

  @override
  State<BandPostsWidget> createState() => _BandPostsWidgetState();
}

class _BandPostsWidgetState extends State<BandPostsWidget> {
  late BandPostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BandPostsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BAND_POSTS_COMP_bandPosts_ON_INIT_STATE');
      logFirebaseEvent('bandPosts_backend_call');
      _model.output = await UsersRecord.getDocumentOnce(currentUserReference!);
      if (_model.output!.likedPosts.contains(widget.postReference)) {
        logFirebaseEvent('bandPosts_update_component_state');
        _model.liked = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('bandPosts_update_component_state');
        _model.liked = false;
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
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postReference!),
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

        final containerPostsRecord = snapshot.data!;

        return Container(
          width: 325.4,
          height: 333.28,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiary,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondary,
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
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

                final columnUsersRecord = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'BAND_POSTS_COMP_Text_vn52bsma_ON_TAP');
                        logFirebaseEvent('Text_navigate_to');

                        context.pushNamed(
                          BandProfilePageREADONLYWidget.routeName,
                          queryParameters: {
                            'bandRef': serializeParam(
                              containerPostsRecord.postedByBand,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );
                      },
                      child: Text(
                        containerPostsRecord.bandPostedName,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.jaldi(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.network(
                          containerPostsRecord.imageURL,
                          width: 261.3,
                          height: 214.41,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ToggleIcon(
                                        onPressed: () async {
                                          safeSetState(() =>
                                              _model.liked = !_model.liked);
                                          logFirebaseEvent(
                                              'BAND_POSTS_ToggleIcon_kgwmnb9f_ON_TOGGLE');
                                          if (_model.liked) {
                                            logFirebaseEvent(
                                                'ToggleIcon_backend_call');

                                            await widget.postReference!
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'numberOfLikes':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'ToggleIcon_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'liked_posts':
                                                      FieldValue.arrayUnion([
                                                    widget.postReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            logFirebaseEvent(
                                                'ToggleIcon_backend_call');

                                            await widget.postReference!
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'numberOfLikes':
                                                      FieldValue.increment(
                                                          -(1)),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'ToggleIcon_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'liked_posts':
                                                      FieldValue.arrayRemove([
                                                    widget.postReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }
                                        },
                                        value: _model.liked,
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          containerPostsRecord.numberOfLikes
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.jaldi(
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        containerPostsRecord.description,
                        maxLines: 10,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.jaldi(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
