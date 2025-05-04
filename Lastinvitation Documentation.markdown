# Lastinvitation Application Documentation

## Overview
**Lastinvitation** is a Flutter-based mobile application designed to manage wedding invitations, guest lists, RSVPs, and event settings. It provides a user-friendly interface for event organizers to track guest check-ins, manage RSVPs, and customize event details. The app features a clean design with consistent styling using a centralized `AppConstants` class for colors, fonts, paddings, and other UI elements.

The app is structured with a modular architecture, separating concerns into screens, widgets, models, and constants for better maintainability and scalability.

---

## Folder Structure
The project follows a modular structure for better organization:

```
lib/
├── constants/
│   └── app_constants.dart       # Centralized constants for colors, fonts, paddings, etc.
├── models/
│   └── guest.dart              # Data model for Guest objects
├── screens/
│   ├── dashboard_screen.dart   # Main dashboard screen
│   ├── guest_screen.dart       # Screen for managing guest list
│   ├── login_screen.dart       # Login screen
│   ├── rsvp_screen.dart        # Screen for managing RSVPs and messages
│   └── setting_screen.dart     # Screen for event settings
├── widgets/
│   ├── bottom_navigation.dart  # Custom bottom navigation bar
│   ├── event_card.dart         # Widget for displaying event details
│   └── header_widget.dart      # Reusable header widget for all screens
└── main.dart                   # Entry point of the application
```

### File Descriptions
- **`main.dart`**: The entry point of the app, defining the `MaterialApp` with named routes for navigation.
- **`constants/app_constants.dart`**: Contains all app-wide constants (colors, font sizes, paddings, text styles) to ensure consistent styling.
- **`models/guest.dart`**: Defines the `Guest` class with properties for guest details (ID, name, check-in date, VIP status, etc.).
- **`screens/`**: Contains all main screens of the app (Login, Dashboard, Guest, RSVP, Settings).
- **`widgets/`**: Contains reusable widgets used across multiple screens (e.g., `HeaderWidget`, `EventCard`, `CustomBottomNavigation`).

---

## Features
The Lastinvitation app includes the following features:

1. **User Authentication**:
   - A login screen for users to access the app using email/username and password.
2. **Event Dashboard**:
   - Displays event details, total guest count, and a list of checked-in guests.
   - Allows exporting guest data to Excel.
3. **Guest Management**:
   - View, add, edit, and delete guests.
   - Categorize guests by "Mempelai Pria" and "Mempelai Wanita".
   - Search functionality for guests (not yet implemented).
4. **RSVP and Messages**:
   - View RSVPs and messages from guests with statuses (Hadir, Masih Ragu, Tidak Hadir).
5. **Event Settings**:
   - Edit event name and invitation message.
   - Upload background and welcome screen images.
   - Copy a link for the welcome screen.
   - Logout functionality with confirmation dialog.
6. **Navigation**:
   - A bottom navigation bar to switch between Dashboard, Guest, RSVP, Scan (not implemented), and Settings screens.
7. **Consistent UI**:
   - Uses `AppConstants` for consistent colors, fonts, paddings, and text styles across the app.

---

## Navigation Flow
- **Entry Point**: The app starts at the `LoginScreen` (`/login` route).
- **After Login**: Users are redirected to the `DashboardScreen` (`/dashboard` route).
- **Bottom Navigation**:
  - **Dashboard** (`/dashboard`): Main screen with event overview and guest list.
  - **Guest** (`/guest`): Manage guest list.
  - **Scan**: QR scanner (not implemented; shows a placeholder message).
  - **RSVP** (`/rsvp`): View RSVPs and messages.
  - **Settings** (`/settings`): Manage event settings.
- **Logout**: From the `SettingScreen`, users can log out and return to the `LoginScreen`.

---

## Screens and Features in Detail

### 1. Login Screen (`LoginScreen`)
- **File**: `screens/login_screen.dart`
- **Purpose**: Allows users to log in to the app.
- **UI Components**:
  - App logo and name (`Lastinvitation`) at the top.
  - Text fields for email/username and password.
  - Password visibility toggle (eye icon).
  - "Login" button to proceed.
- **Functionality**:
  - Prints email and password to the console (for debugging; actual authentication logic needs implementation).
  - On successful login, navigates to `DashboardScreen` using `pushReplacement`.
