// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppointmentDao? _appointmentsDaoInstance;

  PaymentDao? _paymentDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Appointment` (`id` INTEGER NOT NULL, `ownerName` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `animalName` TEXT NOT NULL, `breed` TEXT NOT NULL, `animalSex` TEXT NOT NULL, `animalWeight` TEXT NOT NULL, `animalAge` TEXT NOT NULL, `appointmentType` TEXT NOT NULL, `location` TEXT NOT NULL, `appointmentStatus` TEXT NOT NULL, `dateTime` INTEGER NOT NULL, `updatePin` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Payment` (`id` INTEGER NOT NULL, `appointmentId` TEXT NOT NULL, `amountPaid` INTEGER NOT NULL, `date` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AppointmentDao get appointmentsDao {
    return _appointmentsDaoInstance ??=
        _$AppointmentDao(database, changeListener);
  }

  @override
  PaymentDao get paymentDao {
    return _paymentDaoInstance ??= _$PaymentDao(database, changeListener);
  }
}

class _$AppointmentDao extends AppointmentDao {
  _$AppointmentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _appointmentInsertionAdapter = InsertionAdapter(
            database,
            'Appointment',
            (Appointment item) => <String, Object?>{
                  'id': item.id,
                  'ownerName': item.ownerName,
                  'phoneNumber': item.phoneNumber,
                  'animalName': item.animalName,
                  'breed': item.breed,
                  'animalSex': item.animalSex,
                  'animalWeight': item.animalWeight,
                  'animalAge': item.animalAge,
                  'appointmentType': item.appointmentType,
                  'location': item.location,
                  'appointmentStatus': item.appointmentStatus,
                  'dateTime': item.dateTime,
                  'updatePin': item.updatePin ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Appointment> _appointmentInsertionAdapter;

  @override
  Future<List<Appointment>> findAllAppointments() async {
    return _queryAdapter.queryList('SELECT * FROM Appointment',
        mapper: (Map<String, Object?> row) => Appointment(
            row['id'] as int,
            row['ownerName'] as String,
            row['phoneNumber'] as String,
            row['animalName'] as String,
            row['breed'] as String,
            row['animalSex'] as String,
            row['animalWeight'] as String,
            row['animalAge'] as String,
            row['appointmentType'] as String,
            row['location'] as String,
            row['appointmentStatus'] as String,
            row['dateTime'] as int,
            (row['updatePin'] as int) != 0));
  }

  @override
  Future<void> insertAppointment(Appointment appointment) async {
    await _appointmentInsertionAdapter.insert(
        appointment, OnConflictStrategy.abort);
  }
}

class _$PaymentDao extends PaymentDao {
  _$PaymentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _paymentInsertionAdapter = InsertionAdapter(
            database,
            'Payment',
            (Payment item) => <String, Object?>{
                  'id': item.id,
                  'appointmentId': item.appointmentId,
                  'amountPaid': item.amountPaid,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Payment> _paymentInsertionAdapter;

  @override
  Future<List<Payment>> findAllPayments() async {
    return _queryAdapter.queryList('SELECT * FROM Payment',
        mapper: (Map<String, Object?> row) => Payment(
            row['id'] as int,
            row['appointmentId'] as String,
            row['amountPaid'] as int,
            row['date'] as int));
  }

  @override
  Future<void> insertPayment(Payment payment) async {
    await _paymentInsertionAdapter.insert(payment, OnConflictStrategy.abort);
  }
}
