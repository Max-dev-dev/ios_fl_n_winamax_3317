import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Athlete {
  final String name;
  final String country;
  final String flag;
  final String position;
  final String quote;
  final String bio;
  final String training;
  final String nutrition;
  final String insights;
  final String category;

  Athlete({
    required this.name,
    required this.country,
    required this.flag,
    required this.position,
    required this.quote,
    required this.bio,
    required this.training,
    required this.nutrition,
    required this.insights,
    required this.category,
  });
}

final List<Athlete> allAthletes = [
  Athlete(
    name: "Oleh Savchuk",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Central Midfielder",
    quote: "Work in silence — let the game speak.",
    bio:
        "A calm and composed playmaker, Oleh dictates tempo with intelligent passes and strategic movement.",
    training:
        "Short-pass drills, spatial awareness exercises, and pressure scenarios.",
    nutrition:
        "Buckwheat, eggs, fermented vegetables, isotonic drinks pre-match.",
    insights: "Analyzes pass success rates and heat maps after each match.",
    category: "Soccer",
  ),
  Athlete(
    name: "Taras Melnyk",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Right Winger",
    quote: "Speed opens every door.",
    bio:
        "Known for his explosive pace and sudden cuts, Taras terrorizes defenses with one-on-one flair.",
    training:
        "Sprint intervals, agility ladder drills, and crossing under pressure.",
    nutrition: "Chicken breast, fruit smoothies, hydration tablets.",
    insights: "Uses GPS data to track max speed and sprints per half.",
    category: "Soccer",
  ),
  Athlete(
    name: "Bohdan Korol",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Defender",
    quote: "Discipline wins battles.",
    bio:
        "A tactical wall in defense, Bohdan thrives on interceptions and clean tackles.",
    training: "1v1 defense, positioning drills, aerial duel practice.",
    nutrition: "Oats, lean beef, beetroot salad, and lots of water.",
    insights: "Maintains a log of fouls, clearances, and defensive errors.",
    category: "Soccer",
  ),

  // Hockey
  Athlete(
    name: "Danylo Koval",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Defenseman",
    quote: "Hit with control, defend with honor.",
    bio:
        "A powerful skater and physical defender, Danylo anchors his team’s back line.",
    training: "Body-check practice, blue line skating, situational scrimmages.",
    nutrition: "Root vegetable stews, rye bread, hydration-focused regimen.",
    insights: "Rates shifts based on efficiency and hits avoided or delivered.",
    category: "Hockey",
  ),
  Athlete(
    name: "Maksym Levchenko",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Goaltender",
    quote: "I stop more than pucks — I stop momentum.",
    bio:
        "Focused and precise, Maksym is a psychological wall in clutch moments.",
    training:
        "Glove reaction training, lateral movement, eye-hand coordination.",
    nutrition: "Light proteins, berries, no heavy meals on game day.",
    insights: "Tracks glove save ratio and recovery time between shifts.",
    category: "Hockey",
  ),
  Athlete(
    name: "Andriy Hnativ",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Left Wing",
    quote: "Strike fast. Think faster.",
    bio:
        "Quick off the mark, Andriy combines technical shots with creative routes to goal.",
    training: "Shooting from angles, puck control, speed bursts on ice.",
    nutrition: "Baked fish, herbal teas, flax and chia seeds.",
    insights: "Logs missed opportunities and decision quality post-match.",
    category: "Hockey",
  ),

  // Basketball
  Athlete(
    name: "Artem Ivanenko",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Point Guard",
    quote: "Basketball is chess with sneakers.",
    bio:
        "A natural leader with elite court vision, Artem controls the game with calm under pressure.",
    training:
        "Pick and roll reps, defensive anticipation, and rhythm shooting.",
    nutrition: "Oatmeal, bananas, grilled chicken, green tea.",
    insights: "Tracks assist-to-turnover ratio and game pace management.",
    category: "Basketball",
  ),
  Athlete(
    name: "Denys Hordiienko",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Shooting Guard",
    quote: "Confidence shoots before I do.",
    bio:
        "A sharp shooter with range and rhythm, Denys thrives under shot clocks and pressure.",
    training:
        "Catch-and-shoot drills, contested 3-pointers, mental timing routines.",
    nutrition: "Sweet potatoes, sunflower seeds, hydration gummies.",
    insights: "Records shot charts and fatigue vs. accuracy data.",
    category: "Basketball",
  ),
  Athlete(
    name: "Volodymyr Tkachenko",
    country: "Ukraine",
    flag: "🇺🇦",
    position: "Power Forward",
    quote: "Strength meets patience in the paint.",
    bio:
        "A dominant presence down low, Volodymyr excels in rebounds, screens, and physical defense.",
    training: "Low-post footwork, box-out battles, explosive leg strength.",
    nutrition: "Protein shakes with honey, cottage cheese, and beet juice.",
    insights: "Monitors screen efficiency and second-chance point creation.",
    category: "Basketball",
  ),
  Athlete(
    name: "Marco Villar",
    country: "Spain",
    flag: "🇪🇸",
    position: "Attacking Midfielder",
    quote: "Creativity is the soul of football",
    bio:
        "Known for his vision and passing accuracy, Marco leads his national team’s midfield with elegance and calm.",
    training:
        "Technical drills, weighted passing sessions, and off-ball movement simulations.",
    nutrition:
        "Mediterranean-based meals with fish, couscous, and beetroot juice before matches.",
    insights:
        "Journals match events; uses treadmill reflections to mentally revisit games.",
    category: "Soccer",
  ),
  Athlete(
    name: "Jamal Bayo",
    country: "Nigeria",
    flag: "🇳🇬",
    position: "Central Defender",
    quote: "No ball passes me without a price.",
    bio:
        "A fearless defender with a tactical brain, Jamal balances aggression with timing.",
    training:
        "Strength circuits, tackling simulations, and zone-awareness drills.",
    nutrition: "High-protein meals, yam-based carbs, and hydration monitoring.",
    insights:
        "Tracks opponent patterns post-match to prepare better for rematches.",
    category: "Soccer",
  ),
  Athlete(
    name: "Léo Fontaine",
    country: "France",
    flag: "🇫🇷",
    position: "Left Winger",
    quote: "Speed is my language.",
    bio:
        "Blazing fast and precise on the wing, Léo turns defense into attack in seconds.",
    training: "Sprint work, reaction drills, and 1v1 breakaway scenarios.",
    nutrition:
        "Pre-match carbs (pasta, fruit), post-match recovery smoothies with whey + berries.",
    insights:
        "Uses mental cue cards to rehearse movement options under pressure.",
    category: "Soccer",
  ),
  Athlete(
    name: "Carlos Menendez",
    country: "Argentina",
    flag: "🇦🇷",
    position: "Striker",
    quote: "Every shot is a story.",
    bio:
        "Carlos is known for his instinctual positioning and powerful finishes under pressure.",
    training:
        "Finishing drills, positioning games, off-the-ball movement analysis.",
    nutrition: "Protein shakes, grilled meats, and avocado-based breakfasts.",
    insights: "Visualizes game situations and maintains a confidence log.",
    category: "Soccer",
  ),
  Athlete(
    name: "Erik Johansen",
    country: "Sweden",
    flag: "🇸🇪",
    position: "Defenseman",
    quote: "Hit clean. Skate smart. Lead always.",
    bio: "Calm, reliable, and fierce at the blue line; a locker room leader.",
    training: "Power sleds, heavy lifting, and on-ice transitions.",
    nutrition: "Wild salmon, turmeric smoothies, omega-3 focus.",
    insights: "Rates post-game aggression and awareness for self-adjustment.",
    category: "Hockey",
  ),
  Athlete(
    name: "Matti Saarinen",
    country: "Finland",
    flag: "🇫🇮",
    position: "Goaltender",
    quote: "One save at a time.",
    bio:
        "Known for his reflexes and game-reading ability, Matti is a clutch performer.",
    training: "Reaction ladders, glove drills, mental focus simulations.",
    nutrition:
        "Light, anti-inflammatory meals on game day; heavy on hydration and timing.",
    insights:
        "Meditates before games, logs glove save percentages for tracking form.",
    category: "Hockey",
  ),
  Athlete(
    name: "Lena Bergström",
    country: "Norway",
    flag: "🇳🇴",
    position: "Forward",
    quote: "Skate like wind, strike like thunder.",
    bio:
        "Lena blends speed with tactical finesse, leading the line with relentless drive.",
    training:
        "Agility sprints, shooting accuracy on ice, explosive strength circuits.",
    nutrition: "Seafood-based diet, berries, electrolytes post-practice.",
    insights: "Reviews play footage with handwritten notes.",
    category: "Hockey",
  ),
  Athlete(
    name: "Derrick “Airline” Jones",
    country: "USA",
    flag: "🇺🇸",
    position: "Shooting Guard",
    quote: "Hang time isn’t magic — it’s mechanics.",
    bio:
        "High flyer and end-game finisher, Derrick brings intensity and precision.",
    training: "Vertical drills, mid-range reps, mental rehearsal.",
    nutrition:
        "Carb-rich mornings, plant-based recovery meals, low red meat during season.",
    insights: "Tracks shot accuracy per zone and emotional state correlations.",
    category: "Basketball",
  ),
  Athlete(
    name: "Takumi Ishida",
    country: "Japan",
    flag: "🇯🇵",
    position: "Point Guard",
    quote: "I run the rhythm.",
    bio:
        "A master of pace and playmaking, Takumi blends calm with explosiveness.",
    training:
        "Footwork ladders, vision training, and ball distribution drills.",
    nutrition: "Rice and protein-based diet with matcha tea for focus.",
    insights: "Notes assist-to-turnover ratio and focus levels before games.",
    category: "Basketball",
  ),
  Athlete(
    name: "Malik Udebe",
    country: "Canada",
    flag: "🇨🇦",
    position: "Power Forward",
    quote: "Control the paint, control the game.",
    bio:
        "Physical, intelligent, and tactically sharp — Malik dominates in close range.",
    training:
        "Plyometrics, rebounding battles, and shoulder strength training.",
    nutrition:
        "Creatine cycles, high-calorie clean bulking phases, lots of greens.",
    insights: "Logs rebounding intensity and tracks strength output in cycles.",
    category: "Basketball",
  ),
  Athlete(
    name: "Jaylen Rivers",
    country: "Australia",
    flag: "🇦🇺",
    position: "Center",
    quote: "Balance beats brute force.",
    bio:
        "A smart and agile big man, Jaylen dominates the paint with calculated aggression.",
    training: "Core stability, post moves, defensive slide routines.",
    nutrition: "Oats, lean proteins, anti-inflammatory smoothies.",
    insights: "Monitors sleep cycles and recovery score with wearable tech.",
    category: "Basketball",
  ),
  Athlete(
    name: "Rúben Silva",
    country: "Portugal",
    flag: "🇵🇹",
    position: "Right Back",
    quote: "Defend smart. Attack smarter.",
    bio:
        "Combines tireless runs with pinpoint crosses, a modern fullback model.",
    training:
        "Endurance circuits, crossing under pressure, and sprint-recovery intervals.",
    nutrition: "Lean meats, legumes, and citrus-based recovery blends.",
    insights: "Tracks distance covered per game and crossing success rate.",
    category: "Soccer",
  ),
  Athlete(
    name: "Noah Becker",
    country: "Germany",
    flag: "🇩🇪",
    position: "Center",
    quote: "Vision creates opportunity.",
    bio:
        "Strategic playmaker with a killer face-off record and on-ice leadership.",
    training:
        "Puck control drills, lateral speed training, play breakdown studies.",
    nutrition: "Whole grain pastas, lean poultry, beet and ginger shots.",
    insights: "Analyzes face-off win patterns and pre-game mindset notes.",
    category: "Hockey",
  ),
  Athlete(
    name: "Jakub Novak",
    country: "Czech Republic",
    flag: "🇨🇿",
    position: "Right Wing",
    quote: "Strike when they least expect it.",
    bio:
        "Sharp shooter with a flair for dramatic goals and last-minute assists.",
    training:
        "Wrist shot mechanics, agility ladders, cold-resistance stamina drills.",
    nutrition: "Broth-based meals, dried fruits, high protein between shifts.",
    insights: "Reviews shot angles using VR simulations post-game.",
    category: "Hockey",
  ),
  Athlete(
    name: "Emeka Nwosu",
    country: "Nigeria",
    flag: "🇳🇬",
    position: "Small Forward",
    quote: "Create space. Create chances.",
    bio: "Versatile scorer with elite defensive reads and court IQ.",
    training:
        "Crossover isolations, defensive stance holds, 3PT drills under fatigue.",
    nutrition: "Cassava-based meals, nuts, plant-based proteins.",
    insights: "Logs on/off ball movement effectiveness and matchup outcomes.",
    category: "Basketball",
  ),
  Athlete(
    name: "Felix Laurent",
    country: "Belgium",
    flag: "🇧🇪",
    position: "Shooting Guard",
    quote: "Confidence is a rhythm — I shoot it.",
    bio: "Catch-and-shoot master with cool nerves in clutch moments.",
    training:
        "Quick release reps, mental visualization of buzzer scenarios, shooting under time constraint.",
    nutrition:
        "Sweet potatoes, almond protein bars, and no caffeine on game day.",
    insights: "Records mental prep routines tied to shooting streaks.",
    category: "Basketball",
  ),
];

