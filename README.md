# 📘 Website Analytics and Conversion Rate Optimization
****************************************************************************************************************************************************************************************************************
   
## 📖 PROJECT OVERVIEW  
****************************************************************************************************************************************************************************************************************
   
This project analyzes e-commerce website data to understand user behavior, traffic sources, and purchase patterns. Used SQL, Power BI, Excel and Python to provide insights that improve conversion rates and business decision making.


## 📂 DATASET OVERVIEW
****************************************************************************************************************************************************************************************************************
   

- Users Table : [users.csv](https://github.com/user-attachments/files/22623244/users.csv)

      
     - Purpose: Stores information about website visitors.
     

- Sessions Table : [sessions.csv](https://github.com/user-attachments/files/22623301/sessions.csv)


     - Purpose: Tracks user visits (sessions) to the website.
     

- Events Table : [events1.xlsx](https://github.com/user-attachments/files/22623549/events1.xlsx)


     - Purpose: Stores user actions during sessions.
     

- Items Table : [items.csv](https://github.com/user-attachments/files/22623363/items.csv)

     
     - Purpose: Contains product catalog details.
     


## 🛠️ TOOLS & TECHNOLOGIES USED 
   ****************************************************************************************************************************************************************************************************************
   

### 📜 Excel :

✔️ Used Power Query for data cleaning, validation, and type checks to ensure data integrity.

✔️ Built pivot tables and cross-verified SQL vs Power BI outputs for funnel accuracy and consistency.

   ****************************************************************************************************************************************************************************************************************
   

### 🐍 Python :

✔️ Analyzed session-level event data in Python to measure user behavior, segment by device and traffic source, and model funnel stages—revealing bounce rate, session revenue, and key drop-offs in conversion performance


✔️ Visualizations :

  👉 Funnel Chart (Vertical Bar Chart): Displayed drop-offs at each stage of the purchase journey

    
   ****************************************************************************************************************************************************************************************************************
   
   <img width="600" height="400" alt="funnel_counts_nb" src="https://github.com/user-attachments/assets/6e4c50c8-bb8c-4c6a-92ae-98da364a1851" />

   ****************************************************************************************************************************************************************************************************************
   
        
   Top 10 Items by Revenue (Horizontal Bar Chart): Ranked products by total revenue contribution
           ****************************************************************************************************************************************************************************************************************
   
   <img width="1000" height="600" alt="top_items_by_revenue" src="https://github.com/user-attachments/assets/297ae6ad-0cdf-4637-ad4d-9bed8425f5b9" />

****************************************************************************************************************************************************************************************************************
   
        
   Conversion Rate by Device (Vertical Bar Chart): Compared conversion performance across desktop, mobile, and tablet segments
     ****************************************************************************************************************************************************************************************************************
   
   <img width="800" height="500" alt="conversion_rate_by_device" src="https://github.com/user-attachments/assets/1925b221-dd0e-46cc-9e0e-d5ca89a1c7a2" />
        
****************************************************************************************************************************************************************************************************************
   

### 🛢️ SQL :

✔️ Analyzed user segmentation, funnel drop-offs, and bounce patterns to uncover mobile conversion gaps.
  
✔️ Identified loyal desktop users driving session revenue and high-LTV behaviors through funnel and session-level metrics.

****************************************************************************************************************************************************************************************************************
   

### 📊 Power BI :

✔️ Built a dynamic dashboard titled “Funnel & User Flow Dashboard” to track key performance metrics:

   ➡️ Users: 36491M
  
   ➡️ Sessions: 18K
  
   ➡️ Events: 754K
  
   ➡️ Conversions: 17.9K

      
✔️ Visualized conversion rate, bounce rate, funnel flow, and user journey using donut, Horizontal bar, funnel, and vertical bar charts.

****************************************************************************************************************************************************************************************************************
    
 <img width="1275" height="720" alt="Screenshot 2025-09-30 223507" src="https://github.com/user-attachments/assets/314e4135-2bd6-46e6-bf88-04a3fee3cb38" />


****************************************************************************************************************************************************************************************************************
   



 

  

## ⚡ PROJECT FLOW & STRUCTURE 
****************************************************************************************************************************************************************************************************************
   

     📁Website_Analytics_and_Conversion_Rate_Optimization/
      │ 
      ├── 📁 Data/                         # Raw datasets
      │    ├── users.csv                      # User details
      │    ├── sessions.csv                   # Website sessions
      │    ├── events1.xlsx                   # User events (page views, clicks, cart, etc.)
      │    └── items.csv                      # Product/item details
      │
      ├── 📁 Excel/                        # Data Preprocessing
      │    └── data_cleaning                  # Data preprocessing & cleaning
      │ 
      ├── 📁 Python/                       # Python scripts & notebooks
      │    ├── PROJECT C PYTHON FILE.ipynb    # Funnel conversion analysis
      │    └── visualization                  # Charts (matplotlib / plotly)
      │ 
      ├── 📁 SQL/                          # SQL scripts
      │    └── PROJECT C SQL FILE.sql          # Queries for funnel, drop-off, and conversion analysis
      │
      ├── 📁 Power BI/                     # Power BI dashboards
      │    └── PROJECT C DASHBOARD.pbix        # Interactive visualization & KPIs
      │
      └── README.md                         # Project documentation


   







