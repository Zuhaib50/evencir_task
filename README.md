# Evencir — Flutter Developer Task

A fitness & wellbeing app built from a set of Figma screens. The brief was a
pixel-accurate UI, but I treated the interactive parts (calendar, drag-and-drop
scheduling, the mood dial) as real features rather than static mockups, since
that's where most of the actual work is.

Four tabs live behind a persistent bottom bar: **Nutrition** (Home), **Plan**,
**Mood** and **Profile**, kept alive with an `IndexedStack` so switching tabs
never loses state.

Built on Flutter 3.41 / Dart 3.11. Typeface is Mulish (bundled in `fonts/`).

## What's actually interactive

These are the bits I'd point at in a review — they go beyond drawing the design:

- **Week selector ↔ month calendar** (Home) — tapping the `Week x/y` label opens
  a month picker in a bottom sheet. Picking any date re-maps the seven-day strip
  to that date's week and recomputes the label. `Week x/y` is derived from the
  date itself: which row of the month the date falls on, out of how many rows
  that month has.
- **Drag-and-drop scheduling** (Plan) — workout cards can be dragged onto any day.
  Dropping on an empty day moves the workout; dropping on a day that's already
  taken swaps the two. It works across week sections, not just within one.
- **Mood dial** (Mood) — a gradient ring with a thumb you drag around it. The
  touch point is converted to an angle, and the nearest mood (Calm / Content /
  Peaceful / Happy) drives both the label and the centre face. The ring and thumb
  are hand-drawn with `CustomPainter`; the faces are PNG assets.
- **Time-aware icon** (Home) — the weather icon flips between sun and moon based
  on the device clock, and updates live (a one-minute timer in the cubit) without
  a restart.

## Architecture

Feature-first, MVVM. Each screen is its own folder with a clean split:

```
feature/
├── view/         widgets only — no business logic
├── view_model/   a Cubit + its state (only when the screen has real state)
└── model/        plain data classes
```

A few principles I held to:

- **State management with `flutter_bloc` (Cubit).** Cubit over full Bloc because
  the interactions are direct method calls (`selectDate()`, `moveWorkout()`,
  `updateAngle()`) and don't need event objects. A screen only gets a cubit when
  it genuinely has state — Home, Plan, Mood and the tab shell do; Profile doesn't.
- **One source of truth for colours.** Every colour is a `const` in
  `AppColors`. No hex literal lives anywhere else in the codebase.
- **Responsive by default.** Sizes are scaled from the screen width through a
  `.sp(context)` extension (relative to a 375pt base design width) instead of
  fixed pixels, so layouts hold their proportions across phone sizes. The
  breakpoint/padding logic sits in a single `Responsive` helper, not scattered
  inline.
- **Small, composable widgets.** One widget per file, named for what it is
  (`workout_chip_card.dart`), never for where it sits. Anything reusable
  (buttons, cards, the bottom bar, the calendar sheet) lives in `core/widgets/`.

## Project structure

```
lib/
├── main.dart                  entry point, theme, Mulish, launches MainScreen
│
├── core/                      shared building blocks
│   ├── theme/app_colors.dart  the single colour palette
│   ├── utils/responsive.dart  screen size + horizontal padding + breakpoints
│   ├── extensions/            context / num / widget helpers (e.g. 14.sp(context))
│   └── widgets/               reusable, screen-agnostic widgets
│       ├── app_card.dart
│       ├── app_bottom_nav_bar.dart
│       ├── app_calendar_sheet.dart
│       ├── primary_button.dart
│       └── section_header.dart
│
└── features/
    ├── main/      app shell: bottom nav + IndexedStack over the tabs
    ├── home/      Nutrition: week strip, workout card, calories/weight/hydration
    ├── plan/      Training calendar with drag-and-drop workouts
    ├── mood/      Mood dial: gradient ring, draggable thumb, PNG faces
    └── profile/   placeholder (not part of the design)
```

Each feature follows the same internal shape. Plan, expanded:

```
features/plan/
├── model/
│   ├── workout_type.dart      enum carrying its own colour + icon
│   ├── workout_plan.dart
│   ├── day_plan.dart
│   ├── week_section.dart
│   └── plan_drag_data.dart    payload carried while a card is dragged
├── view_model/
│   ├── plan_cubit.dart        move / swap workouts between days (incl. cross-week)
│   └── plan_state.dart        the static seed data lives in initial()
└── view/
    ├── plan_screen.dart
    └── widgets/               header, week section, day row, the draggable card…
```

## Dependencies

| Package | Why it's here |
| --- | --- |
| `flutter_bloc` | State management. Cubit drives the date selection, drag/drop, mood angle and the active tab. |
| `equatable` | Value equality for state/model classes, so `copyWith` only triggers a rebuild when something genuinely changed — and no hand-written `==`/`hashCode`. |
| `table_calendar` | The month picker behind the `Week x/y` label. Handles month paging and Monday-first weeks out of the box; only the styling is custom. |
| `intl` | `DateFormat` for the header date and the calendar's month title. |
| `cupertino_icons` | iOS-style icon set (ships with the Flutter template). |
| `flutter_lints` *(dev)* | Standard lint rules — `flutter analyze` runs clean. |

The mood ring/thumb are drawn with `CustomPainter` and the faces are plain image
assets, so neither needed an extra package.

## Getting started

```bash
flutter pub get
flutter run
```

## Tests

```bash
flutter test
```

10 tests, focused on the parts with real logic rather than pixel checks:

- `PlanCubit` — moving, swapping and cross-week drag/drop, plus the no-op case.
- `Mood.nearest` — angle-to-mood resolution at each anchor and inside a colour
  area.
- Widget smoke tests — navigating between tabs, the calendar sheet opening, and
  the key sections rendering.

## Notes & assumptions

- All data is static and matches the Figma exports — there's no backend. The
  `Save` / `Continue` buttons are wired to the UI with empty handlers where real
  logic would slot in.
- The Figma `Week x/y` labels in the static mockups weren't always
  date-accurate; I implemented the mathematically correct version (real calendar
  rows) so the label and the week strip always agree.
- Mood faces come from `assets/moods/`; the wheel gradient is drawn in code, so
  it's a close approximation of the design rather than an exported image.
