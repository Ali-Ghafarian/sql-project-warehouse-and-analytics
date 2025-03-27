# Table of Contents
- [TL;DR](#tldr)
- [Overview and Business Insights](#overview-and-business-insights)
- [Technical Stack](#technical-stack)
- [Data Warehouse: Data Architecture and Engineering](#1-data-warehouse-data-architecture-and-engineering)
- [Exploratory Data Analysis & Advanced Data Analysis](#2-exploratory-data-analysis--advanced-data-analysis-bi-and-data-analysis)
- [Project Structure](#project-structure)
- [Social Media](#social-media)

# TL;DR
This project unifies disparate data sources into a robust data warehouse to empower data-driven business insights. Business insights are driven through comprehensive analytical processes that leverage advanced ETL, rigorous quality checks, and scalable data mart designs. It involves:
- Integrating raw data using advanced DDL/DML techniques.
- Applying rigorous transformation processes including data enrichment, cleansing, and quality checks.
- Designing scalable data marts with star schema and medallion architecture.
- Executing comprehensive exploratory and advanced analyses using diverse SQL functions to expose key business trends.

# Technical Stack
- **MS SQL Server**: Primary database engine for the data warehouse
- **Azure Data Studio**: Main IDE for SQL notebook development and database management

# Overview and Business Insights
This project transforms disparate data sources into a unified data warehouse through robust data modeling and data mart designs that embrace star schema principles and medallion architecture. The solution incorporates advanced DDL/DML operations, stored procedures for reusability in load and transform routines, and sophisticated ETL processes. With extensive quality checks and data cleaning—using window functions, aggregate functions, date & time functions, string manipulation, numeric and NULL functions, as well as subqueries and common table expressions (CTEs)—the project delivers deep insights on customer behavior, sales performance, and product effectiveness.

Project consists of two main parts:
- Part 1: Creating the Data Warehouse – focusing on data architecture, engineering, transformation processes, and quality checks, and creating business ready views.
- Part 2: Exploratory Data Analysis & Advanced Data Analysis – where a comprehensive set of SQL-based analyses drive actionable business insights.
([check EDA_adv_Analysis.ipynb](advanced_data_analysis/EDA_adv_Analysis.ipynb))

# 1. Data Warehouse: Data Architecture and Engineering
This phase covers:
- **DDL and DML Operations**: Creating and managing tables and views using advanced SQL commands.
- **Data Modeling & Data Marts**: Implementing star schema designs and medallion architecture for scalable data marts.
- **ETL Processes & Stored Procedures**: Employing stored procedures to ensure reusability in loading and transforming data.
- **Quality Checks & Data Cleaning**: Extensive use of SQL techniques such as window functions, aggregate functions, date & time functions, string and numeric operations, NULL handling, subqueries, and CTEs to enforce data integrity and standardization.
(check [Transformation_bronze_to_silver.ipynb](data%20architecture%20and%20engineering/Transformation_bronze_to_silver.ipynb))
    - **Transformation Process (Mostly done in Silver layer)**:
        - **Main Components**: Data Enrichment, Data Integration, Derived Columns, Data Normalization & Standardization, Business Rules & Logic, Data Aggregations
        - **Data Cleansing Breakdown**: Remove Duplicates, Data Filtering, Handling Missing Data, Handling Invalid Values, Handling Unwanted Spaces, Outlier Detection, Data Type Casting

## Architecture and Data Model
<!-- Added image titles -->
**Figure 1: Data Architecture Diagram**  
![Data Architecture Diagram](Docs/Data%20Architecture%20Diagram.png)

**Figure 2: Data Model Diagram**
![Data Model Diagram](Docs/Data%20Model%20Diagram.png)

For detailed information about dimensions, fact tables, and column definitions in the gold layer, please refer to the [Data Catalog](Docs/Data%20Catalog.md).

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
# Main project components and their purposes
├── advanced_data_analysis                 # EDA and advanced analytics notebooks
│   └── EDA_adv_Analysis.ipynb            # Main analysis notebook with insights
├── data architecture and engineering      # Core data warehouse implementation
│   ├── database_init.sql                 # Initial database setup
│   ├── dim_fact_gold.ipynb              # Gold layer dimensional modeling
│   ├── Transformation_bronze_to_silver.ipynb  # Bronze to silver transformation
│   ├── scripts_medallion                 # SQL scripts by medallion layer
│   │   ├── bronze                        # Raw data ingestion layer
│   │   │   ├── ddl_bronze.sql           # Bronze layer schema definitions
│   │   │   └── load_bronze.sql          # Bronze layer data loading
│   │   ├── silver                        # Cleaned data layer
│   │   │   ├── ddl_silver.sql           # Silver layer schema definitions
│   │   │   └── load_silver.sql          # Silver layer transformations
│   │   └── gold                         # Business-ready models
│   │       └── ddl_gold.sql             # Gold layer dimensional schemas
│   ├── stored_procedure                  # Reusable database procedures
│   │   ├── nvarchar_to_date.sql         # Date conversion utility
│   │   ├── proc_load_bronze.sql         # Bronze loading procedure
│   │   └── proc_load_silver.sql         # Silver loading procedure
│   └── tests                            # Data quality validation
│       ├── quality_checks_gold.sql       # Gold layer quality tests
│       └── quality_checks_silver.sql     # Silver layer quality tests
├── datasets                              # Source data files
│   ├── source_crm                        # Customer relationship management
│   │   ├── cust_info.csv                # Customer information
│   │   ├── prd_info.csv                 # Product information
│   │   └── sales_details.csv            # Sales transactions
│   └── source_erp                        # Enterprise resource planning
│       ├── CUST_AZ12.csv                # Customer master data
│       ├── LOC_A101.csv                 # Location information
│       └── PX_CAT_G1V2.csv              # Product categories
└── Docs                                  # Documentation
    ├── Data Architecture Diagram.png     # System architecture overview
    ├── Data Catalog.md                  # Tables and columns documentation
    └── Data Model Diagram.png           # Dimensional model design
```

# Social Media
Connect with me on LinkedIn: [Ali Ghafarian - Data Analyst](https://www.linkedin.com/in/ali-ghafarian-data-analyst)
