import 'package:coursor_tiktok/domain/models/course_test_model.dart';

import 'domain/enums/test_answer_type_enum.dart';
import 'domain/enums/user_type.dart';
import 'domain/models/correct_answer.dart';
import 'domain/models/course_test_question_model.dart';
import 'domain/models/notification_model.dart';
import 'domain/models/user_model.dart';

final List<NotificationModel> testNotificationsList = [
  NotificationModel(
    id: 1,
    title: 'Уведомление 1',
    description: 'Описание уведомления 1',
    dateTime: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NotificationModel(
    id: 2,
    title: 'Уведомление 2',
    dateTime: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NotificationModel(
    id: 3,
    title: 'Уведомление 3',
    description: 'Описание уведомления 3',
    dateTime: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  NotificationModel(
    id: 4,
    title: 'Уведомление 4',
    dateTime: DateTime.now().subtract(const Duration(hours: 4)),
    read: true,
  ),
  NotificationModel(
    id: 5,
    title: 'Уведомление 5',
    description: 'Описание уведомления 5',
    dateTime: DateTime.now().subtract(const Duration(hours: 5)),
    read: true,
  ),
  NotificationModel(
    id: 6,
    title: 'Уведомление 6',
    description: 'Описание уведомления 6',
    dateTime: DateTime.now().subtract(const Duration(hours: 6)),
    read: true,
  ),
];

Test testTest = Test(
  id: 1,
  questions: [
    TestQuestion(
      id: 1,
      headerText: 'Вопрос 1',
      questionText: 'Множественный выбор',
      answerType: TestAnswerType.multipleChouseAnswer,
      answers: ['Ответ 1', 'Ответ 2', 'Ответ 3'],
      correctAnswerIndices: ChoiceAnswer([0, 1]),
    ),
    TestQuestion(
      id: 2,
      headerText: 'Вопрос 2',
      questionText: 'Одиночный выбор',
      answerType: TestAnswerType.singleChouseAnswer,
      answers: ['Ответ 1', 'Ответ 2', 'Ответ 3'],
      correctAnswerIndices: ChoiceAnswer([0]),
    ),
    TestQuestion(
      id: 3,
      headerText: 'Вопрос 3',
      questionText: 'Текстовый ответ',
      answerType: TestAnswerType.textAnswer,
      answers: ['Ответ 1', 'Ответ 2', 'Ответ 3'],
      correctAnswerIndices: TextAnswer(['Ответ 1', 'Ответ 2']),
    ),
  ],
  description: 'Тест описание',
  title: 'Тест заголовок',
  farewell: 'Спасибо за прохождение теста',
);


final testRegisterStudet = RegisterUser(
  email: 'test@test',
  password: '123123123',
  userName: 'test',
  phoneNumber: '123123123',
  userType: UserType.students,
);

final testRegisterTeacher = RegisterUser(
  email: 'test@test',
  password: '123123123',
  userName: 'test',
  phoneNumber: '123123123',
  userType: UserType.teachers,
);

final testRegisterModerator = RegisterUser(
  email: 'test@test',
  password: '123123123',
  userName: 'test',
  phoneNumber: '123123123',
  userType: UserType.moderators,
);
