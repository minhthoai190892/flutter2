// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {}

abstract class Database {
  void saveUser(User user);
  // ...
}

class MySQLDatabase implements Database {
  @override
  void saveUser(User user) {
    print('Save ${user} to MySQL database ...');
    // actual implementation...
  }
}

class PostgreSQLDatabase implements Database {
  @override
  void saveUser(User user) {
    print('Save ${user} to PostgreSQL Database ...');
    // actual implementation...
  }
}

class UserService {
  Database database;
  UserService({
    required this.database,
  });
  void saveUser(User user) {
    database.saveUser(user);
  }
}