class AthletesScreen extends StatefulWidget {
  const AthletesScreen({super.key});

  @override
  State<AthletesScreen> createState() => _AthletesScreenState();
}

class _AthletesScreenState extends State<AthletesScreen> {
  String selectedCategory = 'Soccer';

  String _getSportEmoji(String category) {
    switch (category) {
      case 'Soccer':
        return '⚽️';
      case 'Hockey':
        return '🏒';
      case 'Basketball':
        return '🏀';
      default:
        return '🎯';
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered =
        allAthletes
            .where((athlete) => athlete.category == selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'ATHLETES',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
          children: [
            Row(
              children:
                  ['Soccer', 'Hockey', 'Basketball'].map((sport) {
                    final isSelected = selectedCategory == sport;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(sport),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() => selectedCategory = sport);
                        },
                        selectedColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                        ),
                        backgroundColor: Colors.grey.shade800,
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final isLast = index == filtered.length - 1;
                  final athlete = filtered[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AthleteDetailScreen(athlete: athlete),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: isLast ? 120 : 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  athlete.name.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Country: ${athlete.country} ${athlete.flag}",
                                  style: const TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Position: ${athlete.position}",
                                  style: const TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _getSportEmoji(athlete.category),
                            style: const TextStyle(fontSize: 60),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AthleteDetailScreen extends StatelessWidget {
  final Athlete athlete;

  const AthleteDetailScreen({super.key, required this.athlete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with Share and Close
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Share.share(
                        "${athlete.name} – ${athlete.quote}\n\n${athlete.bio}",
                      );
                    },
                    label: const Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: const Color(0xFF2A2A2A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                athlete.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Country: ${athlete.country} ${athlete.flag}",
                style: const TextStyle(color: Color(0xFF929292), fontSize: 16),
              ),
              Text(
                "Position: ${athlete.position}",
                style: const TextStyle(color: Color(0xFF929292), fontSize: 16),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  athlete.quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildSection("Biography", athlete.bio),
              _buildSection("Training Style", athlete.training),
              _buildSection("Nutrition", athlete.nutrition),
              _buildSection("Insights", athlete.insights),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: content,
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
