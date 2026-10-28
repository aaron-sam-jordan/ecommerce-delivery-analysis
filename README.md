# E-Commerce Delivery Analysis (SQL Server)

Analysis of late deliveries, reviews and revenue in the Olist Brazilian e-commerce dataset (Kaggle, ~100k orders, 9 tables).

**Question:** How big is the late-delivery problem, where and when does it happen, and what does it cost?

**Tools:** SQL Server, SSMS, Git/GitHub (Power BI dashboard coming)

## Key findings
- **8.1% of orders arrive late** (7,826 of 96,478 delivered).
- **RJ (13.5%) and BA (14.0%)** are the biggest problem states. SP (5.9%) is better than average.
- **Three months cause 46% of late orders:** Nov 2017, Feb 2018, Mar 2018.
- **Most late orders are mild:** 40% are 0-3 days late. About 3% of all orders arrive over a week late.
- **Late orders get far lower reviews:** 2.57 stars vs 4.29 for on-time.
- **Only 3.1% of customers order again** (2,997 of 96,096).
- **Revenue grew in 2017, then flattened in 2018.** Running total is about 13.2M BRL by Aug 2018.

## Queries (`sql/`)
| File | Question |
|---|---|
| 01_setup and fixes | Database setup and fixes |
| 02_late delivery | Share of orders that arrive late |
| 03_late by state wise | Late rate by customer state |
| 04_late by seller state wise | Late orders by seller state |
| 05_late rate by month | Late rate by month |
| 06_when and how many days late | How late are the late orders |
| 07_customer reorders | Repeat customers |
| 08_Delivery review | Late delivery vs review score |
| 09_Total revenue and operational cost | Monthly revenue and running total |

## Data notes
- Real customers are counted with `customer_unique_id`, not `customer_id`.
- 610 products have no category; `review_id` is not unique; 1,339 geolocation coordinate cells failed to import.

## Limitations
The data shows where and when orders are late, not why. Reviews show association, not proof of cause. Revenue is item price only, in Brazilian Real.
