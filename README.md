# Online Sales Dataset Analysis

This project analyzes a dataset containing online sales data to identify trends and patterns in consumer behavior. The analysis focuses on understanding factors like sales performance, customer segmentation, and product trends.


## 📊 Dataset

The dataset used for this analysis is from Kaggle, specifically the [Online Sales Dataset](https://www.kaggle.com/datasets/yusufdelikkaya/online-sales-dataset). It contains transactional data for an online retail store, which is used to analyze sales performance, customer behavior, and product trends.

## 💻 Technologies Used
- **Python**: For data cleaning, analysis, and visualization.
- **Pandas**: For data manipulation and analysis.
- **SQL**: For querying and processing data.
- **PowerBI**: For building interactive dashboards and visualizing results.

## 🚀 Project Overview
The goal of this project is to analyze the online sales dataset and uncover actionable insights that can help businesses improve their sales strategy. The analysis includes:
- **Sales Trend Analysis**: Understanding the sales performance over time.
- **Customer Segmentation**: Segmenting customers based on their purchasing behavior.
- **Product Performance**: Identifying which products are performing the best.
- **Sales Forecasting**: Using historical data to predict future sales (in progress).

## 🛠️ Project Structure

```
Online_Sales_Dataset/
├── 📁 Data/                     ← Raw and cleaned datasets
│   └── online_sales_dataset.csv
│
├── 📁 Images/                   ← Dashboard screenshots
│   ├── product_overview.png
│   └── sales_overview.png
│
├── 📁 src/                      ← Python scripts and notebooks
│   ├── __pycache__/
│   ├── functions.py            ← Helper functions (optional)
│   ├── EDA.ipynb               ← Data cleaning & exploration
│   └── Migration_SQL.ipynb     ← SQL logic and transformations
│
├── Online_Sales_Final.csv      ← Final dataset used in Power BI
├── Online_Sales.pbix           ← Power BI dashboard file
├── SQL_queries.sql             ← SQL scripts for analysis
└── README.md                   ← Project documentation
```

## 📊 Dashboard Analysis Overview

This analysis includes various interactive visualizations that provide key business insights:

### Sales Overview
- **Total Revenue**: Displayed as a headline figure and broken down by product category (Furniture, Accessories, Electronics, Apparel, Stationery), customer country, and year/quarter.
- **Geographical Insights**: A map shows total revenue distribution across different countries.
- **Trend Over Time**: A line chart tracks revenue progression from 2020 to 2025.

### Product Overview
- **Top Products Sold and Returned**: Bar charts highlight the most sold and most returned items (e.g., USB Cable, Wall Clock).
- **Top Country**: Displays the top-performing country according to selected filters (e.g., Belgium in this case).
- **Sales by Channel**: Donut chart comparing in-store vs. online sales.
- **Sales by Payment Method**: Breakdown of sales via Bank Transfer, Credit Card, and PayPal.

These dashboards provide a comprehensive view of sales performance, product trends, customer behavior, and revenue distribution. All visuals are dynamic and update based on filter selections for deeper analysis.

### Example Power BI Dashboard:

Here is an example of the dashboards created using Power BI:

![Sales Overview Dashboard](Images/Sales_Overview.png)
![Product Overview Dashboard](Images/Product_Overview.png)


