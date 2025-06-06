class Chapter {
  final int id;
  final String title;
  final String description;
  final List<LearningObjective> objectives;
  final String pdfPath;
  final List<Exercise> exercises;
  final bool isCompleted;
  final double progress;

  Chapter({
    required this.id,
    required this.title,
    required this.description,
    required this.objectives,
    required this.pdfPath,
    required this.exercises,
    this.isCompleted = false,
    this.progress = 0.0,
  });
}

class LearningObjective {
  final String code;
  final String title;
  final List<String> subObjectives;

  LearningObjective({
    required this.code,
    required this.title,
    required this.subObjectives,
  });
}

class Exercise {
  final int id;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final ExerciseType type;
  final String explanation;

  Exercise({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.type,
    required this.explanation,
  });
}

enum ExerciseType { multipleChoice, fillInTheBlank }

class GameScore {
  final int chapterId;
  final int score;
  final int totalQuestions;
  final DateTime completedAt;

  GameScore({
    required this.chapterId,
    required this.score,
    required this.totalQuestions,
    required this.completedAt,
  });
}
