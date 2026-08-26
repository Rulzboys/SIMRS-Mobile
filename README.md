# SIMRS Mobile — Patient App

A Flutter mobile application for hospital patients, built as the **patient-facing companion** to a SIMRS (Sistem Informasi Manajemen Rumah Sakit) backend powered by **Frappe**.

The philosophy behind this app: Flutter is **not** a copy of the Frappe web desk. Hospital operations (doctors, nurses, pharmacy, lab, cashier, admin) continue to run inside Frappe Desk. This app exists purely to improve the **patient experience** before, during, and after treatment — booking, real-time queueing, medical records, e-prescriptions, lab/radiology results, billing, and an AI Health Assistant.

---

## ✨ Key Features

| Module | Description |
|---|---|
| 🏠 Home Dashboard | Single-screen overview: greeting, next appointment, today's queue number, health summary, active medications, unpaid bills, and quick shortcuts |
| 📅 Appointment | Search hospital/clinic/doctor, book, reschedule, cancel, and view appointment history |
| 🎫 Queue | Real-time queue number, position, estimated waiting time, and QR check-in |
| 🏥 Medical Record | Full history of visits, diagnoses, prescriptions, lab results, radiology, surgeries, allergies, and vaccines |
| 👨‍⚕️ Online Consultation | Chat with doctors, send photos/documents/lab results |
| 🤖 AI Health Assistant | FAQ answering, disease/medication education, reminders, medical record summarization, and non-diagnostic AI triage |
| 💊 Pharmacy | View e-prescriptions, prescription status, and QR pickup code |
| 🧪 Laboratory | Lab results with AI-generated plain-language explanations |
| 🩻 Radiology | Radiology reports with AI-generated plain-language explanations |
| 💳 Billing | Invoices, payment status, and payment history |
| 🔔 Notifications | Appointment, queue, medication reminders, and result-ready alerts |
| 👤 Profile & ⚙️ Settings | Personal data, BPJS/insurance, emergency contact, dark mode, language, biometric login |

---

## 🧱 Tech Stack

- **Flutter** (Material 3)
- **State management:** [`provider`](https://pub.dev/packages/provider)
- **Localization:** `intl` (Indonesian date/time & currency formatting)
- **Backend (planned):** Frappe REST API — the `services/` layer is already structured to be swapped from mock data to real API calls with minimal changes

---

## 📁 Project Structure

```
lib/
├── main.dart                     # App entry point — providers, theme, routing
│
├── core/                         # App-wide foundations (not feature-specific)
│   ├── theme/                    # Colors, text styles, ThemeData (blue theme)
│   ├── constants/                # App name, base URL, asset paths
│   ├── routes/                   # Route names + route generator
│   └── utils/                    # Date & currency formatters
│
├── models/                       # Plain data classes (Patient, Appointment, Queue,
│                                  # MedicalRecord, Medication, LabResult, Radiology,
│                                  # Invoice, Notification, ChatMessage)
│
├── services/                     # Data layer — one file per feature.
│                                  # Currently returns mock/dummy data with a simulated
│                                  # network delay. Replace the method bodies with real
│                                  # Frappe REST API calls when the backend is ready.
│
├── providers/                    # State management (ChangeNotifier per feature).
│                                  # Holds loading state + data, calls services,
│                                  # and notifies the UI to rebuild.
│
├── widgets/
│   ├── common/                   # Reusable UI pieces (CustomCard, CustomButton,
│   │                              # StatusBadge, LoadingIndicator, EmptyState, etc.)
│   ├── home/                     # Home Dashboard–specific widgets (WelcomeCard,
│   │                              # AppointmentCard, QueueCard, HealthSummaryCard, etc.)
│   └── navigation/                # Bottom navigation bar
│
└── screens/                      # Full pages, grouped by feature/module
    ├── auth/                     # Splash & Login
    ├── home/
    ├── appointment/               # List, doctor search, booking, history
    ├── queue/
    ├── medical_record/            # List & detail
    ├── consultation/              # Doctor list & chat
    ├── ai_assistant/
    ├── pharmacy/
    ├── laboratory/
    ├── radiology/
    ├── billing/
    ├── notification/
    ├── profile/
    ├── settings/
    └── main_navigation.dart       # Bottom-tab shell (Home, Appointment, Queue,
                                    # AI Assistant, Profile)
```

### Data flow

```
Screen  →  Provider (state)  →  Service (data source)  →  Backend / Mock data
   ↑                                                              │
   └──────────────── notifyListeners() rebuilds the UI ←──────────┘
```

---

## 🎨 Design

- **Primary color:** Blue (`#1565C0` / `#0D47A1`), reflecting a clean, trustworthy, medical feel.
- **Design system:** Material 3, centralized in `core/theme/`, so colors and text styles can be changed globally from a single place.
- **Dark mode:** Toggle available in Settings (currently mirrors the light theme — see [Roadmap](#-roadmap)).

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (stable channel)
- A configured Android/iOS emulator or physical device

### Installation

1. Clone this repository:
   ```bash
   git clone <this-repo-url>
   cd <project-folder>
   ```

2. Make sure the following dependencies are in `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     provider: ^6.1.2
     intl: ^0.19.0
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## 🔌 Connecting to a Real Backend

All network calls are isolated inside `lib/services/`. Each service currently simulates a network delay and returns dummy data from the corresponding model (e.g. `AppointmentModel.dummyList()`).

To connect to the real Frappe SIMRS backend:

1. Set the real API base URL in `core/constants/app_constants.dart`.
2. Add an HTTP client package (e.g. `http` or `dio`) to `pubspec.yaml`.
3. Replace the body of each method in `services/*.dart` with an actual API call, keeping the same method signature (same return type) so no changes are needed in `providers/` or `screens/`.
4. Connect `AiAssistantService.sendMessage()` to your actual LLM/AI backend if you want real AI responses instead of the current keyword-based mock replies.

---

## 📌 Notes

- All data shown in the app is currently **mock/dummy data** for UI demonstration purposes.
- The `AI Health Assistant` never provides a medical diagnosis — it only offers educational information and directs the patient to the appropriate clinic (Poli), consistent with the intended product scope.
- This app is intentionally scoped as a **"Digital Health Companion"** — it does not replace hospital operational systems (Frappe Desk remains the source of truth for staff-facing operations).

---

## 🗺️ Roadmap

- [ ] Connect all `services/` to the real Frappe REST API
- [ ] Implement a proper dark theme (currently falls back to the light theme)
- [ ] Add push notifications (FCM or equivalent)
- [ ] Add real QR code generation/scanning for check-in and prescription pickup
- [ ] Add video call support for online consultation (v2)
- [ ] Add authentication token persistence (secure storage)

---

## 📄 License

Add your license here (e.g. MIT, proprietary, internal use only).
