# 📘 Data Warehouse Naming Conventions

This document defines the standard naming conventions for **schemas, tables, views, columns, and stored procedures** in the data warehouse.  

---

## 📑 Table of Contents
1. [General Principles](#general-principles)  
2. [Table Naming Conventions](#table-naming-conventions)  
   - [Bronze Rules](#bronze-rules)  
   - [Silver Rules](#silver-rules)  
   - [Gold Rules](#gold-rules)  
3. [Column Naming Conventions](#column-naming-conventions)  
   - [Surrogate Keys](#surrogate-keys)  
   - [Technical Columns](#technical-columns)  
4. [Stored Procedure Naming Conventions](#stored-procedure-naming-conventions)  

---

## ⚙️ General Principles
- Use **snake_case** with lowercase letters and underscores (`_`).  
- Use **English** for all names.  
- Avoid **SQL reserved words**.  
- Keep naming **consistent** across all schemas.  

---

## 🗂️ Table Naming Conventions

### 🥉 Bronze Rules
- Bronze = **raw ingestion** from source systems.  
- Table names **must not be renamed**.  
- **Format:**  
- **Examples:**  
- `crm_cust_info` → Customer info from CRM.  
- `erp_sales_a101` → ERP sales data.  

---

### 🥈 Silver Layer
- Represents **cleaned and standardized data**.  
- Still close to **source naming** for traceability.  
- **Format:**  
- **Examples:**  
- `crm_sales_details` → Cleaned CRM sales transactions.  
- `erp_px_cat_g1v2` → Standardized ERP product categories.  

---

### 🥇 Gold Layer
- Represents **analytics-ready, business-oriented** data.  
- Uses **clear business names**.  
- **Format:**  
- **Category Glossary:**  
| Prefix       | Meaning            | Example                        |
|--------------|--------------------|--------------------------------|
| `dim_`       | Dimension table    | `dim_customers`, `dim_products`|
| `fact_`      | Fact table         | `fact_sales`                   |
| `report_`    | Reporting table    | `report_sales_monthly`         |
| `mart_`      | Data mart table    | `mart_revenue`                 |

---

## 🔑 Column Naming Conventions

### Business Columns
- Must be **descriptive**.  
- Follow **snake_case**.  
- **Examples:**  
- `first_name`, `last_name`, `order_date`, `total_amount`  

### Surrogate Keys
- Surrogate keys always end with `_key`.  
- **Format:**  
- **Examples:**  
- `customer_key` → In `dim_customers`.  
- `product_key` → In `dim_products`.  

### Technical Columns
- Used for **metadata and audit tracking**.  
- Always start with `dwh_`.  
- **Examples:**  
- `dwh_load_date` → Record load timestamp.  
- `dwh_updated_by` → Process/user who last updated the record.  
- `dwh_version` → Version of the record.  

---

## ⚡ Stored Procedure Naming Conventions
- All ETL procedures follow:  
- **Examples:**  
- `load_bronze_crm_cust_info` → Loads raw CRM customer info.  
- `load_silver_crm_sales_details` → Cleans & loads CRM sales data.  
- `load_gold_fact_sales` → Loads Gold fact sales table.  

---

## 📊 Examples

### Example 1: Bronze Table
```sql
SELECT *
FROM bronze.crm_cust_info;
