void main() {
  List<Map<String, dynamic>> myQuestions = [
    {
      'question': 'Who is the president of Biafra?',
      'options': [
        'Buhari',
        'Shonekan',
        'Ojukwu',
        'Okeke',
      ],
    },
    {
      'question': 'Who is the president of Nigeria?',
      'options': [
        'Tobiloba',
        'Shonekan',
        'Ojukwu',
        'Okeke',
      ],
    }
  ];

  String option1;
  String option2;
  String option3;
  String option4;
  for (var question in myQuestions) {
    int index = 2;
    question = myQuestions[index];
    var options = question['options'];
    option1 = options[0];
    option2 = options[1];
    option3 = options[2];
    option4 = options[4];
  }
}
