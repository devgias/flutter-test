import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_gias/models/userDetailModel.dart';
import 'package:flutter_test_gias/models/userFormData.dart';

import '../helpers/testData.dart';

void main() {
  group('UserDetailModel.fromJson', () {
    test('maps name, email, and company from the response', () {
      final detail = UserDetailModel.fromJson({
        ...buildUserJson(),
        'name': 'Tom Preston-Werner',
        'email': 'tom@example.com',
        'company': '@chatterbugapp',
      });

      expect(detail.login, 'mojombo');
      expect(detail.name, 'Tom Preston-Werner');
      expect(detail.email, 'tom@example.com');
      expect(detail.company, '@chatterbugapp');
    });

    test('keeps name, email, and company null when GitHub returns null', () {
      final detail = UserDetailModel.fromJson({
        ...buildUserJson(),
        'name': null,
        'email': null,
        'company': null,
      });

      expect(detail.name, isNull);
      expect(detail.email, isNull);
      expect(detail.company, isNull);
    });
  });

  group('UserFormData.fromDetail', () {
    test('copies the detail values into the form data', () {
      final formData = UserFormData.fromDetail(buildUserDetail());

      expect(formData.name, 'Tom Preston-Werner');
      expect(formData.email, 'tom@example.com');
      expect(formData.company, '@chatterbugapp');
    });

    test('converts null values into empty strings', () {
      final formData = UserFormData.fromDetail(
        buildUserDetail(name: null, email: null, company: null),
      );

      expect(formData.name, isEmpty);
      expect(formData.email, isEmpty);
      expect(formData.company, isEmpty);
    });
  });
}