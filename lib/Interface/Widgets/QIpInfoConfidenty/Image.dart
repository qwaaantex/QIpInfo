import 'package:QIpInfo/Interface/Widgets/QIpInfoConfidenty/Tittle.dart';
import 'package:flutter/material.dart';

class QIpInfoConfidentyImage extends StatelessWidget {
  const QIpInfoConfidentyImage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height;
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).canvasColor,
              ),
              width: width,
              height: height * 0.5,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QIpInfoConfidentyTittle(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                "lib/Assets/Images/Public.jpg",
                                width: width * 0.4,
                                errorBuilder: (context, error, stackTrace) {
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ),
                           Text("Публичный",textAlign: TextAlign.center,),
                        ],
                      ),
                      SizedBox(width: 2),
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                "lib/Assets/Images/Private.jpg",
                                width: width * 0.4,
                                errorBuilder: (context, error, stackTrace) {
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ),
                          Text("Личный",textAlign: TextAlign.center,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}