- **Styling**:
  - Background: `AppConstants.backgroundColor` (white).
  - Button: `AppConstants.primaryColor` (green) with `AppConstants.buttonStyle` for text.
  - Text fields use `AppConstants.borderRadius` for rounded borders.

### 2. Dashboard Screen (`DashboardScreen`)
- **File**: `screens/dashboard_screen.dart`
- **Purpose**: Displays an overview of the event, including event details and a list of checked-in guests.
- **UI Components**:
  - **Header**: Uses `HeaderWidget` with the subtitle "Dasbor".
  - **Green Background**: A green container (`AppConstants.primaryColor`) with a height of 255 at the top.
  - **Event Card**: Displays event details (username, event name, date, total guests) using `EventCard` widget.
  - **Export Section**: A row with "Export to Excel" link and total checked-in guest count.
  - **Search Field**: A text field for searching guests (not implemented).
  - **Guest List**: A scrollable list of checked-in guests with VIP badges and check-in status.
  - **Bottom Navigation**: Uses `CustomBottomNavigation` with the Dashboard tab selected.
- **Functionality**:
  - Loads dummy guest data on initialization.
  - Allows exporting guest data to Excel (simulated with a delay and snackbar).
  - Displays each guest with their name, check-in date, VIP status (if applicable), and check-in status.
- **Styling**:
  - Green background: `AppConstants.primaryColor`.
  - Cards use `AppConstants.cardRadius` for rounded corners.
  - Text styles (e.g., guest names, check-in status) use `AppConstants.bodyStyle` and variants.

### 3. Guest Screen (`GuestScreen`)
- **File**: `screens/guest_screen.dart`
- **Purpose**: Manages the guest list, allowing users to view, add, and delete guests.
- **UI Components**:
  - **Header**: Uses `HeaderWidget` with the subtitle "Tamu".
  - **Guest Categories**: Two buttons showing the number of guests for "Mempelai Pria" and "Mempelai Wanita".
  - **Search Field**: A text field for searching guests (not implemented).
  - **Guest List**: A scrollable list of guests with their names, locations, and actions (delete, WhatsApp).
  - **Add Guest Buttons**: Two buttons ("Tambah Dari Kontak" and "Tambah Manual") at the bottom.
  - **Bottom Navigation**: Uses `CustomBottomNavigation` with the Guest tab selected.
- **Functionality**:
  - Displays dummy guest data with options to delete or contact via WhatsApp.
  - Add guest functionality is not implemented (TODO comments in code).
  - Prevents popping the screen; navigates back to `DashboardScreen` on back press.
- **Styling**:
  - Category buttons: `AppConstants.primaryColor` for the active category.
  - Cards use `AppConstants.cardRadius` for rounded corners.
  - Text styles use `AppConstants.bodyStyle` and variants.

### 4. RSVP Screen (`RSVPScreen`)
- **File**: `screens/rsvp_screen.dart`
- **Purpose**: Displays RSVPs and messages from guests.
- **UI Components**:
  - **Header**: Uses `HeaderWidget` with the subtitle "RSVP & Ucapan".
  - **Stats Section**: Three cards showing counts for "Hadir", "Masih Ragu", and "Tidak Hadir".
  - **RSVP List**: A scrollable list of RSVPs with guest names, messages, and statuses.
  - **Bottom Navigation**: Uses `CustomBottomNavigation` with the RSVP tab selected.
- **Functionality**:
  - Displays dummy RSVP data with statuses color-coded (green for "Hadir", orange for "Masih Ragu", red for "Tidak Hadir").
  - Prevents popping the screen; navigates back to `DashboardScreen` on back press.
- **Styling**:
  - Status cards use distinct colors for each status.
  - RSVP cards use `AppConstants.cardRadius` for rounded corners.
  - Text styles use `AppConstants.bodyStyle` and variants.

### 5. Setting Screen (`SettingScreen`)
- **File**: `screens/setting_screen.dart`
- **Purpose**: Allows users to manage event settings, upload images, and log out.
- **UI Components**:
  - **Header**: Uses `HeaderWidget` with the subtitle "Pengaturan".
  - **Event Name Section**: Displays the event name with an edit icon.
  - **Invitation Message Section**: Displays the invitation message with an edit icon.
  - **Image Upload Section**: Two cards for "Layar Background" and "Layar Sapa" with images and edit icons.
  - **Welcome Screen Link**: A section to copy the welcome screen link.
  - **Logout Section**: A logout button with a confirmation dialog.
  - **Bottom Navigation**: Uses `CustomBottomNavigation` with the Settings tab selected.
