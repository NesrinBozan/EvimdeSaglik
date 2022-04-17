class OnboardingModel {
  String image;
  String text;
  String title;

  OnboardingModel({required this.image, required this.text, required this.title});
  static List<OnboardingModel> list = [
    OnboardingModel(
        image: "images/user_app_logo.jpg",
        title: "",
        text:
        "Evimde Sağlık ile siz hastaneye gitmeyin hastane size gelsin!"),
    OnboardingModel(
        image: "images/doctor3.png",
        title: "",
        text:
        "Evimde Sağlık ile evde sağlık hizmetlerine uzman hemşireler ile ulaşın!"),
    OnboardingModel(
        image: "images/doctorambulance4.jpg",
        title: "",
        text:
        "İstediğiniz her yerde, dilediğiniz zaman pcr testi, serum desteği, laboratuvar hizmetleri...")
  ];
}