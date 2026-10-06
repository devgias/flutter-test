# Flutter Test Quiz — GitHub Users

A Flutter app that lists GitHub users, edits one (name, email, company) and adds new users.
It uses Clean Architecture (data / domain / presentation), **BLoC** for state, **use cases**
for business logic, and a **neumorphic (soft UI)** design.

## Features

| # | Feature | API |
|---|---------|-----|
| 1 | User list showing `type`, `login` and `avatar_url` | `GET https://api.github.com/users?per_page=20` |
| 2 | Edit form (name, email, company), prefilled from the selected user | `GET https://api.github.com/users/{login}` |
| 3 | Add user form (name, email, company) | — |

Every request sends `Content-type: application/json` (see `AppBaseOptions` in `lib/core/app_dio.dart`).

> The GitHub public API is read-only for other accounts, so **saving an edit or adding a user is
> kept in memory** (`UserLocalDatasources`) for the current session. Added users appear at the
> top of the list with a `Local` badge. Edited users show their saved values when opened again.

## Architecture

```
lib/
├── core/                 # DI (get_it + injectable), env, Dio client, router, base UseCase
├── common/               # theme, colors, neumorphic shadows, Failure, shared widgets
├── utils/                # extensions, logger
└── features/user/
    ├── data/
    │   ├── datasources/  # remote (GitHub API) + local (in-memory)
    │   ├── models/       # JSON models -> entities
    │   └── repositories/ # UserRepositoriesImpl -> Either<Failure, T>
    ├── domain/
    │   ├── entities/     # freezed entities
    │   ├── repositories/ # abstract UserRepositories
    │   └── usecases/     # GetUsers, GetUserDetail, AddUser, UpdateUser
    └── presentation/
        ├── bloc/         # UsersBloc, UserDetailBloc, UserFormBloc
        ├── pages/        # UserListPage, EditUserPage, AddUserPage (@RoutePage)
        └── widgets/      # UserCard, UserFormView (shared by add & edit)
```

Data flow: `Page → Bloc → UseCase → Repository → Datasource`.
BLoCs depend only on use cases, and use cases depend only on the abstract repository.
`AddUserUseCase` and `UpdateUserUseCase` share `UserFormValidator`, which trims the input,
lower-cases the email and rejects invalid values before anything is saved.

Each layer has a barrel file (`data.dart`, `domain.dart`, `presentation.dart`) and `user.dart`
re-exports the whole feature.

## Libraries

`flutter_bloc`, `bloc_concurrency`, `freezed`, `get_it` + `injectable`, `auto_route`, `dio`,
`dartz`, `reactive_forms`, `cached_network_image`, `flutter_screenutil`, `flex_color_scheme`,
`google_fonts`, `talker` (logging). Tests use `bloc_test` and `mocktail`.

## Getting started

```bash
flutter pub get
dart run build_runner build   # freezed, injectable, auto_route
flutter run
```

```bash
flutter analyze
flutter test
```
