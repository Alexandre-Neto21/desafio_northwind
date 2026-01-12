# Northwind — Sales & Analytics

This repository contains an Analytics Engineering project built for the fictional company Northwind.
The objective of the project is to transform raw transactional data (OLTP) into a trusted, scalable data model, enabling business users and executives to explore sales performance through a structured and governed semantic layer.
This project was developed following industry best practices for dimensional modeling, data transformation, data quality, and analytics consumption.

## Project Stack:

- Databricks: Data Warehouse / Lakehouse
- dbt: Data transformation, testing, and documentation
- Power BI: Analytics & Visualization
- GitHub: Version Control

## Project Structure:

```pgsql
models/
├── staging/
├── intermediate/
└── marts/
    ├── dim_customers.sql
    ├── dim_employees.sql
    ├── dim_dates.sql
    ├── dim_products.sql
    └── fct_orders.sql

```

- Staging: in this layer, raw tables were refined, getting only the needed columns, casting data types and renaming columns.
- Intermediate: in this layer, tables were joined and some basic logic applied.
- Marts: in this layer, we have our final tables with the business logic applied.

## Dimensional Modeling:

Below you can access the visualizations:

[Star Schema](https://drive.google.com/file/d/10ig3BJV1SXKkK5GdXcQKlx78Wjisu50j/view?usp=sharing): The dimensional model of the project, with the fact and dimension tables

[dbt lineage](https://drive.google.com/file/d/1UAsjfnul7Jtpxd_Y03SrOfBf_cg2q2Jd/view?usp=sharing): The dag (Directed Acyclic Graph) of the project, ilustrating how the dependencies of the models

## Analytics & Dashboard

The dashboard is designed for both executive and analytical users.
Here you can access the [dashboard](https://app.powerbi.com/view?r=eyJrIjoiMGJmNmNkNzUtMjZkOC00NDBjLTlmODEtNWJlM2EwNTJhZTNkIiwidCI6IjI0NzU1NTI2LWE5YWEtNGEwMS04ZjFkLWRlNDk1NjEzYjE3YSJ9&pageName=a79ba657158785847546).

Dashboard Pages:
- Menu
- Overview
- Orders
- Customers
- Products
- Employees

All visuals consume data exclusively from the dbt-built marts models.
