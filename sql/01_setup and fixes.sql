-- 01_setup_and_fixes.sql
-- Setup record for the ecommerce_analysis database (Olist dataset).
-- This documents is a completed one. so The tables already exist.

-- NOTE: all fixes below were already applied. This file is a record, do not rerun.

CREATE DATABASE ecommerce_analysis;
GO
USE ecommerce_analysis;
GO

-- All 9 tables were loaded with SSMS "Import Flat File":
-- orders, customers, order_items, products, sellers,
-- order_payments, order_reviews, category_translation, geolocation


-- Fix 1: orders was imported with ".csv" in its name
EXEC sp_rename 'dbo.[olist_orders_dataset.csv]', 'orders';

-- Fix 2: category_translation loaded its header as a data row
DELETE FROM dbo.category_translation
WHERE column1 = 'product_category_name';

EXEC sp_rename 'category_translation.column1', 'product_category_name', 'COLUMN';
EXEC sp_rename 'category_translation.column2', 'product_category_name_english', 'COLUMN';