# KORE
KORE ETL Sample task
1-First of all, pls run "DB_setup.sql" on the SSMS.
2-Then, Run "UpsertProdUsers.sql" on the SSMS.
3-Unzip the Kore Folder. 
  There is a "Source Files" folder, you can find the sql files which you run at step 1 and 2 and one CSV file "Users" which is the source file of home task.
  There is another Folder "LOGFiles" which includes "CSV Error Output" Excel file. The rows which have columns with uncompatible values are saved at these file during the load process, after "Data Conversion".
  and the third and last folder is SSIS project which is named "Kore_SSIS_Mehrnaz_Tajfar.

-----
SSIS Project:
At "control Flow" pane :
  -CSV 2 Stg : This data flow task, extracts the csv file then trimming the first and last character of strings which are (""), then the trimmed datas goes to "Data Conversion" and their data type are assigned, 
  after the transformation, the correct rows load to Stg table of DB. And, the error outputs would be sent to an Exel file "CSV Error Output" under the "LOGFiles" Folder.
  -Stg 2 Orod Upsert SP: this component excuted SQL task which is the SP at step 2. The rows of Prod.Users that have common UserID with Stg.User would be updated. and the rows which left in Stg.Users and do not have a same     UserId at Prod.Users would be inserted. ( Please read the description of "UpsertProdUsers.sql" file on Git for more details.)
----

4- There is a .PNG file "Prod_users_Results.png" which is a screenshot of Prod.Users table resultset after running SSIS package. Unfortunately, I couldn't save the backup on Disk due to permission issues.
  
  

