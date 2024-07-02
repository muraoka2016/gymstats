import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/telas/login/login_widget.dart';
import '/telas/treino/treino_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'hub_model.dart';
export 'hub_model.dart';

class HubWidget extends StatefulWidget {
  const HubWidget({super.key});

  @override
  State<HubWidget> createState() => _HubWidgetState();
}

class _HubWidgetState extends State<HubWidget> {
  late HubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HubModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/Logo_Gymstats.png',
                  width: 203.0,
                  height: 141.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
            child: Container(
              height: 80.0,
              decoration: const BoxDecoration(),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 210.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.95),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await authManager.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginWidget(),
                  ),
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.03, 0.22),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TreinoWidget(),
                  ),
                );
              },
              text: 'Treino',
              options: FFButtonOptions(
                height: 103.0,
                padding: const EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 100.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
