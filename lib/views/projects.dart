import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printaskwela/components/progressbar.dart';
import 'package:printaskwela/models/projects.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class ProjectsView extends StatefulWidget {
  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  Widget _buildCard(int index, bool active, cardData) {
    final double verticalMargin = active ? 50 : 100;
    final double shadowOpacity = active ? 1.0 : 0.0;
    var cardItemData = cardData;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin / 2,
        horizontal: 8,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFDDDDDD).withOpacity(shadowOpacity),
          offset: Offset(0.0, 8.0),
          blurRadius: 10.0,
        )
      ]),
      child: Card(
        cardType: cardItemData['type'],
        data: cardItemData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final projectModel = Provider.of<ProjectModel>(context);
    final _pageController = PageController(
        viewportFraction: 0.9, initialPage: projectModel.showcaseProject);

    return SafeArea(
      child: Center(
        child: SizedBox(
          height: 700,
          child: PageView.builder(
            itemCount: projectModel.cardData.length,
            controller: _pageController,
            onPageChanged: (int index) => projectModel.showcaseProject = index,
            itemBuilder: (context, int currentIdx) {
              return _buildCard(
                currentIdx,
                currentIdx == projectModel.showcaseProject,
                projectModel.cardData[currentIdx],
              );
            },
          ),
        ),
      ),
    );
  }
}

enum CardType { photoCaption, progress, cover }

class Card extends StatelessWidget {
  final CardType cardType;
  final data;

  Card({@required this.cardType, @required this.data});

  @override
  Widget build(BuildContext context) {
    var body = <Widget>[];

    // Different body according to type
    if (cardType == CardType.cover) {
      body.addAll([
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                        // color: Colors.amber[600],
                        image: DecorationImage(
                          image: AssetImage("assets/${data['photo']}"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14.0),
                          bottomRight: Radius.circular(14.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            data['title'],
                            style: styleProjectsCardTitle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 10.0),
                            child: Text(data['caption']),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(data['buttonText']),
                                textColor: Colors.white,
                                color: Colors.amber[600],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]);
    } else if (cardType == CardType.photoCaption) {
      body.addAll([
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/${data['photo']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data['title'],
                          style: styleProjectsCardTitle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, bottom: 10.0),
                          child: Text(data['caption']),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(data['buttonText']),
                              textColor: Colors.white,
                              color: Colors.amber[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    } else if (cardType == CardType.progress) {
      body.addAll([
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.cyan[400],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      data['title'],
                      style: styleProjectsCardTitleForProgressCard,
                    ),
                    ProgressBar(
                      progress: data['progress'],
                      width: 200.0,
                      height: 4.0,
                      foregroundColor: Colors.amber[400],
                      progressTextColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage("assets/${data['photo']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(data['caption']),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(data['buttonText']),
                            textColor: Colors.white,
                            color: Colors.amber[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        children: body,
      ),
    );
  }
}
