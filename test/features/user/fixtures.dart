import 'package:flutter_test_quiz/features/user/user.dart';

const tUser = UserEntity(
  id: 1,
  login: 'mojombo',
  avatarUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
  type: 'User',
);

const tUserDetail = UserDetailEntity(
  id: 1,
  login: 'mojombo',
  avatarUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
  type: 'User',
  name: 'Tom Preston-Werner',
  company: 'chatterbug',
);

const tForm = UserFormEntity(
  name: '  John Doe ',
  email: ' John@Mail.COM ',
  company: '  ',
);

const tNormalizedForm = UserFormEntity(name: 'John Doe', email: 'john@mail.com');
