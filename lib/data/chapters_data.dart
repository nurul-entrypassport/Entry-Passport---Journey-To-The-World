import '../models/chapter_model.dart';

class ChaptersData {
  static List<Chapter> getChapters() {
    return [
      Chapter(
        id: 1,
        title: "OVERVIEW OF INTERNATIONAL BUSINESS",
        description: "Learn the fundamentals of international business and its key concepts",
        pdfPath: "assets/pdfs/chapter1.pdf",
        objectives: [
          LearningObjective(
            code: "1.1",
            title: "Explain international business overview",
            subObjectives: [
              "Define international business and domestic business",
              "Compare between international business and domestic business",
              "Identify motives for entering foreign markets (Increase sales and profits, Protect markets, sales and profits)"
            ],
          ),
          LearningObjective(
            code: "1.2",
            title: "Explain the influence of external and internal environment forces",
            subObjectives: [
              "External environments: Economic, Political/legal, Sociocultural, Competition, Technological",
              "Internal environments: Capital, Raw materials, People, Personnel, Finance, Production, Marketing"
            ],
          ),
          LearningObjective(
            code: "1.3",
            title: "Elaborate the drivers of globalization",
            subObjectives: [
              "Define Globalization",
              "Describe drivers of globalization",
              "Discuss implications for sustainable development"
            ],
          ),
          LearningObjective(
            code: "1.4",
            title: "Discuss implications to functional areas",
            subObjectives: [
              "International marketing strategies",
              "Global supply chain management",
              "International Financial System differences",
              "International human resource management"
            ],
          ),
        ],
        exercises: [
          Exercise(
            id: 1,
            question: "What is the primary difference between international and domestic business?",
            options: [
              "International business operates across national borders",
              "Domestic business is more profitable",
              "International business only involves exports",
              "There is no significant difference"
            ],
            correctAnswer: 0,
            type: ExerciseType.multipleChoice,
            explanation: "International business involves commercial transactions across national borders, while domestic business operates within a single country.",
          ),
          Exercise(
            id: 2,
            question: "Which of the following is NOT an external environment factor?",
            options: [
              "Economic environment",
              "Personnel",
              "Political environment",
              "Technological environment"
            ],
            correctAnswer: 1,
            type: ExerciseType.multipleChoice,
            explanation: "Personnel is an internal environment factor, while economic, political, and technological are external factors.",
          ),
        ],
      ),
      Chapter(
        id: 2,
        title: "POLITICAL AND LEGAL ENVIRONMENT",
        description: "Understand political systems and legal frameworks in international business",
        pdfPath: "assets/pdfs/chapter2.pdf",
        objectives: [
          LearningObjective(
            code: "2.1",
            title: "Explain the political environment in international business",
            subObjectives: [
              "Three major political systems: Totalitarianism, Democracy, Socialism",
              "Relationship between political and economic freedom",
              "Country risks: Government takeover, Expropriation, Embargoes, Boycotts, Wars",
              "Managing country risks: Proactive scanning, Ethical standards, Local partnerships, Legal contracts"
            ],
          ),
          LearningObjective(
            code: "2.2",
            title: "Discuss the legal environment in international business",
            subObjectives: [
              "Types of legal systems: Common Law, Civil Law, Religious law, Socialist law, Mixed systems",
              "Compare among types of legal systems"
            ],
          ),
        ],
        exercises: [
          Exercise(
            id: 3,
            question: "Which political system is characterized by government control over all aspects of citizens' lives?",
            options: [
              "Democracy",
              "Totalitarianism",
              "Socialism",
              "Capitalism"
            ],
            correctAnswer: 1,
            type: ExerciseType.multipleChoice,
            explanation: "Totalitarianism is a political system where the government has complete control over all aspects of public and private life.",
          ),
        ],
      ),
      Chapter(
        id: 3,
        title: "INTERNATIONAL BUSINESS ORGANIZATION DESIGN",
        description: "Explore organizational structures and multinational enterprises",
        pdfPath: "assets/pdfs/chapter3.pdf",
        objectives: [
          LearningObjective(
            code: "3.1",
            title: "Discuss organization design structure",
            subObjectives: [
              "Global corporate forms: Product, Geographic regions, Function, Matrix organizations"
            ],
          ),
          LearningObjective(
            code: "3.2",
            title: "Elaborate types of Multinational Enterprises (MNEs)",
            subObjectives: [
              "Types: Multidomestic, Multinational, Global, Transnational firms",
              "Sustainable development growth of MNEs"
            ],
          ),
          LearningObjective(
            code: "3.3",
            title: "Discuss Small and Medium-Sized International Enterprises (SMIEs)",
            subObjectives: [
              "Define SMIEs",
              "Highlight constraints on SMIEs"
            ],
          ),
        ],
        exercises: [
          Exercise(
            id: 4,
            question: "A _____ firm adapts its products and strategies to local markets in each country.",
            options: [
              "Multidomestic",
              "Global",
              "Transnational",
              "International"
            ],
            correctAnswer: 0,
            type: ExerciseType.multipleChoice,
            explanation: "Multidomestic firms customize their products and strategies to meet the specific needs of local markets.",
          ),
        ],
      ),
      Chapter(
        id: 4,
        title: "ENTRY AND EXPANSION",
        description: "Learn about market entry strategies and expansion methods",
        pdfPath: "assets/pdfs/chapter4.pdf",
        objectives: [
          LearningObjective(
            code: "4.1",
            title: "Examine international market-entry methods",
            subObjectives: [
              "Non-equity modes: Exporting, Turnkey Projects, Licensing, Franchising, Management Contract, Contract Manufacturing",
              "Equity-based modes: Wholly Owned Subsidiary, Joint Venture, Strategic Alliances",
              "Compare non-equity and equity-based modes"
            ],
          ),
        ],
        exercises: [
          Exercise(
            id: 5,
            question: "Which entry mode involves the highest level of control but also the highest risk?",
            options: [
              "Licensing",
              "Joint Venture",
              "Wholly Owned Subsidiary",
              "Franchising"
            ],
            correctAnswer: 2,
            type: ExerciseType.multipleChoice,
            explanation: "Wholly owned subsidiaries provide maximum control but require the highest investment and carry the most risk.",
          ),
        ],
      ),
      Chapter(
        id: 5,
        title: "THE CULTURE ENVIRONMENT",
        description: "Understand cultural factors and their impact on international business",
        pdfPath: "assets/pdfs/chapter5.pdf",
        objectives: [
          LearningObjective(
            code: "5.1",
            title: "Discuss foundation concepts of culture",
            subObjectives: [
              "Concept of culture",
              "Elements: Aesthetics, Religion, Material Culture, Language, Social Organization, Manners and customs",
              "Overcoming cultural challenges: Cultural risk, Cultural Awareness, Compatible Resources Deployment",
              "Culture affects business functions: Marketing, HR, Production, Accounting/finance, Leadership styles",
              "Culture differences in 5 continents: Asia (China), America (USA), Europe (France), Africa (Nigeria), Australia"
            ],
          ),
          LearningObjective(
            code: "5.2",
            title: "Clarify Hofstede Cultural Dimensions",
            subObjectives: [
              "Five dimensions: Individualism-Collectivism, Power Distance, Uncertainty Avoidance, Masculinity-Femininity, Long-term orientation"
            ],
          ),
        ],
        exercises: [
          Exercise(
            id: 6,
            question: "According to Hofstede, which dimension measures how much a society accepts unequal power distribution?",
            options: [
              "Individualism-Collectivism",
              "Power Distance",
              "Uncertainty Avoidance",
              "Masculinity-Femininity"
            ],
            correctAnswer: 1,
            type: ExerciseType.multipleChoice,
            explanation: "Power Distance measures the extent to which less powerful members of society accept unequal power distribution.",
          ),
        ],
      ),
    ];
  }
}
