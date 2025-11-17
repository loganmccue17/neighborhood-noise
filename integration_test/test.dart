import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:neighborhood_noise/flutter_flow/flutter_flow_icon_button.dart';
import 'package:neighborhood_noise/flutter_flow/flutter_flow_widgets.dart';
import 'package:neighborhood_noise/flutter_flow/flutter_flow_theme.dart';
import 'package:neighborhood_noise/index.dart';
import 'package:neighborhood_noise/main.dart';
import 'package:neighborhood_noise/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:neighborhood_noise/backend/firebase/firebase_config.dart';
import 'package:neighborhood_noise/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('US4', () {
    testWidgets('US4 -Navigate To Band Profile and Follow Band -  Trekker',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'trek@mail.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 4000),
      );
      await tester.tap(find.byIcon(Icons.music_note));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('compactBand_y75d')),
        100.0,
        scrollable: find
            .descendant(
              of: find.byKey(const ValueKey('PageView_hgdn')),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      await tester.tap(find.byKey(const ValueKey('compactBand_y75d')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      expect(find.byKey(const ValueKey('Button_iclv')), findsWidgets);
      await tester.tap(find.byKey(const ValueKey('Button_iclv')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 500),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      expect(find.text('Unfollow'), findsOneWidget);
    });

    testWidgets('US4 - Navigate To Gig from Band Profile',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'trek@mail.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: HomePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(
        const Duration(milliseconds: 3000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 5000),
      );
      await tester.tap(find.byIcon(Icons.search_sharp));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('AllBands_kmtd')),
        100.0,
        scrollable: find
            .descendant(
              of: find.byKey(const ValueKey('PageView_hgdn')),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 5000),
      );
      await tester.tap(find.byKey(const ValueKey('compactBand_y75d')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      expect(find.text('Gigs'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('GigPostComponent_onvm')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      expect(find.text('Gig Description'), findsOneWidget);
    });

    testWidgets('US4 - Navigate back to search page from band profile page',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'trek@mail.com', password: 'password');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SearchWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 5000),
      );
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('AllBands_kmtd')),
        100.0,
        scrollable: find
            .descendant(
              of: find.byKey(const ValueKey('PageView_hgdn')),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      await tester.tap(find.byKey(const ValueKey('compactBand_y75d')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 2000),
      );
      expect(find.byKey(const ValueKey('Icon_q5u3')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('Icon_q5u3')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 5000),
      );
      expect(find.byKey(const ValueKey('TextField_8996')), findsOneWidget);
    });
  });

  testWidgets('US1', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Email_46fn')), 'myemail@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('CreatePass_vgie')), 'password');
    await tester.enterText(
        find.byKey(const ValueKey('Confirmpass_usja')), 'password');
    await tester.tap(find.byKey(const ValueKey('Signupbutton_g1d9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('PageTitle_muey')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
