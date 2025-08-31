# 🍕 Pizza Sales Analysis (SQL + Power BI)

This project showcases **Pizza Sales Analysis** using **SQL** for data exploration and **Power BI** for visualization.  
It highlights key sales trends, customer behavior, and performance insights across categories, sizes, and time periods.

---

## 📊 Dataset
- **Source:** Pizza Sales dataset (2015)  
- **Records:** ~48K pizzas sold across 21K orders  
- **Fields:** Order details, date, time, category, size, price, ingredients, etc.  

---

## ⚙️ SQL Analysis
Key SQL queries performed:  
- ✅ Total Revenue (~817K)  
- ✅ Total Orders (21,350)  
- ✅ Total Pizzas Sold (49,574)  
- ✅ Average Order Value (38.31)  
- ✅ Average Pizzas per Order (2.32)  
- ✅ Daily & Monthly Order Trends  
- ✅ % Sales by Category (Classic, Supreme, Veggie, Chicken)  
- ✅ % Sales by Pizza Size (Large, Medium, Small, etc.)  
- ✅ Top & Bottom 5 Bestsellers by Revenue, Quantity, and Orders  

(See [`Pizza_sales.sql`](./Pizza_sales.sql) for all queries)

---

## 📈 Power BI Dashboard
The interactive dashboard includes:  
- **KPI Cards:** Total Revenue, Orders, Average Order Value, Avg Pizzas/Order  
- **Trends:** Daily and Monthly Order Trends  
- **Insights:**  
  - Busiest Days → Weekends (Fri & Sat)  
  - Peak Months → July & January  
  - Best Category → Classic Pizzas  
  - Best Size → Large Pizzas  
- **Visuals:**  
  - Sales % by Category & Size  
  - Total Pizzas Sold by Category  
  - Top Performers  

---

## 🚀 How to Run
1. **SQL Analysis**  
   - Load `Pizza_sales.sql` into PostgreSQL/MySQL/SQL Server  
   - Run queries to extract KPIs and insights  

2. **Power BI Dashboard**  
   - Open the `.pbix` file in Power BI Desktop  
   - Connect to the Pizza Sales dataset  
   - Explore the interactive dashboard  

---

## 🔮 Future Improvements
- Add predictive analysis for future sales trends  
- Create DAX measures for deeper insights in Power BI  
- Deploy dashboard to Power BI Service for online access  

---

## 📂 Repository Structure
