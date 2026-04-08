---
layout: default
title: "Methods"
nav_order: 10
nav_exclude: false
has_children: FALSE
---

# Methods


## Strength

The prediction strength metric is calculated by applying a non-linear (spline) correlation of each biomarker against a gender and age normalized dependent variable for each health domain. The result of the normalization is a dependent variable with the form of a "prevalence multiplier" averaging a value of 1.0 for every age and gender combination. This is achieved by generating a set of weights using a bivariate tensor product spline fitting the relationship between age and each adverse outcome for each gender. For each biomarker, we take the absolute value of the correlation, then average across men and women to create a gender-neutral metric. Next, the value is divided by the maximum strength across all biomarkers, and then multiplied by 10, resulting in the final value for the metric where the strength is normalized for each individual outcome. The final presentation of the prediction strength metric is the result of sorting the individual biomarker averaged values, in descending order, and removing biomarkers redundant in the analysis based on similarity to others (e.g., ApoA, weight, Glucose, Cholesterol).

The normalization method discussed above avoids deceptive correlations with biomarkers correlating to outcomes simply because they correlate to age. Many of the outcomes also correlate highly with age.

## VMR Values

The Voloridge Modeled Range or VMR, is the range of values of a marker yielding the lowest overall 15-year association with the age related adverse outcomes within the health domains. This does not represent a risk category, nor should it be interpreted as a recommendation of any kind. It is simply representing associations in the UK Biobank database of 500,000 participants and between their biomarker values and their 15-year outcomes. To determine the VMR, we begin by fitting a univariate spline for each of the six targets against a biomarker. The seven splines are averaged into one final curve with respect to the biomarker. We define the VMR as the biomarker values corresponding to a risk of no more than 20% above the minimum mean risk. Additional constraints ensure the optimal range does not raise the prevalence for any individual disease beyond the greater of 0.9 or 30% above each domain's minimum prevalence. We further restrict the range by placing limits at the top and bottom 1 percent of the biomarker distribution.

## Population

The values in this report are calculated using data from the UK Biobank. While useful for its large amounts of data, the UK Biobank's generalizability to the greater population is limited due to selection biases. The data come from primarily white, male and female, and more socioeconomically advantaged populations. However, research suggests the data may be generalizable to the larger population with regards to outcomes.[[1]](#ftn1)

In addition to biases inherent in the dataset, a common filter is applied to all prevalence models. This common filter limits the model inputs to a population between the ages of 40 to 70 containing data for height and weight and is observed in the dataset for at least 12 years. Participants who died within those 12 years are included. Additional filters are added to each prevalence model to exclude people with a prior history of each specific outcome. For example, the cardiovascular health model excludes anyone with prior MACE, or major adverse cardiac events. Because the age bias for brain health is so strong, there is an extra filter which excludes people who died at any point without getting dementia. Additional age filters are placed on each domain to ensure the age distribution is balanced between genders for each prevalence target.

Age filters are applied for each domain. The database used had a uniform distribution of individuals aged 40 to 70. For some outcomes, (e.g. metabolic), this entire age range was utilized. For the remainder of the outcomes, a more limited age range was utilized as prevalence multipliers are not as clinically relevant on age groups with lower prevalence of adverse outcomes. In our analysis for brain health, only 60- to 70-year-olds were included as this subgroup contained 86 percent of all cases in the database. For longevity, we analyzed 55- to 70-year-olds, as this age range included 87 percent of deaths in the database. For cardiovascular health, we analyzed 55- to 70-year-olds with no prior MACE, which included 82 percent of MACE events. Additionally, for kidney health we analyzed 55- to 70-year-olds with no prior acute kidney disease, which included 86 percent of instances of the disease. For metabolic health, an additional filter requiring Hemoglobin A1C to be less than 6.0 was applied. This is due to the measure serving as the primary marker for diagnosis of the type 2 diabetes, the main adverse outcome of the metabolic domain. This was done to avoid the inclusion of people who already had type 2 diabetes but were not yet diagnosed.

* * * * *

<a name="ftn1"></a>
[1] Fry, Anna, Thomas J. Littlejohns, Cathie Sudlow, Nicola Doherty, Ligia Adamska, Tim Sprosen, Rory Collins, and Naomi E. Allen. "Comparison of sociodemographic and health-related characteristics of UK Biobank participants with those of the general population." American journal of epidemiology 186, no. 9 (2017): 1026-1034.
