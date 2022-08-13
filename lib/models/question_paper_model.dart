class QuestionPaperModel {
  String? id;
  String? title;
  String? imageUrl;
  String? description;
  int? timeSeconds;
  List<Questions>? questions;

  QuestionPaperModel(
      {this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.timeSeconds,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['image_url'];
    description = json['Description'];
    timeSeconds = json['time_seconds'];
    questions =
        (json['questions'] as List).map((e) => Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? id;
  String? question;
  List<Answers>? answers;
  String correctAnswer;

  Questions(
      {this.id, this.question, this.answers, required this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}
