import 'package:flutter/foundation.dart';
import 'package:printaskwela/views/projects.dart';

class ProjectModel extends ChangeNotifier {
  int _currentlyShowcasedProject = 0; // Remembers the project while snapping

  get showcaseProject => _currentlyShowcasedProject;

  set showcaseProject(projectIndex) {
    if (projectIndex != _currentlyShowcasedProject) {
      _currentlyShowcasedProject = projectIndex;
      notifyListeners();
    }
  }

  List _cardData = [
    {
      'type': CardType.cover,
      'title': '30 KIDS',
      'caption':
          '₱100 from 100 people helps 30 kids with limited access to the internet',
      'buttonText': 'Donate',
      'photo': 'images/cover_1.png',
    },
    {
      'type': CardType.progress,
      'title': 'Busay Elementary School',
      'caption':
          'Stakeholders meeting with Brgy Busay Captain Maria Christia Famador and our teachers from Busay Elementary School. Move fast, print things. ❤️',
      'buttonText': 'Back this project',
      'photo': 'images/un02.jpg',
      'progress': 0.8
    },
    {
      'type': CardType.progress,
      'title': 'Naga Central Elementary School',
      'caption':
          'Stakeholders meeting with Brgy Busay Captain Maria Christia Famador and our teachers from Busay Elementary School. Move fast, print things. ❤️',
      'buttonText': 'Back this project',
      'photo': 'images/un02.jpg',
      'progress': 0.4
    },
  ];

  List get cardData => _cardData;

  set cardData(List value) {
    _cardData = value;
    notifyListeners();
  }
}
