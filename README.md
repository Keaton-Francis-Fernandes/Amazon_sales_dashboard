# Amazon Sales Data Analysis Dashboard

## Project Overview

This project analyzes Amazon e-commerce sales data to uncover key business insights related to revenue, customer behavior, and order fulfillment efficiency.

The workflow covers the **complete data analysis pipeline**:

* Data Cleaning (Python)
* Data Analysis (SQL)
* Visualization & Insights (Power BI)

---

## Objectives

* Analyze revenue trends across regions
* Identify top-performing cities and categories
* Evaluate order fulfillment efficiency
* Detect operational issues using funnel analysis

---

## Tech Stack

* **Python (Pandas)** – Data Cleaning & Preprocessing
* **SQL (SQLite)** – Data Analysis & KPI Validation
* **Power BI** – Dashboard & Visualization

---

## Data Cleaning (Python)

Data preprocessing was performed using Python to ensure data quality before analysis.

### Key Steps:

* Handled missing values and null entries
* Converted data types (`amount` → numeric)
* Standardized categorical fields (city, state, status)
* Cleaned inconsistent values and formatting issues

 Script:

```
/python/data_cleaning.py
```

---

##  SQL Analysis

SQL was used for exploratory analysis and KPI computation.

### Key Analyses:

* Total revenue and order volume
* Revenue distribution by state and city
* Category-wise performance
* Order status breakdown
* Delivery and cancellation rates

 Queries:

```
/sql/analysis_queries.sql
```

---

##  Dashboard Features (Power BI)

### KPI Metrics

* Total Revenue
* Total Orders
* Average Order Value (AOV)
* Delivery Rate
* Cancellation Rate

---

### Geographic Analysis

* Revenue distribution across states
* Identification of high-performing regions

---

### Top Cities Analysis

* Top 10 cities by revenue
* Insights into urban demand concentration

---

### Category Analysis

* Revenue by product category
* Customer preference trends

---

### Funnel Analysis (Key Highlight)

* Order lifecycle: **Pending → Shipped → Delivered**
* Delivery success rate evaluation
* Identification of drop-offs in fulfillment

---

##  Key Insights

* Revenue is highly concentrated in metro cities like Mumbai and Bengaluru
* Majority of orders are quickly processed with minimal pending backlog
* Only ~26% of shipped orders are successfully delivered
* Significant drop-off from shipped to delivered indicates logistics inefficiencies
* Certain regions show higher cancellation rates, suggesting operational challenges

---

##  Dashboard Preview

### Overview

![Dashboard](images/dashboard_overview.png)

### Funnel Analysis

![Funnel](images/funnel_analysis.png)

### Geographic Analysis

![Map](images/map_analysis.png)

---

## Learnings

* Handling real-world messy datasets
* Data cleaning and preprocessing using Python
* Writing SQL for business-focused analysis
* Building interactive dashboards in Power BI
* Extracting actionable business insights

---

##  Author

**Keaton Francis Fernandes**

---
