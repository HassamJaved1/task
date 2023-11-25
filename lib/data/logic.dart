class MainLogic {
  double heightInMeter = 0.0;
  double weightInKg = 0.0;

  void convertHeightToMeters({required double feet, required double inches}) {
// First we will convert all our height to a single value i.e inches

    double heightInInches = (feet * 12) + inches;
//Now we will convert the height to meters

    heightInMeter = heightInInches * 0.0254;
  }

  void convertWeightToKg({required lbs}) {
    weightInKg = lbs * 0.45359237;
  }
}
