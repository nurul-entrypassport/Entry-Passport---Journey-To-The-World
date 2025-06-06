import 'package:flutter/material.dart';
import '../models/chapter_model.dart';

class ExerciseScreen extends StatefulWidget {
  final Chapter chapter;

  const ExerciseScreen({super.key, required this.chapter});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswer;
  int score = 0;
  bool showResult = false;
  bool quizCompleted = false;

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return _buildResultScreen();
    }

    final currentExercise = widget.chapter.exercises[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE1F5FE),
              Color(0xFFFCE4EC),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildProgressBar(),
              Expanded(
                child: _buildQuestionCard(currentExercise),
              ),
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF2E7D9A),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Practice Exercise',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB3E5FC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Chapter ${widget.chapter.id}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D9A),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8BBD9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1} of ${widget.chapter.exercises.length}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
              Text(
                '${((currentQuestionIndex + 1) / widget.chapter.exercises.length * 100).round()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D9A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / widget.chapter.exercises.length,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB3E5FC)),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Exercise exercise) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFB3E5FC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.quiz,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            exercise.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D9A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          ...exercise.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return _buildOptionButton(index, option, exercise);
          }),
          if (showResult) ...[
            const SizedBox(height: 24),
            _buildExplanation(exercise),
          ],
        ],
      ),
    );
  }

  Widget _buildOptionButton(int index, String option, Exercise exercise) {
    Color getButtonColor() {
      if (!showResult) {
        return selectedAnswer == index 
            ? const Color(0xFFB3E5FC) 
            : Colors.grey[100]!;
      }
      
      if (index == exercise.correctAnswer) {
        return const Color(0xFFDCEDC8);
      } else if (selectedAnswer == index) {
        return const Color(0xFFFFCDD2);
      }
      return Colors.grey[100]!;
    }

    Color getTextColor() {
      if (!showResult) {
        return selectedAnswer == index ? Colors.white : const Color(0xFF2E7D9A);
      }
      
      if (index == exercise.correctAnswer) {
        return const Color(0xFF2E7D9A);
      } else if (selectedAnswer == index) {
        return const Color(0xFF2E7D9A);
      }
      return const Color(0xFF666666);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: showResult ? null : () {
          setState(() {
            selectedAnswer = index;
          });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getButtonColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: selectedAnswer == index 
                  ? const Color(0xFFB3E5FC) 
                  : Colors.grey[300]!,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedAnswer == index 
                      ? Colors.white 
                      : Colors.transparent,
                  border: Border.all(
                    color: selectedAnswer == index 
                        ? Colors.transparent 
                        : Colors.grey[400]!,
                  ),
                ),
                child: selectedAnswer == index
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Color(0xFFB3E5FC),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    color: getTextColor(),
                    fontWeight: selectedAnswer == index 
                        ? FontWeight.bold 
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (showResult && index == exercise.correctAnswer)
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF4CAF50),
                  size: 20,
                ),
              if (showResult && selectedAnswer == index && index != exercise.correctAnswer)
                const Icon(
                  Icons.cancel,
                  color: Color(0xFFF44336),
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation(Exercise exercise) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                selectedAnswer == exercise.correctAnswer 
                    ? Icons.check_circle 
                    : Icons.info,
                color: selectedAnswer == exercise.correctAnswer 
                    ? const Color(0xFF4CAF50) 
                    : const Color(0xFFB3E5FC),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                selectedAnswer == exercise.correctAnswer 
                    ? 'Correct! 🎉' 
                    : 'Explanation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedAnswer == exercise.correctAnswer 
                      ? const Color(0xFF4CAF50) 
                      : const Color(0xFF2E7D9A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            exercise.explanation,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          if (showResult) ...[
            Expanded(
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB3E5FC),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < widget.chapter.exercises.length - 1
                      ? 'Next Question'
                      : 'Complete Quiz',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ] else ...[
            Expanded(
              child: ElevatedButton(
                onPressed: selectedAnswer != null ? _checkAnswer : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8BBD9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Check Answer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    final percentage = (score / widget.chapter.exercises.length * 100).round();
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE1F5FE),
              Color(0xFFFCE4EC),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: percentage >= 70 
                          ? const Color(0xFFDCEDC8) 
                          : const Color(0xFFF8BBD9),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      percentage >= 70 ? Icons.emoji_events : Icons.refresh,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    percentage >= 70 ? 'Great Job! 🎉' : 'Keep Practicing! 💪',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You scored $score out of ${widget.chapter.exercises.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$percentage%',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: percentage >= 70 
                          ? const Color(0xFFDCEDC8) 
                          : const Color(0xFFF8BBD9),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentQuestionIndex = 0;
                              selectedAnswer = null;
                              score = 0;
                              showResult = false;
                              quizCompleted = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8BBD9),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Try Again'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB3E5FC),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Back to Chapter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkAnswer() {
    if (selectedAnswer == null) return;

    setState(() {
      showResult = true;
      if (selectedAnswer == widget.chapter.exercises[currentQuestionIndex].correctAnswer) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < widget.chapter.exercises.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        showResult = false;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }
}
