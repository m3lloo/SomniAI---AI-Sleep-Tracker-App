# TODO - Fix Android Release Build by Migrating Isar -> Drift

- [ ] Add Drift dependencies (drift, drift_flutter, sqlite3_flutter_libs or equivalent, build_runner if needed)
- [ ] Remove `isar`, `isar_flutter_libs`, `isar_generator` from `pubspec.yaml`
- [ ] Create Drift database + tables for:
  - [ ] SleepSessionModel
  - [ ] JournalEntryModel
  - [ ] UserSettingsModel (singleton)
- [ ] Implement DAO/repository layer mirroring current Isar access patterns
- [ ] Replace `lib/local_database/isar_service.dart` with Drift-backed service
- [ ] Update all code references to Isar models/service
- [ ] Run `flutter pub get`
- [ ] Run `flutter clean`
- [ ] Run `flutter build apk --release` and confirm it no longer fails at `:isar_flutter_libs:verifyReleaseResources`

