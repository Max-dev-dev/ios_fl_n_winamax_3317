import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Article {
  final String title;
  final String hashtags;
  final String content;

  const Article({
    required this.title,
    required this.hashtags,
    required this.content,
  });
}

final List<Article> articles = [
  Article(
    title: "THE MENTAL REPS MATTER TOO – HOW ATHLETES TRAIN THEIR MINDS",
    hashtags:
        "#MentalStrength #AthleteMindset #FocusTraining #SportsPsychology #DisciplineWins",
    content:
        """When we think about elite athletes, our focus usually goes straight to their physical achievements — the records broken, the strength built, the speed unlocked. But ask any world-class competitor, and they'll tell you something surprising: the mind is just as much a training ground as the gym.
Mental training in sports isn’t just about visualization before a competition. It’s about learning how to breathe through pressure, how to silence the voice of doubt when a set feels too heavy, and how to keep showing up even when progress feels invisible. For Olympic sprinters, a single moment of distraction can cost everything. For endurance athletes, managing discomfort over time becomes an internal dialogue between "stop now" and "one more step."
What’s fascinating is how universal these principles are. Athletes in vastly different sports — from martial artists to swimmers — often train their mental toughness in similar ways. They journal after training, they reflect on their energy and mindset before a big day, and they develop rituals that ground them. Some athletes even track how they feel emotionally before and after workouts, helping them notice what influences performance beyond reps and recovery.
It’s easy to forget that every moment of doubt overcome, every frustration channeled into action, is its own kind of repetition — a mental rep. And like physical reps, these add up. That resilience becomes part of the athlete’s foundation. So the next time you’re pushing through something challenging, consider this: you’re not just building strength — you’re training the part of you that chooses to continue.""",
  ),
  Article(
    title: "A LOOK INSIDE THE TRAINING ROOM – WHAT HAPPENS BETWEEN THE SETS",
    hashtags:
        "#BetweenTheSets #AthleteRoutine #PerformanceDetails #TrainingAwareness #MicroFocus",
    content:
        """Training rooms have a rhythm of their own. There’s a quiet intensity that hangs in the air between sets — a stillness filled not with rest, but with focus. It's in these moments that some of the most important work happens. The set ends, the bar is re-racked, and a new kind of training begins.
Between sets, elite athletes don’t just scroll their phones or count down the seconds. These moments are opportunities for micro-adjustments — of form, breathing, posture. Coaches often use this time to ask subtle questions: “How did that feel?” “Was that your true max, or did you hold back?” It’s in these brief exchanges that athletes become more aware of their limits, and how to stretch them safely.
More than that, this in-between space is where reflection lives. Athletes may replay the last movement in their mind, or anticipate what’s coming. The breath returns to baseline. Muscles stay alert. Mentally, it’s a rehearsal — another chance to align body and brain before the next effort.
In a world obsessed with "go hard or go home," we often overlook the artistry of rest. But for athletes, these micro-pauses are active. They’re not idling; they’re integrating. Recovery between sets isn’t the opposite of work — it’s a part of it.
So next time you rest, ask yourself: what am I preparing for next? And how can I use this moment to come back even more precise?""",
  ),
  Article(
    title: "FROM FIELD TO FORK – HOW ATHLETES BUILD RELATIONSHIPS WITH FOOD",
    hashtags:
        "#AthleteNutrition #FuelAndFeel #FoodConnection #MindfulEating #PerformanceFuel",
    content:
        """For many athletes, nutrition isn't about rules — it’s about relationships. It's easy to reduce food to numbers: calories, macros, percentages. But step into the kitchens or travel routines of elite performers, and you’ll find something much more human at the center of their nutrition philosophy.
Some athletes build deeply personal rituals around meals. A runner might eat the same oatmeal mix before every race, not because it’s perfect on paper, but because it anchors them. A swimmer might associate a certain smoothie with recovery — not for its ingredients, but for the way it makes them feel after a long session in cold water. For others, cooking itself becomes a decompression ritual — a creative moment in a life structured by discipline.
This doesn’t mean every meal is pristine. In fact, many top athletes speak openly about their love for comfort foods or cultural dishes that connect them to family and identity. The key difference is intention. They know when they’re fueling for performance and when they’re fueling for the soul — and they make space for both.
Over time, food becomes more than a training tool. It’s feedback. How an athlete feels after a meal might inform how they train later that day. They listen — not just to data, but to themselves. That ability to stay tuned in is part of what makes their performance sustainable.
In a world full of conflicting nutrition trends and quick fixes, athletes remind us that performance isn't about perfection. It’s about connection — to your goals, your culture, and your body. And food, when approached with care, becomes one of the most powerful bridges between them.""",
  ),
  Article(
    title: "THE ART OF SHOWING UP – WHY CONSISTENCY BEATS INTENSITY",
    hashtags:
        "#ConsistencyIsKey #TrainEveryDay #ProgressOverPerfection #DisciplineDaily #KeepShowingUp",
    content:
        """We often glorify the hardest workouts — the sweat-drenched, near-collapse sessions that feel like the pinnacle of effort. But if you talk to seasoned athletes, they’ll tell you a quieter truth: intensity may spark progress, but consistency sustains it.
There’s something powerful about simply showing up. Not just on the days when motivation is high or everything feels aligned, but especially on the days when it isn’t. When the weather’s off, the body feels tired, or the schedule is packed — showing up anyway begins to build something deeper than muscle. It builds identity.
Athletes talk about rhythm, routine, and momentum. They know that their greatest strength isn’t a personal best — it’s the system they’ve created to keep improving. Consistency doesn’t mean doing the same thing over and over. It means staying in motion, even when progress is invisible. It’s adapting, recalibrating, and continuing forward.
What’s inspiring is how this principle extends beyond sport. Writers, musicians, scientists — all speak about the magic of small, repeated actions. So in your training, when the big results feel far away, remember: you’re practicing the skill of showing up. And that, over time, might be the most elite move of all.""",
  ),
  Article(
    title: "RECOVERY ISN'T A BREAK – IT'S PART OF THE PLAN",
    hashtags:
        "#RecoveryMatters #RestIsTraining #SmartTraining #AthleteRecovery #TrainAndRecover",
    content:
        """In the culture of grind, rest often feels like weakness. But for athletes, recovery isn’t just allowed — it’s essential. It’s not a pause from training. It is training.
Every time you push your body, you’re creating microscopic damage. The growth, the strength, the speed — it doesn’t happen in the gym. It happens afterward. During the downtime. In the quiet hours when your body rebuilds. Athletes who understand this treat recovery with the same discipline as any workout.
Some use sleep as a superpower, guarding their hours like a secret weapon. Others build active recovery days into their routines, allowing blood flow and movement without added stress. Some pay attention to how their nervous system feels after intense sessions — monitoring heart rate, mood, even sharpness of thought.
But recovery isn’t one-size-fits-all. What restores one person might not restore another. For some, it's movement in nature. For others, music, massage, or time with no structure at all. What matters is the intention — that recovery isn’t random, but strategic.
And perhaps most importantly, recovery isn’t about stepping back. It’s about preparing to move forward, stronger and more aware. In performance, rest isn’t the opposite of progress — it’s its partner.""",
  ),
  Article(
    title: "TRAINING THROUGH PLATEAUS – LESSONS FROM THE FLAT LINE",
    hashtags:
        "#TrainingPlateau #StayTheCourse #AdaptAndGrow #ProgressTakesTime #TrustTheProcess",
    content:
        """Every athlete, at some point, hits it: the plateau. No new gains. No speed increase. No signs of forward motion. It feels like stagnation. It challenges identity. And yet, it might be the most important phase of growth.
Plateaus are nature’s way of asking deeper questions. Are you training smart — or just hard? Are you listening to your body — or forcing a rhythm that no longer fits? Athletes who last — the ones who perform over years, not months — learn how to adapt in these moments.
Some change the environment: new coach, new setting, new challenges. Others double down on fundamentals: better sleep, smarter warmups, reevaluated goals. Still others simply wait — riding the flatline with patience, trusting that adaptation is brewing underneath the surface.
What’s often missed is that during a plateau, the body is consolidating. Strength isn’t just increasing — it’s stabilizing. Technique is becoming second nature. Neural pathways are reinforcing. You might not see the progress yet, but it’s happening — quietly, invisibly, powerfully.
So if you’re in a training lull, remember: this isn’t failure. This is the forge. Stay present. Stay curious. The breakthrough may be one rep away — or one mindset shift. Plateaus don’t stop progress. Sometimes, they prepare it.""",
  ),
];

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Discover. Learn. Stay Inspired.'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final isLast = index == articles.length - 1;
                  final article = articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArticleDetailScreen(article: article),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: isLast ? 100 : 16),
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
                                  article.title.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  article.hashtags,
                                  style: TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
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

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Share.share('${article.title}\n\n${article.content}');
                  },
                  label: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    backgroundColor: const Color(0xFF2A2A2A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
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
              article.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.hashtags,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
