import 'package:drift/drift.dart';

class Schedules extends Table {
  // PK
  IntColumn get id => integer().autoIncrement()();

  // 내용
  TextColumn get content => text()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  // 시작 시간
  IntColumn get startTime => integer()();

  // 끝 시간
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();

  // 생성 날짜
  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
