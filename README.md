# Robust-Data-Pipelines-for-AdventureWorks-data
An end-to-end data engineering pipeline with Medallion architecture. 
This project leverages AdventureWorks data, initiating the transfer of sales-related information from the database to the Bronze layer in Azure Data Factory and subsequently loading it into Databricks.

Silver layer 
utilizes Dbt for data transformation, treating the data as snapshots and establishing a connection with Databricks. 

Gold layer 
is responsible for creating Data Marts, transforming and joining snapshots into three entities (denormalize).

The entities include
Fact - Sales: sales order details  
              sales order headers

Dimensions
Customer: address, customer address, and customer entities.
Product: product and product model entities.

## Tools
- Apache Spark
- Azure Databricks
- Data Build Tool (DBT)
- Azure Data Factory
- Azure data lake storage Gen2