- **Functionality**:
  - Displays event details (name, message) with placeholder edit functionality.
  - Allows uploading images for background and welcome screens (edit icon added; functionality not implemented).
  - Copies a link for the welcome screen to the clipboard.
  - Shows a confirmation dialog before logging out, then navigates to `LoginScreen`.
  - Prevents popping the screen; navigates back to `DashboardScreen` on back press.
- **Styling**:
  - Edit icon: Green (`AppConstants.accentColor`) circle with `Icons.edit`.
  - Image cards use `AppConstants.cardRadius` for rounded corners.
  - Text styles use `AppConstants.bodyStyle` and variants.

---

## Reusable Widgets

### 1. Header Widget (`HeaderWidget`)
- **File**: `widgets/header_widget.dart`
- **Purpose**: A consistent header for all screens.
- **UI Components**:
  - App logo and name ("Lastinvitation").
  - Subtitle passed as a parameter (e.g., "Dasbor", "Tamu").
- **Styling**:
  - Background: `AppConstants.primaryColor` (green).
  - Text styles: `AppConstants.headerStyle` and `AppConstants.headerBoldStyle`.

### 2. Event Card (`EventCard`)
- **File**: `widgets/event_card.dart`
- **Purpose**: Displays event details on the `DashboardScreen`.
- **UI Components**:
  - User avatar and username.
  - Event name and date.
- **Styling**:
  - Border: `AppConstants.primaryColor`.
  - Card radius: `AppConstants.cardRadius`.

### 3. Custom Bottom Navigation (`CustomBottomNavigation`)
- **File**: `widgets/bottom_navigation.dart`
- **Purpose**: A bottom navigation bar for switching between screens.
- **UI Components**:
  - Icons and labels for Dashboard, Guest, Scan, RSVP, and Settings.
  - A highlighted scan button (not implemented).
- **Functionality**:
  - Navigates to the respective screen when a tab is tapped.
  - Prevents re-navigation if the current tab is selected.
- **Styling**:
  - Selected tab: `AppConstants.primaryColor`.
  - Unselected tab: `AppConstants.neutralColor`.

---

## App Constants (`AppConstants`)
- **File**: `constants/app_constants.dart`
- **Purpose**: Centralizes all styling constants for consistency.
- **Constants**:
  - **App Name**: `appName` ("Lastinvitation").
  - **Colors**: `primaryColor` (green), `accentColor` (greenAccent), `neutralColor` (grey), `warningColor` (red), `vipColor` (yellow), `secondaryColor` (blue), `blackColor`, `backgroundColor` (white).
  - **Paddings and Radii**: `defaultPadding` (16.0), `cardRadius` (12.0), `borderRadius` (8.0).
  - **Font Sizes**: `titleFontSize` (24.0), `subtitleFontSize` (18.0), `bodyFontSize` (16.0), `buttonFontSize` (16.0), `headerFontSize` (20.0).
  - **Text Styles**: `titleStyle`, `subtitleStyle`, `bodyStyle`, `buttonStyle`, `headerStyle`, `headerBoldStyle`.

---

## Usage Instructions
1. **Run the App**:
   - Ensure Flutter is installed.
   - Run `flutter pub get` to install dependencies.
   - Launch the app using `flutter run`.
2. **Login**:
   - Enter a username/email and password on the `LoginScreen`.
   - Tap "Login" to proceed to the `DashboardScreen`.
3. **Navigate**:
   - Use the bottom navigation bar to switch between screens.
   - Tap "Dasbor" to view the event overview.
   - Tap "Tamu" to manage guests.
   - Tap "RSVP" to view RSVPs and messages.
   - Tap "Pengaturan" to manage settings.
4. **Export Data**:
   - On the `DashboardScreen`, tap "Export to Excel" to simulate exporting guest data.
5. **Manage Guests**:
   - On the `GuestScreen`, view the guest list, add new guests, or delete existing ones.
6. **View RSVPs**:
   - On the `RSVPScreen`, check RSVPs and messages with their statuses.
7. **Manage Settings**:
   - On the `SettingScreen`, edit event details, upload images, copy the welcome screen link, or log out.

---

## Github
- **Repository**: (https://github.com/makananku/last_invitation/tree/master)

---