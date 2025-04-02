
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoConfidentyText extends StatelessWidget {
  const QIpInfoConfidentyText({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height;
    List confidenty = ["Публичный", "Личный"];
    return Container(
              width: width,
              height: height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).canvasColor,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Выберите режим:", style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(
                    width: width,
                    height: height * 0.2,
                    child: ListView.builder(
                      itemCount: confidenty.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocBuilder<QIpInfoConfidentyBloc, QIpInfoConfidentyMetrics>(
                                builder: (context, state) {
                                  return AnimatedOpacity(opacity: state.index != index ? 0.2 : 1,
                                    duration: Duration(milliseconds: 500), 
                                    child: Container(
                                       
                                        key: ValueKey(state.index),
                                        height: height * 0.14,
                                        width: width * 0.34,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(48),
                                          color: index != state.index ? Theme.of(context).canvasColor : Colors.red.withOpacity(0.6),
                                        ),
                                        child: IconButton(
                                         highlightColor: Colors.transparent,
                                          onPressed: () {
                                            BlocProvider.of<QIpInfoConfidentyBloc>(context).add(QIpInfoConfidentyChangeEvent(index));
                                          },
                                          icon: Icon(
                                            index == 0
                                                ? Icons.verified_user_outlined
                                                : Icons.block,
                                            color: Theme.of(context).iconTheme.color,
                                            size: 42,
                                          ),
                                        ),
                                      
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              Text(confidenty[index]),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
  }
}