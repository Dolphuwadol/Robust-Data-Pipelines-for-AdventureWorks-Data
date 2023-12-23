{{
    config(
        materialized = "table",
        file_format = "delta",
        location_root = "/mnt/gold/customers"
    )
}}


with address_snapshot as (
    SELECT
        AddressID,
        AddressLine1,
        AddressLine2,
        City,
        StateProvince,
        CountryRegion,
        PostalCode
    From {{ ref('address_snapshot')}} 
    WHERE dbt_valid_to is NULL
)

, customeraddress_snapshot as (
    SELECT
        CustomerId,
        AddressId,
        AddressType
    FROM {{ref('customeraddress_snapshot')}}
    WHERE dbt_valid_to is NULL
)

, customer_snapshot as (
    SELECT
        CustomerId,
        CONCAT(ifnull(FirstName,' '),' ',ifnull(MiddleName,' '),' ',ifnull(LastName,' ')) as FullName
    FROM {{ref('customer_snapshot')}}
    WHERE dbt_valid_to is NULL
)

, transformed as (
    SELECT
    row_number() over (order by customer_snapshot.customerid) as customer_sk, --สร้างคอลัมน์ที่เป็นลำดับเรียงจาก customerid (surrogate key ที่เพิ่มขึ้นอัตโนมัติ) 
    customer_snapshot.CustomerId,
    customer_snapshot.FullName,
    customeraddress_snapshot.AddressID,
    customeraddress_snapshot.AddressType,
    address_snapshot.AddressLine1,
    address_snapshot.City,
    address_snapshot.StateProvince,
    address_snapshot.CountryRegion,
    address_snapshot.PostalCode
    FROM customer_snapshot
    INNER JOIN customeraddress_snapshot on customer_snapshot.CustomerId = customeraddress_snapshot.customerid
    INNER JOIN address_snapshot on customeraddress_snapshot.AddressID = address_snapshot.AddressID
 
)
SELECT * FROM transformed