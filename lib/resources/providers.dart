import 'package:calori_fit/models/Workout.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../models/User.dart';

class Providers extends ChangeNotifier{
  final AuthMethods _amo = AuthMethods();
  User? _user;
  List<Workout>? _workouts; 

  User get getUser => _user!;

  List<Workout> get getWorkouts => _workouts!;

  set setGender (Genders gender) {
    _user!.gender = gender;
    notifyListeners();
  }

  set setAge (int age){
    _user!.age = age;
    notifyListeners();
  }

  set setWeight (int weight){
    _user!.weight = weight;
    notifyListeners();
  }

  set setHeight (int height){
    _user!.height = height;
    notifyListeners();
  }

  set setCalorieGoal(int calorieGoal){
    _user!.calorieGoal = calorieGoal;
    notifyListeners();
  }

  set setPhotoURL(String photoURL){
    _user!.photoURL = photoURL;
    notifyListeners();
  }

  set setName(String name){
    _user!.name = name;
    notifyListeners();
  }

  set setEmail(String email){
    _user!.email = email;
    notifyListeners();
  }

  void addMeal(Meal meal){
    _user!.meals.add(meal);
    notifyListeners();
  }

  set setWeeklyCals(List<int> weeklyCalories){
    _user!.weeklyCalories = weeklyCalories;
    notifyListeners();
  }

  void addWorkout(String id, int mins){
    _user!.workouts.update(
      id,
      (value) => value + mins,
      ifAbsent: () => mins
    );
    notifyListeners();
  }

  Future<void> refreshUser() async{
    User user = await _amo.getUserDetails();
    _user = user;
    notifyListeners();
  }

  Future<void> initWorkouts() async{
    List<Workout> workouts = await _amo.getWorkouts();
    _workouts = workouts;
    notifyListeners();
  }
}