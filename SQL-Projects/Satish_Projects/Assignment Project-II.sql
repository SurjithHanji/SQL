create database project_2;
use project_2;

show tables;

/* 1. Total Number of Patients */

select sum(patients_count) as total_patients from hospital_data;

/* 2. Average Number of Doctors per Hospital */

    SELECT hospital_Name, round(AVG(Doctors_Count),0) AS Doctors_Per_Hospital
    FROM Hospital_Data
    GROUP BY hospital_Name;


/* 3. Top 3 Departments with the Highest Number of Patients  */

select department,sum(patients_count) as total
from hospital_data
group by department
order by total desc limit 3;

/* 4. Hospital with the Maximum Medical Expenses */

select * from hospital_data 
order by medical_expenses desc limit 1;

/* 5. Daily Average Medical Expenses */

select str_to_date(discharge_date,'%d-%m-%y')as date_h,
	round(avg(medical_expenses),2) as daily_avg_medical_expense
    from hospital_data
    group by str_to_date(discharge_date,'%d-%m-%y')
order by date_h;

/* 6. Longest Hospital Stay */

SELECT Hospital_Name,Location,Department,Admission_Date,Discharge_Date,
    DATEDIFF(
        STR_TO_DATE(Discharge_Date, '%d-%m-%Y'),
        STR_TO_DATE(Admission_Date, '%d-%m-%Y')
    ) AS Hospital_Stay_Days,Medical_Expenses
FROM Hospital_Data
ORDER BY Hospital_Stay_Days DESC
LIMIT 1;


/*  7. Total Patients Treated Per City */

select location,sum(patients_count) as total_patients_per_city
from hospital_data
group by location;

/* 8. Average Length of Stay Per Department */

SELECT
    Department,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(Discharge_Date, '%d-%m-%Y'),
        STR_TO_DATE(Admission_Date, '%d-%m-%Y')
    )), 2) AS Average_Stay_Days
FROM
    Hospital_Data
GROUP BY
    Department
ORDER BY
    Average_Stay_Days DESC;

/* 9. Identify the Department with the Lowest Number of Patients */

select department,sum(patients_count) as no_of_patients
from hospital_data
group by department
order by no_of_patients asc limit 1;

/* 10. Monthly Medical Expenses Report */

SELECT
    DATE_FORMAT(STR_TO_DATE(Discharge_Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    ROUND(SUM(Medical_Expenses), 2) AS Total_Medical_Expenses
FROM
    Hospital_Data
GROUP BY
    DATE_FORMAT(STR_TO_DATE(Discharge_Date, '%d-%m-%Y'), '%Y-%m')
ORDER BY
    Month;




select * from hospital_data;