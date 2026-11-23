# Sport Store Sales Analysis
This project analyzes 3 years (2020–2022) of sales data for a sporting goods distribution business operating across Indonesia, covering 5 sales teams, 50 partner stores, and 9 product categories.

## 🎬 Data Analysis Process

This project follows a 6-phase data analysis process, from defining the objective to delivering business recommendations:
1. **Ask** — Define the objective of the analysis: understand where sales revenue is coming from, where it's slipping, and what business questions need answering.
2. **Prepare** — Extract the raw sales data using SQL, pulling from the sales order, order item, invoice, product, partner store, and sales team tables.
3. **Process** — Clean and structure the extracted data using Excel, handling inconsistencies, duplicates, and formatting issues to make it analysis-ready.
4. **Analyze** — Analyze the cleaned data using pivot tables to uncover trends in revenue, product/category performance, partner store behavior, and regional sales team performance.
5. **Share** — Visualize the findings in an interactive Power BI dashboard, covering KPIs, trends, and seasonality.
6. **Act** — Translate the analysis into a business recommendations report, a stakeholder presentation deck, and a one-page infographic.
   
## 🎬 Metadata
### Table 1: salesorder
**Primary Key:** SalesOrderID

**Fields:**
- SalesOrderID — unique identifier for each sales order
- PatnerStoreID — unique identifier for each partner store
- SalesTeamID — unique identifier for each sales team
- OrderDate — date of partner store's order
- Payment — payment method of sales order
- TotalOrderTransaction — total sales order amount of sales order
- Note — detail or note from related person of sales order

### Table 2: orderitem
**Fields:**
- SalesOrderID — unique identifier for each sales order
- ProductID — unique identifier for each product
- QuantityOrder — quantity for each product in one sales order
- ItemTotal — total quantity of sales order

### Table 3: invoice
**Primary Key:** InvoiceID

**Fields:**
- InvoiceID — unique identifier for each invoice
- SalesOrderID — unique identifier for each sales order
- ShipmentType — shipment method of invoice
- WarehouseLocation — warehouse of company
- TermsOfPayment — terms of payment of invoice
- ShippingCost — total ship cost of invoice
- Taxes — taxes of invoice
- TotalDue — total amount that must be paid on invoice

### Table 4: patnerstore
**Primary Key:** PatnerStoreID

**Fields:**
- PatnerStoreID — unique identifier for each partner store
- PatnerStoreName — partner store's name
- PatnerType — type/business scale of partner store
- Region — region of partner store
- Province — province of partner store
- PatnerContactPhone — partner store's contact number

### Table 5: product
**Primary Key:** ProductID

**Fields:**
- ProductID — unique identifier for each product
- VendorID — unique identifier for each vendor
- ProductName — name of the product
- Category — category of the product
- UnitSalesPrice — sales price for one unit of product
- UnitBuyPrice — buy price for one unit of product
- Quantity — stock quantity of each product
- UOM — unit of measure of each product
- DiscountProduct — discount of every product
- ProductDescription — description detail of the product

### Table 6: salesteam
**Primary Key:** SalesTeamID

**Fields:**
- SalesTeamID — unique identifier for each sales team
- SalesTeamName — name of the sales team
- SalesTeamRegion — region of the sales team
- SalesPromotionMethods — method of the sales team
- TotalProspect — total prospect of sales for each sales team

### Table 7: vendor
**Primary Key:** VendorID

**Fields:**
- VendorID — unique identifier for each vendor
- VendorName — name of the vendor
- Address — address of the vendor
- City — city of vendor's address
- Province — province of vendor's address
- Email — email of the vendor
- Phone — phone of the vendor

### Relationships and Constraints
- `patnerstore.PatnerStoreID` ↔ `salesorder.PatnerStoreID`: One-to-Many (one partner store can have many sales orders)
- `salesteam.SalesTeamID` ↔ `salesorder.SalesTeamID`: One-to-Many (one sales team is responsible for many sales orders)
- `vendor.VendorID` ↔ `product.VendorID`: One-to-Many (one vendor can sell many products)
- `product.ProductID` ↔ `orderitem.ProductID`: One-to-Many (one product can be listed in many order items)
- `salesorder.SalesOrderID` ↔ `orderitem.SalesOrderID`: One-to-Many (one sales order can be listed in many order items)
- `salesorder.SalesOrderID` ↔ `invoice.SalesOrderID`: One-to-Many (one sales order can be listed in many invoices)

