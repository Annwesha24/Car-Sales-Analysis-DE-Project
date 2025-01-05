# Car-Sales-Analysis-DE-Project

Architechture](Images/image.png)

This production-ready project is designed to analyze car sales data through an end-to-end ETL pipeline. It seamlessly integrates data ingestion from GitHub, links it to Azure SQL Database for storage, and employs Azure services for transformation. Using Azure Data Factory, Azure Data Lake Gen2, Databricks, and Unity Catalog for secure access (via access tokens), the pipeline is architected on the medallion framework. It delivers a consolidated table for data scientists and a star schema for data analysts, enabling robust analytics and impactful visualizations.

---

## Key Components of the Pipeline

1. **SQL Source**

    - The data is ingested from GitHub and stored in an Azure SQL Database.

    - This serves as the source for ingestion into the pipeline.

2. **Ingestion (Azure Data Factory)**

    - Azure Data Factory orchestrates the ingestion of data from the SQL source into the pipeline.

    - The ingested data is stored in Data Lake Gen2 in its raw form.

3. **Raw Data Store**

    - The raw data is stored in Azure Data Lake Gen2 -> Bronze Layer .

    - Data is saved in Parquet format for optimized storage and querying.

4. **Transformation (Databricks)**

    - Data transformation is performed using Azure Databricks.

    - Databricks processes the raw data to generate transformed and cleaned datasets.

5. **Transformed Data**

    - The transformed data is stored back in Azure Data Lake Gen2 -> Silver layer.

    - The output data is also saved in Parquet format.

6. **Serving (Delta Lake)**

    - The processed and transformed data is prepared for serving.

    - It is stored in Delta Lake on Azure Data Lake Gen2, which supports advanced data capabilities such as versioning and ACID transactions -> Gold Layer.

7. **Incremental Data**

    - Only one pipeline for both Source Data and Incremental Data

    - The pipeline supports incremental data processing to handle updates and new data efficiently.

8. **Data Modeling**

    - The data is modeled into two formats for downstream consumption:

    - One Big Table: Consolidates all relevant data.

    - Star Schema: A structured model for analytics and reporting.

9. **Security**

    - Azure Key Vault and Azure Active Directory (AAD) ensure secure access and authentication for the pipeline components.

---

## Pipeline Flow

![alt text](<Pipelines & Visualization/Incremental Data pipeline.png>)

1. **Source to Ingestion** (GitHub -> Azure SQL DB)

    ![alt text](<Pipelines & Visualization/Ingest Data from Git.png>)

    - Data Sources: Two CSV files (Sales Data and Incremental Data) are stored in GitHub.
    - Ingestion: Data is ingested from GitHub into an Azure SQL Database via Azure Data Factory. A water table is created in Azure SQL to track the max_date, ensuring that only the most recent data (or new data) is processed during the incremental load.

3. **Transformation** (Azure SQL DB -> Databricks -> Azure Data Lake Gen2)

    ![alt text](<Pipelines & Visualization/Data-Model Run.png>)

    - Databricks Processing: Azure Databricks processes the data in 3 phases:
    - The raw data from Azure SQL DB in Azure Data Lake Gen2 in Parquet format for efficient storage and further processing. -> **Bronze Layer**
    - The data is transformed and stored as a large consolidated table. -> **Silver Layer**
    - The Silver Layer data is then further refined into fact table and dimension table (*star schema*) structure for efficient analytical querying. -> **Gold Layer**


4. **Serving Layer**

    ![alt text](<Pipelines & Visualization/visualization.png>)

    - The Gold Layer, stored in Delta Lake, is used to serve transformed and structured data to consumers, ensuring high performance for analytical queries.

---

## Tools and Technologies Used

1. **GitHub**: Initial data source, API Connections.

2. **Azure SQL Database**: Centralized storage for raw data.

3. **Azure Data Factory**: Orchestration and ingestion.

4. **Azure Data Lake Gen2**: Storage for raw, transformed, and served data.

5. **Databricks**: Data transformation and processing.

6. **Delta Lake**: Enhanced data storage and serving.

7. **Parquet Format**: Optimized file format for data storage.

8. **Apache Spark**: Transform data with PySpark.

9. **Unity Catalog**: Governance with Unity Catalog.

---

## Use Cases

1. Data ingestion from GitHub repositories to Azure SQL Database.

2. Transformation and cleaning of large datasets.

3. Secure and efficient storage of raw and processed data.

4. Serving data for analytics and reporting with structured models.

---
