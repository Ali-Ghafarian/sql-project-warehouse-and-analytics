# TL;DR
This project unifies disparate data sources into a robust data warehouse to empower data-driven business insights. Business insights are driven through comprehensive analytical processes that leverage advanced ETL, rigorous quality checks, and scalable data mart designs. It involves:
- Integrating raw data using advanced DDL/DML techniques.
- Applying rigorous transformation processes including data enrichment, cleansing, and quality checks.
- Designing scalable data marts with star schema and medallion architecture.
- Executing comprehensive exploratory and advanced analyses using diverse SQL functions to expose key business trends.

# Overview and Business Insights
This project transforms disparate data sources into a unified data warehouse through robust data modeling and data mart designs that embrace star schema principles and medallion architecture. The solution incorporates advanced DDL/DML operations, stored procedures for reusability in load and transform routines, and sophisticated ETL processes. With extensive quality checks and data cleaning—using window functions, aggregate functions, date & time functions, string manipulation, numeric and NULL functions, as well as subqueries and common table expressions (CTEs)—the project delivers deep insights on customer behavior, sales performance, and product effectiveness.

project consists of two main parts:
- Part 1: Creating the Data Warehouse – focusing on data architecture, engineering, transformation processes, and quality checks, and creating business ready views.
- Part 2: Exploratory Data Analysis & Advanced Data Analysis – where a comprehensive set of SQL-based analyses drive actionable business insights.
([check EDA_and_Advanced_Analysis.ipynb](advanced_data_analysis/EDA_and_Advanced_Analysis.ipynb))

## Diagrams
<!-- Added image titles -->
**Figure 1: Data Architecture Diagram**  
![Data Architecture Diagram](Docs/images/data_architecture_diagram.png)

**Figure 2: Data Model Diagram**  
![Data Model Diagram](Docs/images/data_model_diagram.png)

# 1. Data Warehouse: Data Architecture and Engineering
This phase covers:
- **DDL and DML Operations**: Creating and managing tables and views using advanced SQL commands.
- **Data Modeling & Data Marts**: Implementing star schema designs and medallion architecture for scalable data marts.
- **ETL Processes & Stored Procedures**: Employing stored procedures to ensure reusability in loading and transforming data.
- **Quality Checks & Data Cleaning**: Extensive use of SQL techniques such as window functions, aggregate functions, date & time functions, string and numeric operations, NULL handling, subqueries, and CTEs to enforce data integrity and standardization.
(check [Transformation_bronze_to_silver.ipynb](data architecture and engineering/Transformation_bronze_to_silver .ipynb))
    - **Transformation Process (Mostly done in Silver layer)**:
        - **Main Components**: Data Enrichment, Data Integration, Derived Columns, Data Normalization & Standardization, Business Rules & Logic, Data Aggregations
        - **Data Cleansing Breakdown**: Remove Duplicates, Data Filtering, Handling Missing Data, Handling Invalid Values, Handling Unwanted Spaces, Outlier Detection, Data Type Casting
    

# 2. Exploratory Data Analysis & Advanced Data Analysis (BI and Data Analysis)
This phase focuses on:
- **EDA & Advanced Analysis Notebooks**: A comprehensive set of analyses including:
   - Database exploration: Tables, columns, and schema inspections.
   - Dimensions exploration: Customer demographics and product categorization.
   - Date range analysis: Order timeline and customer age distribution.
   - Measures exploration: Aggregated metrics (total sales, average price, order count, etc.).
   - Magnitude analysis: Quantifying and comparing key metrics.
   - Ranking analysis: Identifying top and bottom performers.
   - Change over time: Year-over-year, month-over-month, and cumulative trends.
   - Data segmentation: Grouping insights by customer segments, product categories, or price ranges.
   - Part-to-whole analysis: Proportional evaluation of categories within the whole.
- **Performance Analysis**: Detailed evaluation of:
    - Product Performance: Analysis of product sales, revenue, and trends.
    - Customer Performance: Examination of customer purchasing behavior and contribution.
    - Market Performance: Assessment of revenue distribution and market share by region.
- **Analytical Views and BI Reports**: Consolidation of KPIs and key metrics into report views for interactive business intelligence.

- **SQL Techniques in Analysis**: Deployment of a wide range of SQL commands including window and aggregate functions, date & time functions, string, numeric, and NULL functions, as well as subqueries and CTEs to conduct deep and complex data analyses.


# Project Structure
```
├── advanced_data_analysis
│   └── EDA_adv_Analysis.ipynb
├── data architecture and engineering
│   ├── database_init.sql
│   ├── dim_fact_gold.ipynb
│   ├── Transformation_bronze_to_silver.ipynb
│   ├── scripts_medallion
│   │   ├── bronze
│   │   │   ├── ddl_bronze.sql
│   │   │   └── load_bronze.sql
│   │   ├── silver
│   │   │   ├── ddl_silver.sql
│   │   │   └── load_silver.sql
│   │   └── gold
│   │       └── ddl_gold.sql
│   ├── stored_procedure
│   │   ├── nvarchar_to_date.sql
│   │   ├── proc_load_bronze.sql
│   │   └── proc_load_silver.sql
│   └── tests
│       ├── quality_checks_gold.sql
│       └── quality_checks_silver.sql
├── datasets
│   ├── source_crm
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   └── source_erp
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
└── Docs
    ├── Data Architecture Diagram.png
    ├── Data Catalog.md
    └── Data Model Diagram.png
```