### Data Model
![Data Model](Images/Data%20Model.png)

## 🎬 Project Showcase
![Power BI Dashboard Demo](Power%20BI%20Project%20Showcase.gif)

## 📊 Dashboard Overview
This interactive dashboard provides insights that get from sales data in the Sport Store Brand Client, including Sales Executive Summary, Sales performance, Product & Cateogry Analysis, Partner Store Behaviour Analysis, and Sales Team & Region Analysis.

## Link Dashboard
[View the interactive Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiM2Q0OTgwODAtMGJhZi00M2VmLTgyYzYtNWQzOTk1NjA0MzFhIiwidCI6IjM0ODViOTYzLTgyYmEtNGE2Zi04MTBmLWI1Y2MyMjZmZjg5OCIsImMiOjEwfQ%3D%3D)

### Key Metrics Summary

- **Total Revenue from 2020 - 2022**: Approximately Rp.297 Billion
- **Total Orders from 2020 - 2022**: 1028 Orders
- **Total Active Partner Store**: 50 Partner Stores
- **Average Order Value**: Approximately Rp.290 Million
- **Average YoY Percentage**: Approximately -5%

## 🧭 Dashboard Views & Features
 
### 1. 📊 Executive Summary – Sales KPI
 
- **Total Revenue / Total Orders / Average Order Value (KPI Cards)** — Headline sales numbers for the business at a glance.
- **Total Revenue by Yearly (Line Chart)** — Revenue trend from 2020–2022, showing where growth accelerated or declined.
- **Total Revenue by Sales Team Region (Donut Chart)** — Revenue share by region, highlighting which region dominates and which underperforms.
- **Filter by Yearly (Slider) & Filter by Sales Team (Checklist)** — Lets viewers drill into a specific year range or sales team.
  
### 2. 📈 Sales Performance Analysis

- **Revenue by Month (2020–2022)** — Month-by-month revenue trend across the full period.
- **Seasonality by Month** — Recurring high/low seasons across years.
- **YoY & MoM Growth %** — Year-over-year and month-over-month growth rate.
- **AOV Trend by Month** — Change in average spend per order over time.
  
### 3. 🏷️ Product & Category Analysis

- **Distribution of Sales Orders by Quantity** — Spread of order sizes.
- **Revenue by Product** — Top individual products by revenue.
- **Revenue Contribution by Category** — Revenue share across product categories.
- **Total Quantity Orders by Category** — Sales volume by category, independent of revenue.
  
### 4. 🤝 Partner Store Behaviour Analysis

- **Top 10 Partner Store Revenue Contribution** — Highest-earning partner stores.
- **Revenue by Region** — Partner store revenue by geography.
- **Top 10 Repeat Orders by Partner Store** — Most frequent/loyal ordering stores.
- **Revenue by Partner Type (Retail vs Distributor)** — Channel split of total revenue.
- **Revenue vs Order Frequency Scatter** — Relationship between order volume and revenue per store.
  
### 5. 🧑‍💼 Sales Team & Region Analysis

- **Revenue by Sales Team** — Revenue generated per team.
- **Sales Order by Sales Team** — Orders closed per team.
- **Revenue by Sales Promotion Method** — Effectiveness of each promotion strategy.
- **Revenue Trend by Sales Team (2020–2022)** — Performance evolution per team over time.
- **Closed Prospect vs Revenue Scatter** — Relationship between prospects closed and revenue per team.
---
 
## 📈 Key Findings
 
### Executive Summary

