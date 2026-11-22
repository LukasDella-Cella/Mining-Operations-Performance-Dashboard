-- MINING OPERATIONS DASHBOARD
-- SQL Data Analysis
-- Database: SQLite
-- Dataset: Mining Operations
-- Total Records: 360
-- =====================================================


-- 1. OVERALL OPERATIONAL KPIs

SELECT
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate
FROM mining_operations;









-- =====================================================
-- 2. PRODUCTION PERFORMANCE BY RIG
-- =====================================================

SELECT
    Rig_ID,
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate
FROM mining_operations
GROUP BY Rig_ID
ORDER BY Achievement_Rate DESC;






-- =====================================================
-- 3. DOWNTIME ANALYSIS BY RIG
-- =====================================================

SELECT
    Rig_ID,
    ROUND(SUM(Downtime_Hours), 2) AS Total_Downtime_Hours
FROM mining_operations
GROUP BY Rig_ID
ORDER BY Total_Downtime_Hours DESC;





-- =====================================================
-- 4. FUEL CONSUMPTION BY RIG
-- =====================================================

SELECT
    Rig_ID,
    ROUND(SUM(Fuel_Consumption_L), 2) AS Total_Fuel_Consumption_L
FROM mining_operations
GROUP BY Rig_ID
ORDER BY Total_Fuel_Consumption_L DESC;



-- =====================================================
-- 5. FUEL EFFICIENCY BY RIG
-- =====================================================

SELECT
    Rig_ID,
    ROUND(
        SUM(Fuel_Consumption_L) /
        SUM(Actual_Meters), 3
    ) AS Fuel_Per_Meter_L
FROM mining_operations
GROUP BY Rig_ID
ORDER BY Fuel_Per_Meter_L ASC;







-- =====================================================
-- 6. PRODUCTION PERFORMANCE BY SHIFT
-- =====================================================

SELECT
    Shift,
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(SUM(Downtime_Hours), 2) AS Total_Downtime_Hours,
    ROUND(SUM(Fuel_Consumption_L), 2) AS Total_Fuel_L,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate
FROM mining_operations
GROUP BY Shift
ORDER BY Achievement_Rate DESC;







-- =====================================================
-- 7. PRODUCTION PERFORMANCE BY SITE
-- =====================================================

SELECT
    Site,
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(SUM(Downtime_Hours), 2) AS Total_Downtime_Hours,
    ROUND(SUM(Fuel_Consumption_L), 2) AS Total_Fuel_L,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate
FROM mining_operations
GROUP BY Site
ORDER BY Achievement_Rate DESC;








-- =====================================================
-- 8. OPERATOR PERFORMANCE ANALYSIS
-- =====================================================

SELECT
    Operator_ID,
    COUNT(*) AS Total_Records,
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate,
    ROUND(AVG(Actual_Meters), 2) AS Avg_Actual_Meters,
    ROUND(AVG(Downtime_Hours), 2) AS Avg_Downtime_Hours
FROM mining_operations
GROUP BY Operator_ID
ORDER BY Achievement_Rate DESC;







-- =====================================================
-- 9. SAMPLE COLLECTION ANALYSIS
-- =====================================================

SELECT
    Operator_ID,
    COUNT(*) AS Total_Records,
    SUM(Samples_Collected) AS Total_Samples,
    ROUND(AVG(Samples_Collected), 2) AS Avg_Samples_Per_Record
FROM mining_operations
GROUP BY Operator_ID
ORDER BY Total_Samples DESC;




-- =====================================================
-- 10. MAINTENANCE IMPACT ANALYSIS
-- =====================================================

SELECT
    Maintenance_Flag,
    COUNT(*) AS Total_Records,
    SUM(Planned_Meters) AS Total_Planned_Meters,
    SUM(Actual_Meters) AS Total_Actual_Meters,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Achievement_Rate,
    ROUND(AVG(Downtime_Hours), 2) AS Avg_Downtime_Hours,
    ROUND(
        SUM(Fuel_Consumption_L) /
        SUM(Actual_Meters), 3
    ) AS Fuel_Per_Meter_L
FROM mining_operations
GROUP BY Maintenance_Flag
ORDER BY Maintenance_Flag;









-- =====================================================
-- 11. DAILY PRODUCTION ANALYSIS
-- =====================================================

SELECT
    Date,
    SUM(Planned_Meters) AS Daily_Planned_Meters,
    SUM(Actual_Meters) AS Daily_Actual_Meters,
    ROUND(
        SUM(Actual_Meters) * 100.0 /
        SUM(Planned_Meters), 2
    ) AS Daily_Achievement_Rate
FROM mining_operations
GROUP BY Date
ORDER BY Date;










