Practice Exercise: An Introduction to Data Visualizations
Raw Spreedsheet and the proccessed one are attached in the repository as one as well as the solutions.
# 📊 U.S. Renewable Energy Data Analysis (2022–2024)

An end-to-end data analysis project investigating renewable energy generation, investments, capital efficiency, and distribution across all 50 U.S. states using Google Sheets.

---

## 🛠️ Project Overview

This project analyses state-level renewable energy metrics across multiple energy types (Wind, Solar, Hydro, etc.) for the years 2022 and 2024. Through data filtering, statistical summaries, scatter plots, bubble charts, and custom box plots (candlestick implementation), we evaluate:
- **Capital Efficiency & ROI:** Energy generated per dollar invested.
- **Capacity vs. Output:** The physical relationship between installed capacity (MW) and actual generation (GWh).
- **Geographic Spread & Equity:** Central tendency, variability, and regional disparities in wind power adoption.

---

## 📈 Visualizations & Methodologies

### 1. Scatter Chart: Installed Capacity vs. Annual Generation (2022)
- **Objective:** Evaluate the correlation between physical capacity (MW) and energy produced (GWh).
- **Axes:**
  - **X-axis:** Installed Capacity (MW)
  - **Y-axis:** Annual Generation (GWh)
- **Key Finding:** A strong positive correlation exists. Capacity serves as the structural ceiling for generation, though operational factors (resource availability, capacity factors, grid demand) drive actual output.

### 2. Bubble Chart: Investment, Generation & Project Count (2022)
- **Objective:** Analyse capital efficiency across states and project scale.
- **Axes & Dimensions:**
  - **X-axis:** Investment ($ million)
  - **Y-axis:** Annual Generation (GWh)
  - **Bubble Size:** Number of Projects
  - **Series (Color):** Renewable Energy Type
- **Key Finding:** 
  - States in the top-left quadrant (high generation, low investment) deliver superior return on investment (ROI).
  - States with small bubbles and low investments generally run consolidated, utility-scale infrastructure (e.g., major hydro dams or massive solar farms). Large bubbles at similar generation levels indicate fragmented, smaller-scale projects with higher soft costs.

### 3. Box Plot (Candlestick Chart): Wind Generation Distribution (2024)
- **Objective:** Measure central tendency, spread (IQR), and high-end outliers for U.S. Wind Generation.
- **Google Sheets Implementation:** Built via a custom 5-number summary table feeding into a Candlestick chart:
  - **Low:** `=MIN(...)`
  - **Open (Q1):** `=PERCENTILE(..., 0.25)`
  - **Close (Q3):** `=PERCENTILE(..., 0.75)`
  - **High:** `=MAX(...)`

---

## 📊 Summary Statistics & Key Answers (2024 Wind Data)

### Statistical Breakdown (50 States):
| Metric | Value | Definition / Calculation |
| :--- | :--- | :--- |
| **Minimum (Low)** | `64.63 GWh` | Lowest state wind generation |
| **Q1 (25th Percentile)** | `843.25 GWh` | Bottom 25% boundary |
| **Median (50th Percentile)**| **`968.45 GWh`** | Exact midpoint of all states |
| **Q3 (75th Percentile)** | `1070.00 GWh` | Top 25% boundary |
| **Maximum (High)** | `1213.20 GWh` | Highest state wind generation (Minnesota) |
| **Interquartile Range (IQR)**| **`226.75 GWh`** | $Q_3 - Q_1 = 1070.00 - 843.25$ |

---

## ❓ Analytical Report Answers

### Q1: Is correlation the same as causation in Capacity vs. Generation?
> **No.** While capacity and generation show a direct positive correlation, installed capacity (MW) is a necessary prerequisite, not a direct cause. Generation (GWh) is actively driven by external variables like capacity factor, resource availability (wind speeds, sun hours), and grid dispatch demand.

### Q2: How do states with high generation and low investment compare to others?
> States generating high energy at lower dollar costs demonstrate higher capital efficiency and ROI. Compared to states with larger bubbles (more total projects) producing equal energy, these high-ROI states benefit from utility-scale project consolidation and superior natural resource yields, avoiding the higher overhead associated with fragmented, smaller installations.

### Q3: Are there any high-end outliers in the 2024 Wind generation dataset?
> **No high-end outliers exist in this dataset.** 
> The statistical threshold for an upper outlier is $Q_3 + (1.5 \times \text{IQR}) = 1070.00 + (1.5 \times 226.75) = \mathbf{1410.125\text{ GWh}}$. Because the maximum generation value in 2024 is **Minnesota at $1213.20\text{ GWh}$**, all states fall within the standard whisker boundaries.

### Q4: What does a large IQR relative to the median imply about energy equity?
> A wide Interquartile Range relative to the median indicates **significant geographical disparity and inequality** in state-level wind adoption. It highlights that clean energy development is heavily stratified—driven by state-specific policy incentives (RPS), grid readiness, and natural resource availability rather than a balanced national rollout.

---

## 💻 Technical Notes (Google Sheets Engine)
Google Sheets does not natively convert single raw data columns into box plots. To build box plots in Sheets:
1. Construct a 5-column statistical summary table (`Category`, `Low`, `Open`, `Close`, `High`).
2. Populate the table using `=MIN()`, `=PERCENTILE(..., 0.25)`, `=PERCENTILE(..., 0.75)`, and `=MAX()`.
3. Select the 5-column range and insert a **Candlestick Chart** under the *Other* chart category.
---
1. Scatter Chart
Question Asked: What is the relationship between Installed Capacity (MW) and Annual Generation (GWh)?

Why it was the best choice:
A scatter plot is specifically designed to plot two continuous numerical variables against each other on a Cartesian plane (X and Y). It is the industry-standard visualization for:

Evaluating correlation (whether generation increases proportionally with capacity).

Identifying the shape of the relationship (linear vs. non-linear).

Detecting clusters or unusual variance (states generating far above or below their capacity limit).

2. Bubble Chart
Question Asked: How do states compare in return on investment (ROI) across generation output, total capital expenditure, and project scale?

Why it was the best choice:
A standard 2D chart can only plot two variables (X and Y). The analytical question required comparing four distinct data dimensions simultaneously:

Horizontal (X): Investment ($ million)

Vertical (Y): Annual Generation (GWh)

Bubble Size: Number of Projects (Scale/Fragmentation)

Color (Series): Renewable Energy Type (Categorical group)

A bubble chart expands on a scatter plot by encoding a 3rd numerical metric into area/size and a 4th metric into color, allowing you to instantly assess capital efficiency (top-left positions) and project consolidation (bubble size) in a single visual.

3. Box Plot (Candlestick Chart)
Question Asked: What is the distribution, central tendency, spread, and outlier profile of Wind energy generation across all U.S. states?

Why it was the best choice:
Bar charts or pie charts show aggregate sums or averages, but they completely hide data dispersion and skewness. A box plot is the ideal statistical visualization because it condenses an entire 50-state distribution into a clean 5-number summary:

Central Tendency: Pinpoints the median (50th percentile), avoiding the distortion caused by extreme values in standard averages.

Spread & Skew: Visualizes the Interquartile Range (IQR, middle 50%) and overall range via whiskers.

Outlier Detection: Highlights extreme observations that fall beyond 1.5×IQR, making it effortless to identify regional disparities and runaway state outputs.