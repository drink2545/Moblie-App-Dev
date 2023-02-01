double conventToFahrenheit(double celsius){
  double Fahrenheit = (9/5)*celsius+32;
  return Fahrenheit;
}
void printTemperatureTable(){
  print('_'*27 + '\n|  Celsius   | Fahrenheit |');
  for(int i=0;i<101;i+=10){
    int Cdigit = i.toString().length;
    var F = (conventToFahrenheit(i.toDouble())).toStringAsFixed(1);
    int Fdigit = F.length;
    print('|'+' '*(7-Cdigit)+'$i'+' '*5+'|'+' '*(9-Fdigit)+'$F'+' '*3+'|');
  }
  print('‾'*27);
}
void main(List<String> args) {
  printTemperatureTable();
}