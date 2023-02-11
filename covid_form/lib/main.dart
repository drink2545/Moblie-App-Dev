import 'package:flutter/material.dart';

void main() {
  runApp(const CovidForm());
}

class CovidForm extends StatelessWidget {
  const CovidForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _conFirst = TextEditingController();
  final TextEditingController _conLast = TextEditingController();
  final TextEditingController _conNick = TextEditingController();
  final TextEditingController _conAge = TextEditingController();
  final TextEditingController _conDay = TextEditingController();

  String? firstname;
  String? lastname;
  String? nickname;
  String? gender;
  int? age;
  int? day;

  String? selectedGender;

  final List<bool> _isOptions = [false, false, false, false, false];

  List<String> selectedOptions = [];
  List<String> symtopms_list = [
    'ไอ',
    'เจ็บคอ',
    'ไข้',
    'เสมหะ',
    'ใกล้ชิดผู้ติดเชื้อ'
  ];
  void _onRadioButtonChange(String? value) {
    setState(() {
      selectedGender = value;
    });
  }
// generate checkbox
  Widget symtopmsCheckbox(
    String key,
    String title,
    bool options,
    void Function(bool?) onChanged,
  ) {
    return CheckboxListTile(
      key: Key(key),
      title: Text(title),
      value: options,
      onChanged: onChanged,
    );
  }
// check the symtom (checkmark)
  void _onCheckboxChange(bool? value, String option, int options) {
    if (value == null) return;
    setState(() {
      _isOptions[options] = value;
      if (_isOptions[options]) {
        selectedOptions.add(option);
      } else {
        selectedOptions.remove(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("form-page-tag"), // added key t
      appBar: AppBar(
        title: Text('กรอกประวัติคนไข้'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: Key("firstname-tag"),
                  decoration: InputDecoration(
                    labelText: 'ชื่อ',
                  ),
                  controller: _conFirst,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    String? message;
                    if (value == null || value.isEmpty) {
                      message = 'ต้องการข้อมูล';
                    }
                    return message;
                  },
                  onSaved: (value) => setState(() {
                    firstname = value;
                  }),
                ),
                TextFormField(
                  key: Key("lastname-tag"),
                  decoration: InputDecoration(
                    labelText: 'นามสกุล',
                  ),
                  controller: _conLast,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    String? message;
                    if (value == null || value.isEmpty) {
                      message = 'ต้องการข้อมูล';
                    }
                    return message;
                  },
                  onSaved: (value) => setState(() {
                    lastname = value;
                  }),
                ),
                TextFormField(
                  key: Key("nickname-tag"),
                  decoration: InputDecoration(
                    labelText: 'ชื่อเล่น',
                  ),
                  controller: _conNick,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    String? message;
                    if (value == null || value.isEmpty) {
                      message = 'ต้องการข้อมูล';
                    }
                    return message;
                  },
                  onSaved: (value) => setState(() {
                    nickname = value;
                  }),
                ),
                TextFormField(
                  key: Key("age-tag"),
                  decoration: InputDecoration(
                    labelText: 'อายุ',
                  ),
                  controller: _conAge,
                  keyboardType: TextInputType.number,
                  onSaved: (String? value) => setState(() {
                    age = int.parse(value!);
                  }),
                ),
                TextFormField(
                  key: Key("days-tag"),
                  decoration: InputDecoration(
                    labelText: 'จำนวนวันที่มีอาการ',
                  ),
                  controller: _conDay,
                  keyboardType: TextInputType.number,
                  onSaved: (String? value) => setState(() {
                    day = int.parse(value!);
                  }),
                ),
                Text('เพศ'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ชาย'),
                    Radio(
                      key: Key('male-tag'),
                      value: 'ชาย/Male',
                      groupValue: selectedGender,
                      onChanged: (String? value) => _onRadioButtonChange(value),
                    ),
                    Text('หญิง'),
                    Radio(
                      key: Key('female-tag'),
                      value: 'หญิง/Female',
                      groupValue: selectedGender,
                      onChanged: (String? value) => _onRadioButtonChange(value),
                    ),
                    Text('ไม่ระบุ'),
                    Radio(
                      key: Key('none-tag'),
                      value: 'ไม่ระบุ/None',
                      groupValue: selectedGender,
                      onChanged: (String? value) => _onRadioButtonChange(value),
                    ),
                  ],
                ),
                Text('อาการ'),
                Column(
                  children: [
                    // generate checkbox
                    for (var i = 0; i < _isOptions.length; i++)
                      symtopmsCheckbox(
                          'syntom-$i-tag',
                          symtopms_list[i],
                          _isOptions[i],
                          (bool? value) =>
                              _onCheckboxChange(value, symtopms_list[i], i))
                  ],
                ),
                ElevatedButton(
                  key: Key('save-button-tag'),
                  onPressed: () {
                    // reset input
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      gender = selectedGender;
                      selectedGender = null;
                      _conFirst.clear();
                      _conLast.clear();
                      _conNick.clear();
                      _conAge.clear();
                      _conDay.clear();
                      for (var i = 0; i < _isOptions.length; i++) {
                        _isOptions[i] = false;
                      }
                      // go to result page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReportPage(
                            firstname: firstname,
                            lastname: lastname,
                            nickname: nickname,
                            gender: gender,
                            age: age,
                            day: day,
                            symtopms: selectedOptions,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('บันทึกข้อมูล'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  final String? firstname;
  final String? lastname;
  final String? nickname;
  final String? gender;
  final int? age;
  final int? day;
  final List<String>? symtopms;

  ReportPage({
    this.firstname,
    this.lastname,
    this.nickname,
    this.gender,
    this.symtopms,
    this.age,
    this.day,
  });

  @override
  Widget build(BuildContext context) {
    print(symtopms);
    return Scaffold(
      key: Key("report-page-tag"),
      appBar: AppBar(
        title: Text('รายงาน'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo_v1.png',
              key: Key('covid-image-tag'),
              width: 300,
              height: 300,
            ),
            covidDetect(symtopms ?? []),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('confirm-button-tag'),
        onPressed: () => Navigator.pop(context),
        child: Text('ยืนยัน'),
      ),
    );
  }

  Widget covidDetect(List<String> symtopms) {
    return Container(
      width: 300,
      height: 300,
      child: Center(
        child: Column(
          children: [
            Text(
              'คุณ $firstname $lastname ($nickname)',
              key: Key('report-fullname-tag'),
              textAlign: TextAlign.center,
            ),
            Text(
              'อายุ $age',
              key: Key('report-age-tag'),
              textAlign: TextAlign.center,
            ),
            Text(
              'เพศ $gender',
              key: Key('report-gender-tag'),
              textAlign: TextAlign.center,
            ),
            Text(
              symtopms.length >= 3 ? 'คุณเป็นโควิท' : 'คุณไม่เป็นโควิท',
              key: Key('covid-confirm-tag'),
            )
          ],
        ),
      ),
    );
  }
}
