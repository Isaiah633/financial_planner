##Overview
I created a process to assist individuals and businesses with financial planning and budgeting. My goal was to create an easy to follow, duplicatable process to organize income and expenses in order to help individuals and businesses looking to develop a plan. This project provides a structured, repeatable process for organizing income and expenses, assisting individuals and businesses with financial planning and budgeting. The workflow involves extracting financial data, transforming it using SQL, and visualizing insights in Google Looker Studio.


##Walkthrough
The first step is downloading bank and credit card statements in CSV format. Next the statements are uploaded to BigQuery as new data tables. Using SQL, the Date, Description, and Amount columns of the transactions from the various Data Tables from different banks and credit cards are merged together as one table using UNION ALL, and a new colum is created to identify the source of the data. The data is represented differently by different institutions so it needs to be standardized and unified.  This is accomplished using CTE’s (common table expressions). Now that discrepancies between different data sets have been taken out and a new unified data set has been generated, another SQL query is run on this new table that now contains all of the data from the different bank accounts and credit cards. This new query also uses CTE and a column is added that categorizes all the transactions based on their description or any other applicable metric, and a new updated table is created in BigQuery. Now that the data is complete, it is uploaded to Google Looker Studio as a google sheets or Excel file. Then the data can be incorporated into different graphs and charts on Looker Studio. The data can be organized by income and expenses, and various categories of income and expenses can be organized by cash amounts or volume of transactions, or in any other way that is useful for the user. This data now in its final form is easy to understand and visualize, and can be used for financial planning and budgeting. 


I have included SQL code that I used for combining and standardizing the various financial statements, as well as the code for categorizing different transactions.  


Below is a link to my Looker Studio dashboard, as well as the tables and graphs generated:
https://lookerstudio.google.com/reporting/19374324-3820-4890-a3d0-1635358f8057

![UNADJUSTEDNONRAW_thumb_24](https://github.com/user-attachments/assets/a7c3dac9-f619-497e-a0d3-a36775cac4ea)

![UNADJUSTEDNONRAW_thumb_25](https://github.com/user-attachments/assets/d7512486-eaef-4ebe-a70a-31ac8c25dd02)
![Image 2-13-25 at 8 30 PM](https://github.com/user-attachments/assets/a7e0d815-21e2-4c86-8366-b06a3d6a447b)
![Image 2-13-25 at 8 31 PM](https://github.com/user-attachments/assets/97cf6457-4db9-4a72-891e-c186615e0fd8)
![Image 2-13-25 at 8 31 PM (1)](https://github.com/user-attachments/assets/96ea6669-5771-47b1-bc94-4149310bcf2a)
![UNADJUSTEDNONRAW_thumb_29](https://github.com/user-attachments/assets/e354a365-45a6-4882-af18-fa04b1724c3f)
![UNADJUSTEDNONRAW_thumb_2a](https://github.com/user-attachments/assets/42f8cff9-9f6a-45a3-8e66-1fedf73a6b39)
