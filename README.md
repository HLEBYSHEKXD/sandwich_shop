# Sandwich Shop

A small Flutter demo app that simulates a simple sandwich ordering counter.

The app demonstrates basic Flutter UI building blocks and patterns: stateful widgets,
forms, dropdowns, buttons, and simple state management. It's intended as a learning
and testing example rather than a production ordering system.

Key features
- Select sandwich type: footlong or six-inch (toggle)
- Choose bread type from a dropdown (white, wheat, wholemeal)
- Increase / decrease quantity with styled buttons (disabled when limits reached)
- Add an order note in a text field (e.g., "no onions")
- Small, testable widget components: `StyledButton`, `OrderItemDisplay`

---

## Installation and Setup

Prerequisites
- OS: Windows / macOS / Linux (this repo was developed on Windows)
- Flutter SDK: stable channel, compatible with Dart SDK >=2.17.0
- Git
- An editor (VS Code, Android Studio) with Flutter support

Clone the repository

```powershell
git clone https://github.com/HLEBYSHEKXD/sandwich_shop.git
cd sandwich_shop
```

Install dependencies

```powershell
flutter pub get
```

Run the app

Start on an emulator or connected device and run:

```powershell
flutter run
```

To run a specific platform (example: Windows desktop):

```powershell
flutter run -d windows
```

---

## Usage

Main screen (`OrderScreen`) contains the ordering controls:
- The app bar title shows `Sandwich Counter`.
- Use the toggle to switch between `six-inch` and `footlong` sandwich types.
- Use the dropdown to pick the bread type. The dropdown uses `DropdownMenu` entries
	built from the `BreadType` enum.
- Type any special request or note into the notes text field.
- Use the `Add` and `Remove` buttons to change the order quantity. Buttons become
	disabled when you reach `0` or the configured `maxQuantity`.

Order display
- The `OrderItemDisplay` widget shows a human-readable summary: quantity, bread,
	sandwich type, and any note. It also renders a number of sandwich emojis equal to
	the quantity.

Testing user interactions
- After UI events (like `tester.tap(...)`) tests call `await tester.pump()` or
	`await tester.pumpAndSettle()` to allow the framework to rebuild and animations
	to complete before assertions.

Screenshots / GIFs
- This README doesn't include images. To add screenshots, place them in `assets/`
	or `doc/` and link them here (e.g., `![Order screen](doc/screenshot.png)`).

---

## Running Tests

Run all tests:

```powershell
flutter test
```

Run a single test file (example used in development):

```powershell
flutter test test\views\widget_test.dart
```

Notes about tests
- Widget tests commonly mark the test callback as `async`. That's because
	`WidgetTester` APIs return `Future`s and the test needs to `await` pumps,
	animations, and other asynchronous work before asserting results.
- Some tests select the last match of a `Finder` (for example: `find.text('wheat').last`)
	because text like `wheat` may appear multiple times (selected value + menu item).

---

## Project Structure

High-level layout (important files):

- `lib/main.dart` — App entrypoint and main widgets (`App`, `OrderScreen`,
	`StyledButton`, `OrderItemDisplay`)
- `lib/repositories/order_repository.dart` — Small in-memory repository used to
	encapsulate increment/decrement logic and enforce a `maxQuantity`.
- `lib/views/` — (existing folder in repo) where additional view files live
- `test/` — widget and unit tests (example: `test/views/widget_test.dart`)
- `pubspec.yaml` — project metadata and dependencies

Key dependencies
- `flutter` (SDK) — UI framework
- `cupertino_icons` — optional icons

Development
- `flutter_test` and `flutter_lints` included in `dev_dependencies`

---

## Known Issues & Limitations

- No persistence or backend: order state is only in-memory; closing the app clears
	all state.
- Minimal accessibility and localization support.
- UI is intentionally simple for demonstration; no advanced error handling.

Planned improvements (examples)
- Add data persistence or a backend API
- Improve accessibility and theming
- Add more comprehensive unit and widget tests

---

## Contributing

Contributions are welcome. Suggested workflow:

1. Fork the repo.
2. Create a feature branch: `git checkout -b feat/your-feature`.
3. Make changes and add tests.
4. Run `flutter test` and ensure checks pass.
5. Open a pull request describing your changes.

Please follow existing code style and add tests for new behavior.

---

## Contact

- Maintainer: `HLEBYSHEKXD` (GitHub)
- Replace this contact block with your name/email or project website if you like.

Thank you for checking out this demo app — Happy hacking!
