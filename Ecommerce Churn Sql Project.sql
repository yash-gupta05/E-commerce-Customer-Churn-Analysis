/* ===========================================
   1. Database & Table Setup
   =========================================== */
create database if not exists ecommercechurn;
use ecommercechurn;

-- Inspect dataset
select * from ecommerce_churn limit 10;


/* ===========================================
   2. Data Cleaning
   =========================================== */

-- Check duplicates by CustomerID
select CustomerID, count(*) as duplicate_count
from ecommerce_churn
group by CustomerID
having count(*) > 1;

-- Null value check
select
    count(case when Tenure is null then 1 end) as Tenure_null,
    count(case when WarehouseToHome is null then 1 end) as WarehouseToHome_null,
    count(case when HourSpendOnApp is null then 1 end) as HourSpendOnApp_null,
    count(case when OrderAmountHikeFromLastYear is null then 1 end) as OrderAmountHike_null,
    count(case when CouponUsed is null then 1 end) as CouponUsed_null,
    count(case when OrderCount is null then 1 end) as OrderCount_null,
    count(case when DaySinceLastOrder is null then 1 end) as DaySinceLastOrder_null
from ecommerce_churn;

-- Convert blank values to NULL (if stored as empty string in numeric columns)
update ecommerce_churn set Tenure = null where Tenure = '';
update ecommerce_churn set WarehouseToHome = null where WarehouseToHome = '';
update ecommerce_churn set HourSpendOnApp = null where HourSpendOnApp = '';
update ecommerce_churn set OrderAmountHikeFromLastYear = null where OrderAmountHikeFromLastYear = '';
update ecommerce_churn set CouponUsed = null where CouponUsed = '';
update ecommerce_churn set OrderCount = null where OrderCount = '';
update ecommerce_churn set DaySinceLastOrder = null where DaySinceLastOrder = '';

-- Standardize categorical values
update ecommerce_churn set PreferredLoginDevice = 'Phone' where PreferredLoginDevice in ('Mobile Phone','mobile');
update ecommerce_churn set PreferredPaymentMode = 'COD' where PreferredPaymentMode in ('Cash on Delivery','cash on delivery');
update ecommerce_churn set PreferedOrderCat = 'Mobile' where PreferedOrderCat in ('Mobile Phone','mobile phone');

-- Standardize Gender values
update ecommerce_churn set Gender = 'Male' where Gender in ('M','male','MALE');
update ecommerce_churn set Gender = 'Female' where Gender in ('F','female','FEMALE');


/* ===========================================
   3. Data Exploration & Business Questions
   =========================================== */

-- 1. Total number of customers
select count(distinct CustomerID) as total_customers from ecommerce_churn;

-- 2. Overall churn rate
select round(avg(churn)*100,2) as overall_churn_rate from ecommerce_churn;

-- 3. Churn rate by login device
select PreferredLoginDevice,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by PreferredLoginDevice;

-- 4. Distribution of customers across city tiers
select CityTier, count(*) as total_customers
from ecommerce_churn
group by CityTier;

-- 5. Churn rate by payment mode
select PreferredPaymentMode,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by PreferredPaymentMode
order by churn_rate desc;

-- 6. Typical tenure for churned customers (bucketed ranges)
alter table ecommerce_churn add tenure_range varchar(20);
update ecommerce_churn
set tenure_range = case
    when Tenure <= 6 then '0-6 Months'
    when Tenure <= 12 then '7-12 Months'
    when Tenure <= 24 then '13-24 Months'
    else '25+ Months'
end;

select tenure_range,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by tenure_range
order by churn_rate desc;

-- 7. Churn rate by gender
select Gender,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by Gender;

-- 8. Average time spent on app (churn vs non-churn)
select churn,
       round(avg(HourSpendOnApp),2) as avg_time_spent
from ecommerce_churn
group by churn;

-- 9. Churn vs number of registered devices
select NumberOfDeviceRegistered,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by NumberOfDeviceRegistered
order by churn_rate desc;

-- 10. Churn rate by preferred order category
select PreferedOrderCat,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by PreferedOrderCat
order by churn_rate desc;

-- 11. Churn rate by satisfaction score
select SatisfactionScore,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by SatisfactionScore
order by churn_rate desc;

-- 12. Churn rate by marital status
select MaritalStatus,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by MaritalStatus
order by churn_rate desc;

-- 13. Complaints vs churn (using original column)
select Complain,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by Complain;

-- 14. Coupons used by churn vs non-churn
select churn, sum(CouponUsed) as total_coupons_used
from ecommerce_churn
group by churn;

-- 15. Average days since last order (for churned customers)
select round(avg(DaySinceLastOrder),2) as avg_days_since_last_order
from ecommerce_churn
where churn = 1;


/* ===========================================
   4. Advanced Segmentation (extra insights)
   =========================================== */

-- Churn rate by city tier + gender
select CityTier, Gender,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by CityTier, Gender
order by churn_rate desc;

-- Churn rate by payment mode + city tier
select CityTier, PreferredPaymentMode,
       count(*) as total_customers,
       sum(churn) as churned_customers,
       round(avg(churn)*100,2) as churn_rate
from ecommerce_churn
group by CityTier, PreferredPaymentMode
order by churn_rate desc;
