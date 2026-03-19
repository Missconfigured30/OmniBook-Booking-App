# OmniBook – Multi-Counter Booking System

OmniBook is a Flutter-based mobile application designed to manage service bookings across multiple counters. The application dynamically calculates available time slots based on selected services and existing bookings, ensuring that a complete time window is available on at least one counter.

---

## Features

- Multi-service selection (basket system)
- Real-time total duration and price calculation
- Multi-counter availability logic (3 counters)
- Dynamic time slot grid (9:00 AM – 6:00 PM)
- Automatic disabling of unavailable slots
- Capacity awareness (available counters per slot)
- Booking summary with selected services, time, and counter

---

## Screenshots


### Home Page

<p align="center">
  <img src="https://github.com/user-attachments/assets/725b6e79-fc38-45f2-9f58-083bd9022d48" width="300" />
  <img src="https://github.com/user-attachments/assets/04f51879-291b-4389-9d89-334923424d56" width="300" />
</p>

---

### Service Selection Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/2e7e1875-0314-494b-8104-22f5db915564" width="300" />
</p>

---

### Profile Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/be5b0e43-e498-45fb-87c2-88dfd1aca342" width="300" />
</p>

---

### Booking Summary Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/4d5cc7e4-7761-41a9-8755-03bae0f0dc4c" width="300" />
</p>


---

## Demo


[[Demo]](https://drive.google.com/file/d/1kgxuPytIYMrSbtTNa7RdutD2rRFbsRii/view?usp=drive_link)

---

## Slot Finder Logic (Core Concept)

The availability of a time slot is determined based on whether at least one counter is free for the entire duration of the selected services.

### Steps:

1. Calculate total duration of selected services  
2. For each time slot:  
   - Compute end time (start time + total duration)  
3. Check all counters (1 to 3):  
   - If a counter has no overlapping bookings, the slot is available  

---

### Overlap Condition

Two time intervals overlap if:

(StartA < EndB) AND (EndA > StartB)

If this condition is true, the slot is not available for that counter.

A slot is considered available only if at least one counter has zero conflicts.

---

## Mock Data Used

The application is initialized with the following existing bookings:

- Counter 1: 10:00 AM – 11:00 AM  
- Counter 2: 10:30 AM – 11:30 AM  
- Counter 3: 09:00 AM – 10:30 AM  

---

## Project Structure

lib/  
 ┣ models/  
 ┣ screens/  
 ┣ providers/  
 ┣ utils/  
 ┣ widgets/  

- models/ – Data models (Service, Booking)  
- screens/ – UI screens  
- providers/ – State management logic  
- utils/ – Slot calculation logic  
- widgets/ – Reusable UI components  

---

## Tech Stack

- Flutter (Latest Stable)  
- Dart  
- State Management: Provider 

---

## Getting Started

1. Clone the repository:  
git clone [https://github.com/Missconfigured30/OmniBook-Booking-App.git  ]

2. Navigate to the project directory:  
cd omnibook  

3. Install dependencies:  
flutter pub get  

4. Run the application:  
flutter run  

---

## Key Highlights

- Implementation of a robust slot-finding algorithm  
- Ensures no splitting of services across multiple counters  
- Real-time UI updates based on user selection  
- Clean and modular architecture  

---

## Future Enhancements

The following improvements can be implemented to extend the functionality and scalability of the application:

- Integration with a backend server (e.g., Node.js, Django) for real-time booking management
- Database connectivity (e.g., Firebase, PostgreSQL, MongoDB) to store users, services, and booking data persistently
- User authentication and authorization for personalized booking experience
- Real-time synchronization of booking slots across multiple users
- Push notifications and reminders for upcoming appointments

### AI Integration Possibilities

- Smart slot recommendations based on user preferences and past bookings
- Predictive analysis for peak hours and demand forecasting
- Personalized service suggestions using machine learning models
- Automated chatbot for booking assistance and customer support

These enhancements would transform the application into a fully scalable, intelligent booking platform.

## AI Usage

This project was developed with assistance from AI tools for guidance in:
- UI structuring  
- Logic validation  
- Code optimization  

All core logic, architectural decisions, and implementation were independently developed and verified.

---

## Contact

Payal Chapre  
Feel free to connect for feedback or collaboration.
