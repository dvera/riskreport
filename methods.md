---
layout: default
title: "Methods"
nav_order: 5
---

## Methods

### Strength

The prediction strength metric is calculated by applying a non-linear (spline) correlation of each biomarker against a gender and age normalized dependent variable for each disease. The result of the normalization is a dependent variable with the form of a “risk ratio” averaging a value of 1.0 for every age and gender combination. This is achieved by generating a set of weights using a bivariate tensor product spline fitting the relationship between age and each disease outcome for each gender. For each biomarker, the correlation statistic is squared to reflect the percentage of variance explained in a univariate model, then averaged across men and women to create a gender-neutral metric. Next the value is divided by the maximum strength across all biomarkers, and then multiplied by 10, resulting in the final value for the metric where the strength is normalized for each individual disease outcome. The final presentation of the prediction strength metric is the result of sorting the individual biomarker averaged values in descending order, and removing biomarkers that appear redundant in the analysis based on similarity to others (e.g., ApoA, weight, Glucose, Cholesterol).

The normalization method discussed above avoids deceptive correlations with biomarkers that correlate to outcomes simply because they correlate to age, and many of the outcomes also correlate highly to age.

### VMRs

The “Voloridge Modeled Range” (VMR), is the range of values of a marker that yields the lowest overall 15-year association with the seven disease outcomes. This does not necessarily represent a risk category nor should it be interpreted as a recommendation of any kind. It is simply representing associations in the UK Biobank database of 500,000 participants and between their biomarker values and their 15-year outcomes. To determine the VMR, we begin by fitting a univariate spline for each of the seven targets against a biomarker. The seven splines are averaged into one final curve with respect to the biomarker. We define the VMR as the biomarker values that correspond to a risk of no more than 20% above the minimum mean risk. Additional constraints ensure that the optimal range does not raise the risk for any individual disease beyond the greater of 0.9 or 30% above that disease's minimum risk. We further restrict the range by placing limits at the top and bottom 1% of the biomarker distribution.


