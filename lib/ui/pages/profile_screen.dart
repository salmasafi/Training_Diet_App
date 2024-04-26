import 'package:flutter/material.dart';
import '../../model/meal.dart';
import 'meal_detail_screen.dart';
import 'workout_screen.dart';
import 'package:intl/intl.dart' as intl;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFF200087),
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home, color: Colors.white),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 40, left: 32, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        intl.DateFormat('EEEE, d MMMM').format(today),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: const Text(
                        "Hello, David",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(child: Image.asset("assets/user.jpg")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: width * 0.4,
                          height: width * 0.4,
                          progress: 0.7,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                              ingredient: "Protein",
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.28,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _IngredientProgress(
                              ingredient: "Carbs",
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * 0.28,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _IngredientProgress(
                              ingredient: "Fat",
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount: 61,
                              width: width * 0.28,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: SizedBox(
              height: height * 0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: 32,
                      right: 16,
                    ),
                    child: Text(
                      "MEALS FOR TODAY",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            _MealCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WorkoutScreen()),
    );
  },
  child: Container(
    margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF20008B),
          Color(0xFF200087),
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: 20),
        const Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16),
          child:  Text(
            "YOUR NEXT WORKOUT",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4.0, left: 16),
          child: Text(
            "Upper Body",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              const SizedBox(width: 20),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color(0xFF5B4D9D),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "assets/chest.png",
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color(0xFF5B4D9D),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "assets/back.png",
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color(0xFF5B4D9D),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "assets/biceps.png",
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    ),
  ),
),
),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progressColor,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress(
      {required this.height, required this.width, required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.7,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
void paint(Canvas canvas, Size size) {
  Paint paint = Paint()
    ..strokeWidth = 10
    ..color = const Color(0xFF200087)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  Offset center = Offset(size.width / 2, size.height / 2);
  double relativeProgress = 360 * progress;

  canvas.drawArc(
    Rect.fromCircle(center: center, radius: size.width / 2),
    -90 * 22/7 / 180, 
    -relativeProgress * 22/7 / 180, 
    false,
    paint,
  );
}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealDetailScreen(meal: meal),
                    ),
                  );
                },
                child: Hero(
                  tag: meal,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      meal.imagePath,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
