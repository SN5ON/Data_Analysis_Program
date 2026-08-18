# 🌍 Global Climate Indicators: Linear & Polynomial Regression Analysis

This repository contains a data science analysis evaluating atmospheric $\text{CO}_2$ concentration and global sea level rise from 2000 to 2020. The project demonstrates regression modeling, residual diagnostics, accuracy metrics ($\text{MAE}$, $\text{MSE}$, $\text{RMSE}$), model selection via the bias-variance tradeoff, and comparative analysis across different climate indicators.

---

## 📌 Project Overview

When modeling long-term environmental trends, selecting the correct model degree is critical. A linear model may appear accurate with a high $R^2$, but residual analysis often reveals hidden systematic bias. This project explores:
1. Fitting **Linear (Degree 1)** and **Polynomial (Degrees 2–4)** models to climate data.
2. Evaluating model errors using **MAE**, **MSE**, and **RMSE**.
3. Diagnosing non-linear structural patterns via **Residual Plots**.
4. Balancing **Bias vs. Variance** to prevent overfitting.
5. Comparing atmospheric dynamics ($\text{CO}_2$) vs. oceanic dynamics (Sea Level Rise).

---

## 📊 1. Atmospheric $\text{CO}_2$ Analysis (2000–2020)

### Trendline Models & Comparison
We evaluated Linear (Degree 1) through Quartic (Degree 4) polynomial trendlines fitting Year ($x$) to Atmospheric $\text{CO}_2$ Concentration in ppm ($y$).

| Degree | Model Type | Trendline Equation | $R^2$ Score | RMSE ($\text{ppm}$) |
| :---: | :--- | :--- | :---: | :---: |
| **1** | **Linear** | $y = 2.2048x - 4041.11$ | `0.9968` | `0.7526` |
| **2** | **Quadratic** | $y = 0.0202x^2 - 78.8248x + 77392.90$ | `0.9993` | `0.3639` |
| **3** | **Cubic** | $y = 1.36\times 10^{-3}x^3 - 8.18x^2 + 16408x - 1.10\times 10^7$ | `0.9996` | `0.2784` |
| **4** | **Quartic** | $y = -1.00\times 10^{-4}x^4 + 0.809x^3 - 2444x^2 + 3.28\times 10^6x - 1.65\times 10^9$ | `0.9996` | `0.2635` |

---

## 🔍 2. Residual Diagnostics & Key Findings

### The U-Shaped Residual Pattern
Although the linear model achieved an $R^2 = 0.9968$, its residual plot ($y - \hat{y}$) exhibited a distinct **U-shaped curve**:
* **Positive residuals** at the start (2000–2006) and end (2016–2020).
* **Negative residuals** in the middle (2007–2015).
**Diagnostic Meaning:** A systematic U-shape indicates that the linear model underestimates values at the boundaries and overestimates values in the middle. This proves that atmospheric $\text{CO}_2$ accumulation is **accelerating** over time rather than increasing at a constant linear rate.

### Model Metrics Breakdown
Using the calculated residuals ($D_2:D_{22}$), we evaluated error metrics:
* **MAE (Mean Absolute Error):** `0.6490 ppm` — Measures average magnitude of errors without direction.
* **MSE (Mean Squared Error):** `0.5664 ppm²` — Squaring residuals penalizes larger deviations.
* **RMSE (Root Mean Squared Error):** `0.7526 ppm` — Converts squared error back to units of $\text{ppm}$. Represents total model variability ($\sim 0.19\%$ of the mean $\text{CO}_2$ concentration).

---

## ⚖️ 3. The Bias-Variance Tradeoff & Model Selection

* **Degree 1 (High Bias):** Fails to capture the structural acceleration of $\text{CO}_2$, leaving systematic residual patterns.
* **Degrees 3 & 4 (High Variance):** Yield negligible $R^2$ gains ($0.9993 \rightarrow 0.9996$) while introducing unphysical terms ($x^3, x^4$) that cause wild, unstable predictions during future extrapolation.
* **Degree 2 / Quadratic (Optimal Balance):**
  * Cuts prediction error (**RMSE**) by over **50%** (from `0.7526 ppm` to `0.3639 ppm`).
  * Completely flattens the U-shaped residual pattern into random noise.
  * Directly reflects the underlying physics: **constant acceleration** of atmospheric $\text{CO}_2$.

---

## 🌊 4. Cross-Indicator Comparison: $\text{CO}_2$ vs. Sea Level Rise

We applied the same methodology to **Global Mean Sea Level Rise ($mm$)**:

| Characteristic | Atmospheric $\text{CO}_2$ Concentration | Global Sea Level Rise |
| :--- | :--- | :--- |
| **Dominant Driver** | Direct gas emissions / Carbon cycle | Thermal expansion & land ice melt |
| **20-Year Trend Behavior** | Highly curved, smooth acceleration | Near-linear trend with interannual noise |
| **Noise Level** | Extremely low noise | Higher short-term variance (e.g., ENSO cycles) |
| **Residual Structure** | Pure parabolic U-curve | Linear ramp + high-frequency scatter |
| **Recommended Model** | **Quadratic (Degree 2)** | **Linear (Degree 1)** or Conservative Quadratic |

### Why Sea Level Rise Behaves Differently over 20 Years:
1. **Thermal Inertia:** Oceans absorb over 90% of excess heat, acting as a massive buffer that smooths rapid acceleration into a steady response over brief 20-year windows.
2. **Ice Melt Time Lags:** Continental ice sheet decay operates over decadal-to-century timescales.
3. **Interannual Ocean Cycles:** Natural fluctuations like *El Niño / La Niña* shift huge volumes of water between land and ocean, creating short-term noise that masks subtle non-linear curvature.

---

## 🛠 Google Sheets / Excel Formula Reference

| Calculation | Google Sheets Formula | Lock Range Format |
| :--- | :--- | :--- |
| **Predicted Values** | `=($SLOPE)*Year + ($INTERCEPT)` | `=SLOPE(Y_range, X_range)` |
| **Residuals** | `=Actual_CO2 - Predicted_CO2` | `=B2 - C2` |
| **MAE** | `=AVERAGE(INDEX(ABS(D2:D22)))` | `=AVERAGE(INDEX(ABS($D$2:$D$22)))` |
| **MSE** | `=SUMSQ(D2:D22) / COUNTA(D2:D22)` | `=SUMSQ($D$2:$D$22)/COUNTA($D$2:$D$22)` |
| **RMSE** | `=SQRT(AVERAGE(INDEX(D2:D22^2)))` | `=SQRT(AVERAGE(INDEX($D$2:$D$22^2)))` |

---