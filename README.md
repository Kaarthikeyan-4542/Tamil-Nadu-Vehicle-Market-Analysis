# Tamil Nadu Vehicle Market Analytics (End-to-End Data Engineering Project)

## 📊 Project Overview
This project analyzes **55,877 vehicle registration records** from Tamil Nadu (2020-2025) to uncover trends in EV adoption, luxury market penetration, and fuel preferences. 

Unlike standard dashboards, this project implements a full **ETL Pipeline**:
1. **Extraction & Transformation:** Python script cleans raw data, standardizes messy text using Regex, and categorizes vehicles (Budget vs. Luxury).
2. **Data Warehousing:** Data is loaded into a **PostgreSQL** database modeled with a **Star Schema** (Fact & Dimension tables).
3. **Visualization:** Power BI connects to **SQL Views** (not raw tables) to ensure high-performance reporting.

## 🛠 Tech Stack
- **Python:** Pandas, NumPy, SQLAlchemy (ETL & Data Cleaning)
- **SQL (PostgreSQL):** Data Warehousing, View Creation, Normalization
- **Power BI:** DAX, Geospatial Analysis, Interactive Dashboards

## 🔍 Key Insights & Business Impact
- **EV Growth Reality:** Identified a correlation between FAME-II subsidy cuts and the stagnation of EV 2-wheeler sales in 2023-24.
- **"Hidden Wealth" Discovery:** Geospatial analysis revealed a high concentration of luxury vehicles in **Vaniyambadi (Tier-3 town)**, correlated with the region's leather export industry.
- **Diesel Decline:** Validated the market shift away from small diesel cars due to BS6 regulations (post-2020).
- **Market Segmentation:** Determined that the luxury car segment has only 0.95% market share , still budget car segment commands the market with 99.05% market shares.

## ⚙️ Architecture
**Raw Data (CSV)** → **Python ETL Script** → **PostgreSQL (Star Schema)** → **Power BI Dashboard**

## 🚀 How to Run
1. **Database Setup:** Create a database named `vehicle_analytics_db` in PostgreSQL.
2. **Run ETL:** Execute `vehicle_registration_analysis.ipynb` to clean and load the data.
3. **Create Views:** Run the SQL scripts in `sql_views.sql` to generate analytical views.
4. **Dashboard:** Open `Vehicle_Analytics.pbix` and click 'Refresh'.

## Dataset : I wasn't able to upload the dataset since it was in big size , i used the kaggle's (Indian Vehicle Registration Data(2020-2025)
