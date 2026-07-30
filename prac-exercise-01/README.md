Practice Exercise for: Cleaning and Structuring Data
# 📊 Toxic Release Dataset Analysis

Welcome to my data analysis investigation! This project focuses on auditing, cleaning, and analysing toxic chemical release data using spreadsheet functions and structured data investigation techniques.

---

## 🎯 Project Overview
The goal of this project was to verify dataset integrity, identify dirty or mixed data types, perform location based filtering, and calculate key statistics (totals, averages, min/max releasers, and estimated cleanup costs).

---

## 🛠 Tools & Techniques Used
* **Platform:** Google Sheets / Excel
* **Data Verification:** `ISNUMBER`, `ISTEXT`, Data Type Auditing
* **Logical & Lookup Functions:** `COUNTIF`, `XLOOKUP`
* **Statistical Functions:** `SUM`, `AVERAGE`, `COUNTA`, `MAX`, `MIN`
* **Formatting:** Conditional Formatting, Text Wrapping, Row Freezing

---

## 🔍 Key Findings & Investigation Steps

### 1. Data Type Audit & Cleaning
* Identified mixed data types where numbers were formatted as text strings (e.g., containing unit text like `"lbs"`).
* Used `=ISTEXT()` to flag affected cells and converted them to pure numeric values so formulas like `SUM` and `AVERAGE` evaluated correctly.

### 2. State-Level Analysis (California Focus)
* Applied conditional formatting to highlight facilities in **California (`CA`)**.
* Used `=COUNTIF(E:E, "CA")` to isolate and count the number of reporting sites in the region.

### 3. Summary Statistics & Cleanup Estimates
* **Total Toxic Releases:** Calculated using `=SUM()`.
* **Average Release per Facility:** Evaluated using `=AVERAGE()`. A significant difference between the average and the maximum value highlighted a **positively skewed distribution** (a small number of high-outlier releasers).
* **Estimated Cleanup Cost:** Created a calculated column (`TOTAL_RELEASES * 0.50`) to project financial liabilities across facilities.

### 4. Extreme Releasers
* Automated looking up the largest offender using `=XLOOKUP(MAX(range), range, facility_range)` to immediately return the facility name without manual scrolling.

---

## 💡 What I Learned
- **AI as a Co-pilot:** AI (like Gemini) is great for generating lookup syntax, but human verification is essential for catching range errors and hidden text formatting.
- **Data Hygiene First:** Performing calculations before auditing data types will lead to silent errors and understated totals.

---ls

## 📁 Repository Contents
* `toxic_releases_analysis.xlsx` – The cleaned and formatted dataset with all formulas.
* `README.md` – Project documentation and analysis notes.
