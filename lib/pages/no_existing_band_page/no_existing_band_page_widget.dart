import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_existing_band_page_model.dart';
export 'no_existing_band_page_model.dart';

class NoExistingBandPageWidget extends StatefulWidget {
  const NoExistingBandPageWidget({super.key});

  static String routeName = 'noExistingBandPage';
  static String routePath = '/noExistingBandPage';

  @override
  State<NoExistingBandPageWidget> createState() =>
      _NoExistingBandPageWidgetState();
}

class _NoExistingBandPageWidgetState extends State<NoExistingBandPageWidget> {
  late NoExistingBandPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoExistingBandPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'noExistingBandPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'NO_EXISTING_BAND_PAGE_PAGE__BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(ProfilePageWidget.routeName);
                      },
                      text: '',
                      icon: Icon(
                        Icons.arrow_back,
                        size: 36.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
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
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/ChatGPT_Image_Nov_10,_2025,_09_46_37_PM.png',
                              width: 299.8,
                              height: 168.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 282.8,
                      child: CarouselSlider(
                        items: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.asset(
                                'assets/images/rock_bandstickers.jpg',
                                width: 243.2,
                                height: 241.2,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Image.asset(
                              'assets/images/rockshows.webp',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Image.asset(
                              'assets/images/instruments.jpg',
                              width: 241.1,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                        carouselController: _model.carouselController ??=
                            CarouselSliderController(),
                        options: CarouselOptions(
                          initialPage: 1,
                          viewportFraction: 0.5,
                          disableCenter: false,
                          enlargeCenterPage: false,
                          enlargeFactor: 0.0,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayInterval:
                              Duration(milliseconds: (800 + 4000)),
                          autoPlayCurve: Curves.linear,
                          pauseAutoPlayInFiniteScroll: true,
                          onPageChanged: (index, _) =>
                              _model.carouselCurrentIndex = index,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      key: ValueKey('Button_wf9y'),
                      onPressed: () async {
                        logFirebaseEvent(
                            'NO_EXISTING_BAND_CREATE_BAND_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(BandCreationWidget.routeName);
                      },
                      text: 'Create Band',
                      options: FFButtonOptions(
                        height: 83.32,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.jaldi(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 50.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          shadows: [
                            Shadow(
                              color: FlutterFlowTheme.of(context).primaryText,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 1.5,
                            )
                          ],
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 50.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
