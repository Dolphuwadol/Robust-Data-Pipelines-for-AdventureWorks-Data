<<<<<<< HEAD
Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
=======
# Robust-Data-Pipelines-for-AdventureWorks-data
An end-to-end data engineering pipeline with Medallion architecture. 

## Medallion architecture
![image](https://github.com/Dolphuwadol/Robust-Data-Pipelines-for-AdventureWorks-Data/assets/121854744/f079f6de-3eec-4bd4-98c7-f7ad64c0a9e6)

## Overview
This project leverages AdventureWorks data, initiating the transfer of sales-related information from the database to the Bronze layer in Azure Data Factory and subsequently loading it into Databricks.

Silver layer 
utilizes Dbt for data transformation, treating the data as snapshots and establishing a connection with Databricks. 

Gold layer 
is responsible for creating Data Marts, transforming and joining snapshots into three entities (denormalize).

The entities include
Fact table - Sales: 
- sales order details
- sales order headers

Dimensions
- Customer: address, customer address, and customer entities.
- Product: product and product model entities.

## Tools
- Apache Spark
- Azure Databricks
- Data Build Tool (DBT)
- Azure Data Factory
- Azure data lake storage Gen2

## Output
![dbt-dag](https://github.com/Dolphuwadol/Robust-Data-Pipelines-for-AdventureWorks-Data/assets/121854744/fbfa039b-db4a-4e6b-ac0e-08992dfe6bfd)
![dbt-dag (1)](https://github.com/Dolphuwadol/Robust-Data-Pipelines-for-AdventureWorks-Data/assets/121854744/b8b6f074-274b-4051-a167-455dcac89f59)
![dbt-dag (2)](https://github.com/Dolphuwadol/Robust-Data-Pipelines-for-AdventureWorks-Data/assets/121854744/543f1635-acf7-4120-aca1-23a7288f17f4)
>>>>>>> 68018914a6c631de755befe9c4559e8b40ebc036
