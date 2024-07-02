import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/subtelas/segunda/adicionar_exercicio_seg/adicionar_exercicio_seg_widget.dart';
import '/telas/hub/hub_widget.dart';
import '/telas/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'treino_segunda_model.dart';
export 'treino_segunda_model.dart';

class TreinoSegundaWidget extends StatefulWidget {
  const TreinoSegundaWidget({super.key});

  @override
  State<TreinoSegundaWidget> createState() => _TreinoSegundaWidgetState();
}

class _TreinoSegundaWidgetState extends State<TreinoSegundaWidget> {
  late TreinoSegundaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreinoSegundaModel());
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/Logo_Treino.png',
                      width: 258.0,
                      height: 150.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Text(
                  'Treino A',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 210.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: StreamBuilder<List<SegundaRecord>>(
                stream: querySegundaRecord(),
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
                  List<SegundaRecord> listViewSegundaRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewSegundaRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewSegundaRecord =
                          listViewSegundaRecordList[listViewIndex];
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text(
                                listViewSegundaRecord.exercicio,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                listViewSegundaRecord.repeticoes.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 44.0,
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await listViewSegundaRecord.reference.delete();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HubWidget(),
                            ),
                          );
                        },
                        text: 'Voltar',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AdicionarExercicioSegWidget(),
                            ),
                          );
                        },
                        text: 'Adicionar Exercício',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
            alignment: const AlignmentDirectional(-0.89, -0.54),
            child: Text(
              'Exercício',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.26, -0.54),
            child: Text(
              'Repetições',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
