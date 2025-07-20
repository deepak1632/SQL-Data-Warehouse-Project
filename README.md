# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse & Analytics Project**!
This repository showcases a complete data warehousing and analytics solution — from designing and building the data warehouse to producing actionable business insights.
Built as a **portfolio project**, it demonstrates industry-standard best practices in **data engineering** and **analytics**

---
### 🏗️ Data Architecture
This project implements the Medallion Architecture with Bronze, Silver, and Gold layers to structure the data flow:

*  **Bronze Layer**: Raw, unprocessed data as ingested from source systems. Here, data is loaded from CSV files into a SQL Server database.
*  **Silver Layer**: Cleansed, standardized, and normalized data, prepared for analysis.
*  **Gold Layer**: Business-ready, analytics-friendly data modeled in a star schema for reporting and insights.
---   
### 📖 Project Overview
This repository demonstrates the end-to-end process of building a modern data warehouse and analytics solution, including:

* **Data Architecture**: Designing and implementing the Medallion Architecture (Bronze, Silver, Gold).
* **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
* **Data Modeling**: Designing optimized fact and dimension tables for analytical workloads.
* **Analytics & Reporting**: Creating SQL-based reports and dashboards that deliver actionable business insights.
---

### 🔥 Who Should Explore This Project?
This repository is a valuable showcase for students, professionals, and enthusiasts looking to demonstrate or develop expertise in:

* SQL Development
* Data Architecture
* Data Engineering
* ETL Pipeline Development
* Data Modeling
* Data Analytics
---

### 🛠️ Important Links & Tools
Everything used in this project is free and open for learning purposes!

* 📂 Datasets: Raw CSV files for ERP and CRM data used in the project.
* 🖥️ **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server to host the SQL database.
* 🛠️**[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** Graphical interface for managing and querying the database.
* 🌐  **[Git Repository](https://github.com/):** Set up a GitHub account and repository to version, manage, and collaborate on your code.
* 📝 **[DrawIO](https://www.drawio.com/):** Design data architectures, models, and process flows with clear diagrams.
* 📋 **[Notion](https://www.notion.com/templates/sql-data-warehouse-project):** Project template and task management to keep track of progress.
* 📑 **[Notion Project Steps](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4):**  Detailed breakdown of all phases and tasks of the project.
---
### 🚀 Project Requirements
#### 🔷 Building the Data Warehouse (Data Engineering)
##### Objective
Design and implement a modern data warehouse on SQL Server to consolidate sales data from ERP and CRM systems, enabling reliable analytical reporting and data-driven decisions.

##### Specifications: 
* **Data Sources**: Two CSV datasets (ERP & CRM).
* **Data Quality**: Detect, cleanse, and resolve data quality issues before loading.
* **Integration**: Merge data into a unified, analytics-friendly model.
* **Scope**: Work with the most recent snapshot of data; no historization required.
* **Documentation**: Provide clear and thorough documentation of the data model for stakeholders and analytics teams.
---
### 📊 BI: Analytics & Reporting (Data Analysis)
#### Objective
Develop SQL-based analytics and dashboards to generate actionable insights into:
* Customer behavior
* Product performance
* Sales trends

These insights help business stakeholders make informed, strategic decisions.

---
### 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw ERP and CRM datasets (CSV files)
│
├── docs/                               # Documentation and architecture diagrams
│   ├── etl.drawio                      # ETL processes and techniques
│   ├── data_architecture.drawio        # Overall data architecture diagram
│   ├── data_catalog.md                 # Dataset catalog with field descriptions and metadata
│   ├── data_flow.drawio                # Data flow diagram
│   ├── data_models.drawio              # Star schema data models
│   ├── naming-conventions.md           # Guidelines for consistent naming of objects
│
├── scripts/                            # SQL scripts for ETL and modeling
│   ├── bronze/                         # Scripts for loading raw data
│   ├── silver/                         # Scripts for data cleansing and transformation
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Data quality and validation scripts
│
├── README.md                           # Project overview and setup instructions
├── LICENSE                             # Repository license information
├── .gitignore                          # Git ignore rules
└── requirements.txt                    # Optional: dependencies or setup notes
``` 
---

### 🛡️ License
This project is licensed under the MIT License.
You are free to use, modify, and share this project with proper attribution.

For full license details, see the [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) file.
