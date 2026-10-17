# Medical Clinic Database Schema

A normalized relational database schema for a small medical clinic, designed to manage patients, doctors, appointments, and prescriptions.

## Schema Overview
- **patients**: Stores personal and contact information for each registered patient.
- **doctors**: Stores professional profiles and specialisations for clinic doctors.
- **appointments**: Acts as a junction table linking patients and doctors, capturing visit dates, times, reasons, and diagnoses.
- **prescriptions**: Tracks medications, dosages, and instructions prescribed during each appointment.

## SQL Implementation
You can set up the database by running the following SQL script:

```sql
CREATE DATABASE medical_clinic;
USE medical_clinic;

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number VARCHAR(20) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialisation VARCHAR(100) NOT NULL
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit TEXT NOT NULL,
    diagnosis TEXT,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);

CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    instructions TEXT,
    CONSTRAINT fk_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE
);