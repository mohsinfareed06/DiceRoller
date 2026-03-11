# new_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Binning / Histogramming in Machine Learning

### What is Binning?

**Binning** (also called **bucketing**) is a data pre-processing technique used in machine learning to transform continuous numerical features into discrete categorical ones. This is done by grouping a range of continuous values into a fixed number of intervals — called **bins** or **buckets**.

For example, an age feature with values like `[4, 17, 23, 45, 68, 92]` might be binned into:

| Age Value | Bin         |
|-----------|-------------|
| 4         | Child (0–17)     |
| 17        | Child (0–17)     |
| 23        | Adult (18–59)    |
| 45        | Adult (18–59)    |
| 68        | Senior (60–100)  |
| 92        | Senior (60–100)  |

### What is Histogramming?

**Histogramming** is the process of counting how many data points fall into each bin. It is closely related to binning and is the basis of a **histogram** — a bar chart that visualises the frequency distribution of a continuous variable.

In ML, histogramming is heavily used inside gradient boosting algorithms (e.g. **LightGBM**, **XGBoost histogram mode**) to speed up the search for the best split point when building decision trees.

### Why is Binning Used in ML?

| Benefit | Details |
|---------|---------|
| **Handles outliers** | Extreme values are grouped into edge bins and have less impact on the model. |
| **Reduces overfitting** | Smoothing out fine-grained numerical variation helps the model generalise better. |
| **Speeds up training** | Fewer distinct values means faster split searches in tree-based models. |
| **Converts continuous to categorical** | Enables algorithms that only accept categorical inputs to work with numerical data. |
| **Improves interpretability** | Binned features are easier for humans to understand and reason about. |

### Types of Binning

1. **Equal-width binning** – Each bin covers an equal range of values (e.g. 0–10, 10–20, 20–30…).
2. **Equal-frequency (quantile) binning** – Each bin contains approximately the same number of data points.
3. **Custom / domain-driven binning** – Bin edges are defined by domain knowledge (e.g. age groups, income brackets).
4. **Optimal / supervised binning** – Bin boundaries are chosen to maximise the predictive relationship with the target variable (e.g. using entropy or Gini impurity).

### Example in Python (using pandas)

```python
import pandas as pd

ages = [4, 17, 23, 45, 68, 92]
df = pd.DataFrame({'age': ages})

# Equal-width binning into 3 bins
df['age_bin'] = pd.cut(df['age'], bins=3, labels=['Low', 'Medium', 'High'])

# Equal-frequency binning into 3 quantiles
df['age_quantile'] = pd.qcut(df['age'], q=3, labels=['Q1', 'Q2', 'Q3'])

print(df)
```

### Histogramming in Gradient Boosting (LightGBM / XGBoost)

Modern gradient boosting libraries use histogram-based algorithms to dramatically speed up training:

1. **Before training**, each continuous feature is binned into at most `max_bin` discrete buckets (e.g. 255 by default in LightGBM).
2. **During tree growth**, instead of evaluating every unique value as a potential split point, the algorithm only evaluates the bin boundaries (a much smaller set).
3. **Memory usage** is also reduced because bin indices (stored as integers) replace raw floating-point values.

This is why LightGBM and histogram-mode XGBoost are significantly faster than their exact counterparts on large datasets.

### Key Takeaway

Binning and histogramming are foundational techniques that:
- Pre-process raw numerical data into a form more suitable for many ML algorithms.
- Reduce noise and improve generalisation.
- Power the fast split-finding at the heart of modern gradient boosting libraries.
