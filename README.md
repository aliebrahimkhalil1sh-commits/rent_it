# Rent It

Rent It is a Flutter mobile application for a rental marketplace.  
The app allows users to browse rental items, view listings, manage wishlists, and navigate between different rental-related sections.

---

## Features

- User authentication screens:
  - Login
  - Sign up
  - Profile

- Home screen with:
  - Browse by type section
  - Fresh listings section
  - Location cards
  - Statistics section

- Browse screen for exploring rental items

- Wishlist screen

- Notifications screen

- Bookings screen

- My Listings screen

- Rentals screen

---

## Tech Stack

- Flutter
- Dart
- Dio for API requests
- Shared Preferences for local storage
- Flutter Native Splash
- Custom reusable widgets

---

## Project Structure

```text
lib/
├── core/
│   ├── Networks/
│   │   ├── api_error.dart
│   │   ├── api_exceptions.dart
│   │   ├── api_services.dart
│   │   └── dio_Client.dart
│   ├── constants/
│   └── utils/
│
├── features/
│   ├── Auth/
│   ├── Bookings/
│   ├── Browse/
│   ├── Home/
│   ├── Notifications/
│   ├── Rentels/
│   ├── Wish_Lists/
│   └── myListings/
│
├── shared/
├── main.dart
└── rootView.dart