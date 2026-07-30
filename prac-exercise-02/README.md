PROJECT TWO 
Copies of the raw data and process data are in the repository.
# 📊 Pollution Incident & Remediation Analysis (2021–2023)

## 📌 Executive Summary
This project presents an end to end data analysis of 50 industrial pollution incidents recorded between January 2021 and April 2023. The analysis evaluates pre- and post-remediation emission levels, measures cleanup cost distributions, identifies high-risk operational bottlenecks using advanced Google Sheets functions, and evaluates active remediation financial exposure for executive leadership.

---

## 📈 Dataset Overview & Key Findings

* **Total Analysed Incidents:** 50
* **Total Cleanup Expenditure:** **$3,309,625.74**
* **Average Cleanup Cost / Incident:** **$70,417.57**
* **Total Pre-Remediation Emissions:** **1,320,395.70 lbs**
* **Total Post-Remediation Emissions:** **995,423.29 lbs**
* **Overall Emission Reduction Efficiency:** **~24.6%**
* **Top Emitter:** **Dynamo Power** (35,560.45 lbs — Particulate Matter)

---

## 📏 Cleanup Cost Spread & Variability Analysis

| Statistical Metric | Google Sheets Formula | Value ($) | Analysis & Operational Context |
| :--- | :--- | :--- | :--- |
| **Minimum** | `=MIN(H2:H51)` | **$45,210.99** | Baseline cost floor for low-impact cleanups |
| **First Quartile (Q1)** | `=QUARTILE(H2:H51, 1)` | **$62,863.25** | 25% of cleanups cost less than this threshold |
| **Median (Q2)** | `=MEDIAN(H2:H51)` | **$70,340.25** | Midpoint of incident cleanup expenditure |
| **Third Quartile (Q3)** | `=QUARTILE(H2:H51, 3)` | **$80,785.40** | 75% of cleanups cost $80.7k or less |
| **Maximum** | `=MAX(H2:H51)` | **$88,941.46** | Peak financial exposure per single incident |
| **Range** | `=MAX(H2:H51) - MIN(H2:H51)` | **$43,730.47** | Total spread between highest & lowest cost |
| **IQR** | `=QUARTILE(H2:H51, 3) - Q1` | **$17,922.15** | Spread of central 50% of cleanup incidents |

### 🔍 Skewness & Distribution Insights
* **Right-Skewed Distribution:** A maximum cleanup cost ($88.9k) significantly higher than the median ($70.3k) indicates positive skewness. While middle 50% costs are tightly grouped between ~$62.8k and ~$80.7k (IQR = $17.9k), occasional high-severity spills stretch out the upper financial tail.
* **In Progress Mode Disparity:** When analyzing active projects, a mode higher than the mean and median highlights clustering around high-tier emission limits due to compliance standards.

---

## 🛠️ Advanced Google Sheets Formulas & Architecture

### Top Emitter Lookup (`XLOOKUP` + `MAX`)
```excel
=XLOOKUP(MAX(F2:F51), F2:F51, B2:B51) & " - " & XLOOKUP(MAX(F2:F51), F2:F51, E2:E51)

Dynamic Record Extraction (FILTER & SORT)
Via FILTER: =FILTER(A2:L51, F2:F51 = MAX(F2:F51))

Via SORT/CHOOSEROWS: =CHOOSEROWS(SORT(A2:L51, 6, FALSE), 1)

Conditional Metrics (In Progress Subset)
Average Emissions: =AVERAGE(FILTER(G2:G51, K2:K51 = "In Progress"))

Median Emissions: =MEDIAN(FILTER(G2:G51, K2:K51 = "In Progress"))

Mode Emissions: =MODE(FILTER(G2:G51, K2:K51 = "In Progress"))

📊 Pivot Table & Deep-Dive Executive Analysis
Setup Structure
Rows Hierarchy: Cleanup Projects (Status → Industry → Pollutant Type)

Value Fields:

Annual Emissions (lbs) - Before summarized by COUNTA

Cleanup Cost ($) summarized by SUM

Annual Emissions (lbs) - After summarized by AVERAGE

Filtered Deep-Dive Focus (High & Moderate-High Risk + In Progress)
Filters Applied: Risk Level = {"High", "Moderate-High"}, Status = "In Progress"

Dominant Pollutant Type: Heavy Metals (5 incidents, representing 100% of high-risk active incidents).

Chemical Industry Exposure Calculation (GETPIVOTDATA):

Excel
=GETPIVOTDATA("SUM of Cleanup Cost ($)", A3, "Industry", "Chemical") / GETPIVOTDATA("SUM of Cleanup Cost ($)", A3)
Financial Impact Result: Chemical projects represent 81.39% ($271,578.00 out of $333,654.70) of active, high-risk cleanup liabilities.

💡 Key Operational Takeaways for Leadership
Targeted Risk Mitigation: High-risk ongoing projects are overwhelmingly concentrated in Heavy Metals within the Chemical sector.

Cost-Volume Dynamics: Total manufacturing costs are driven by high incident frequency, whereas chemical costs are driven by high per-incident severity.

Action Item: Executives should focus site audits and immediate remediation capital on active Heavy Metal spills in chemical plants to mitigate over 80% of current high-risk financial exposure.