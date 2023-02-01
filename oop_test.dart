class Car{
  String color;
  int wheels;
  String model;
  Car(this.color, this.wheels, this.model);
}

class Tesla extends Car{
  num speed;
  Tesla(super.color, super.wheels, super.model, this.speed);
}

void main(List<String> args) {
  Car carA = Car('red',4,'x');
  print(carA.color);
  Tesla carB = Tesla('blue', 4, 'Z', 157);
  print(carB.speed);
}