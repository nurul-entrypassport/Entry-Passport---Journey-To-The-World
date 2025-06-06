import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/chapter_model.dart';

class ProgressService {
  static const String _progressKey = 'user_progress';
  static const String _scoresKey = 'quiz_scores';

  static Future<void> saveChapterProgress(int chapterId, double progress) async {
    final prefs = await SharedPreferences.getInstance();
    final progressData = await getProgressData();
    progressData[chapterId.toString()] = progress;
    await prefs.setString(_progressKey, jsonEncode(progressData));
  }

  static Future<void> markChapterComplete(int chapterId) async {
    await saveChapterProgress(chapterId, 1.0);
  }

  static Future<Map<String, double>> getProgressData() async {
    final prefs = await SharedPreferences.getInstance();
    final progressString = prefs.getString(_progressKey);
    if (progressString == null) return {};
    
    final Map<String, dynamic> decoded = jsonDecode(progressString);
    return decoded.map((key, value) => MapEntry(key, value.toDouble()));
  }

  static Future<double> getChapterProgress(int chapterId) async {
    final progressData = await getProgressData();
    return progressData[chapterId.toString()] ?? 0.0;
  }

  static Future<void> saveQuizScore(GameScore score) async {
    final prefs = await SharedPreferences.getInstance();
    final scores = await getQuizScores();
    scores.add(score);
    
    final scoresJson = scores.map((score) => {
      'chapterId': score.chapterId,
      'score': score.score,
      'totalQuestions': score.totalQuestions,
      'completedAt': score.completedAt.toIso8601String(),
    }).toList();
    
    await prefs.setString(_scoresKey, jsonEncode(scoresJson));
  }

  static Future<List<GameScore>> getQuizScores() async {
    final prefs = await SharedPreferences.getInstance();
    final scoresString = prefs.getString(_scoresKey);
    if (scoresString == null) return [];
    
    final List<dynamic> decoded = jsonDecode(scoresString);
    return decoded.map((item) => GameScore(
      chapterId: item['chapterId'],
      score: item['score'],
      totalQuestions: item['totalQuestions'],
      completedAt: DateTime.parse(item['completedAt']),
    )).toList();
  }

  static Future<List<GameScore>> getChapterScores(int chapterId) async {
    final allScores = await getQuizScores();
    return allScores.where((score) => score.chapterId == chapterId).toList();
  }

  static Future<int> getBestScore(int chapterId) async {
    final chapterScores = await getChapterScores(chapterId);
    if (chapterScores.isEmpty) return 0;
    return chapterScores.map((score) => score.score).reduce((a, b) => a > b ? a : b);
  }
}
