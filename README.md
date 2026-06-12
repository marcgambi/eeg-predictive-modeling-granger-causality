# eeg-predictive-modeling-granger-causality
MATLAB pipeline for EEG predictive modeling using AR/ARX models, model order selection and Granger causality analysis on eyes-open and eyes-closed conditions.


The objective was to investigate how a simple physiological state change affects both local signal predictability and directional interactions between frontal and parietal cortical regions.

---

## Project Overview

The dataset includes EEG recordings from 21 healthy subjects acquired using a 19-channel EEG system.

Two cortical regions were selected for analysis:

- **F3 (left frontal lobe)**  
- **P3 (left parietal lobe)**

The project involved:

- signal preprocessing through AR high-pass filtering
- model order selection using AIC and BIC criteria
- univariate autoregressive (AR) modeling
- bivariate AR/ARX modeling
- directional connectivity estimation through Granger Causality
- statistical comparison using paired t-tests

---

## Objectives

### Local Dynamics Analysis
Evaluate the predictability of the P3 EEG signal under different physiological conditions through residual variance analysis.

### Functional Connectivity Analysis
Evaluate directional functional interactions between F3 and P3 using Granger Causality.

### Statistical Validation
Assess whether the observed changes between eyes-open and eyes-closed conditions are statistically significant.

---

## Methodology

### Preprocessing
- AR high-pass filtering
- mean removal
- channel selection

### Model Order Selection
- Akaike Information Criterion (AIC)
- Bayesian Information Criterion (BIC)

### Univariate Analysis
Autoregressive modeling of the P3 signal to estimate local predictability through residual variance.

### Bivariate Analysis
Implementation of AR and ARX models for estimating directional information transfer between F3 and P3.

### Statistical Testing
Paired t-tests were used to compare:
- residual variance (EO vs EC)
- Granger Causality F3 → P3 (EO vs EC)
- Granger Causality P3 → F3 (EO vs EC)
- directional differences within EC condition

---

## Main Results

The analysis showed:

- increased residual variance in P3 during eyes-closed condition, indicating reduced local predictability
- increased Granger Causality in both directions during eyes-closed condition
- stronger functional integration between frontal and parietal areas in the absence of visual input
- no significant dominant directionality between F3 and P3 in the eyes-closed condition

These results suggest that closing the eyes alters the functional organization of the fronto-parietal network.

---

## Repository Structure

```text
main.m
order_selection.m
statistical_analysis.m
AR_filter.m
LinReg.m
plots.m
presentation.pdf