- Total revenue reached **Rp296.77bn** across **1,028 orders**, with an average order value of **Rp0.29bn**.
- Revenue declined from **Rp111bn (2020) → Rp94bn (2021) → Rp92bn (2022)**, a downward trend of roughly 15–17% since 2020.
- **Sulawesi, Maluku & North Maluku** is the leading sales region at **34.77%** of total revenue, followed by Jakarta (22.99%), Sumatera & Kalimantan (17.58%), and Bali/Nusa Tenggara (12.54%). **Java is the weakest region at 12.11%**, despite being a major market.
- Average Order Value fell from **Rp312M (2020) to Rp270M (2022)**, indicating customers are spending less per transaction over time.
![Executive Summary](Images/Executive%20Summary.png)
  
### Sales Performance

- After a sharp **-17.21% YoY decline in 2021**, the business recovered slightly with **+1.93% YoY growth in 2022** — the average YoY change across the period is **-5.09%**.
- Monthly revenue peaked at **Rp13bn**, with **October and November** consistently the strongest months, pointing to a seasonal pattern likely tied to year-end demand.
- Average monthly MoM growth is **+4.16%**, showing high month-to-month volatility even though the overall yearly trend is declining.
![Sales Performance 1](Images/Sales%20Performance%20Seasonality%20by%20Month.png)
![Sales Performance 2](Images/Sales%20Performance%20YoY%20Growth.png)
  
### Product & Category

- **Bicycle** is the top-performing category, generating **Rp109.80bn (~37% of total revenue)**, followed by **Gym & Fitness (Rp84.12bn, 28.35%)** and **Golf (Rp69.03bn, 23.26%)**.
- **Road Bike** is the single best-selling product at **Rp78.19bn**, nearly double the second-best product (Stick Golf Bag, Rp39.99bn).
- Despite Bicycle leading in revenue, **Gym & Fitness has the highest order volume (91.21K units)** — meaning it sells in higher quantity but at a lower price point per unit than Bicycle.
  
### Partner Store Behaviour

- Out of **50 active partner stores**, the business is heavily **Retail-dependent (90.79% of revenue)**, with Distributors contributing only 9.21%.
- **Toko Hidup Sehat** is the top-revenue partner store at **Rp9.43bn**, closely trailed by several stores in the Rp8bn range — revenue is fairly evenly distributed among the top 10, rather than dominated by one outlier.
- **Java is the strongest region for partner store revenue (Rp88bn)**, followed by Kalimantan (Rp55bn) — this is notable because Java underperforms in the *direct sales team* view but leads in the *partner store* channel, suggesting the region is driven more by partnerships than direct sales.
  
### Sales Team & Region
- The **Sulawesi-Maluku Sales Team** is the top performer, generating **Rp103.20bn from 345 orders** — more than any other team by a wide margin.
- **Corporate Negotiation is the most effective promotion method**, driving **47% of total revenue (Rp140.42bn)**, ahead of Sales Promotion (35%) and Online Marketing (18%).
- The **Online Sales Team generates Rp52.17bn from only 194 orders**, showing a notably higher revenue-per-order than the regional field teams — worth investigating as a scalable channel.
---
 
## 🎯 Business Insights & Action Recommendation(Areas for Improvement)
 
### Strengths
- **Bicycle and Gym & Fitness categories are strong, reliable revenue drivers**, together accounting for over 65% of total revenue — a solid foundation to build future promotions around.
- **Corporate Negotiation as a sales strategy is highly effective**, generating the largest share of revenue relative to other promotion methods — this approach should be prioritized or replicated across underperforming teams.
- **Retail partner stores are diversified**, with revenue spread across many active stores rather than concentrated in one, reducing dependency risk on any single partner.
  
### Areas for Improvement
- **Overall revenue is trending downward** (-15% since 2020) and **AOV has been declining year over year** — this signals a need to investigate pricing strategy, customer retention, or market saturation.
- **Java is underperforming in direct sales despite being a large partner-store market** — this mismatch suggests the direct sales team structure in Java may need to be re-evaluated or better aligned with where partner demand already exists.
- **Distributor channel is heavily underutilized (9.21% of revenue)** — expanding distributor partnerships could diversify revenue away from Retail-channel dependency.
- **Revenue is heavily concentrated in Sulawesi** (34.77%) — while currently a strength, this also creates concentration risk; a downturn in that single region would significantly impact total company revenue.
