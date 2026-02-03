class AlarmModel {
  String time;
  String date;
  bool isActive;

  AlarmModel({required this.time, required this.date, this.isActive = true});

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
    time: json['time'],
    date: json['date'],
    isActive: json['isActive'],
  );

  Map<String, dynamic> toJson() => {
    'time': time,
    'date': date,
    'isActive': isActive,
  };
}
