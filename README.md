# my-project-3
# OEWS Employment and Wage Data Project
This project involves analyzing and storing the Occupational Employment and Wage Statistics (OEWS) data in a PostgreSQL database. The data is sourced from the Bureau of Labor Statistics (BLS) and provides detailed information about employment, wages, and occupation statistics across different U.S. states.

## Project Overview
We use data from the May 2023 OEWS release, which contains employment and wage estimates for various occupations across the United States. The project focuses on loading this data into a relational database for querying and further analysis.

## Data Source

* **Occupational Employment and Wage Statistics (OEWS)**
* Learn more about the OEWS data [read here](https://www.bls.gov/oes/oes_emp.htm).

 


* **Download May 2023 All Data XLS file**

You can download the May 2023 OEWS data from [this link](https://www.bls.gov/oes/tables.htm). Be sure to explore the 2nd tab ("Field descriptions") for more information on the dataset's structure.




* **OEWS Occupation Profiles:** Overview of occupation categories in the dataset.
[View here](https://www.bls.gov/oes/current/oes_stru.htm)


* **OEWS Documentation:** Technical notes and background methodology.
[Read here](https://www.bls.gov/oes/oes_doc.htm)


* **Frequently Asked Questions:** Helpful Q&A for working with the OEWS data.
[FAQ](https://www.bls.gov/oes/oes_ques.htm)



* **OEWS Maps:** Data visualization.
[Explore here](https://www.bls.gov/oes/current/map_changer.htm)


# Database Schema

We designed a PostgreSQL database to store the cleaned OEWS data. The database schema consists of three main tables: EmploymentWage_Table, State_Table, and Occupation_Table. Below is an entity-relationship diagram (ERD) illustrating the relationships between the tables.


![alt text](image.png)

# Table Descriptions

1. #### EmploymentWage_Table

    * Stores employment and wage data at the state and occupation levels.
    * **Primary Key**: (area, occ_code)
    * **Foreign Keys**: area (references State_Table), occ_code (references Occupation_Table)

2. #### State_Table

    * Stores state-level geographic information.
    * **Primary Key**: area

3. #### Occupation_Table

    * Stores occupation details including occupation codes and titles.
    * **Primary Key**: occ_code
# Setup Instructions

To replicate the project, follow these steps:

1. **Clone the Repository**


    git clone https://github.com/hamiltonbrba/Project-3.git
    cd your-repo-url

2. **Install Dependencies**

 The following Python packages installed:

    * pandas
    * psycopg2
    * dotenv

    Installed the dependencies using pip:


    pip install pandas psycopg2 python-dotenv

3. **Load the OEWS Data** Downloaded the OEWS Excel file from here and load it into a pandas DataFrame:


    `import pandas as pd`
    `all_oews_df = pd.read_excel("Data/all_data_M_2023.xlsx")`

4. **Data Cleaning and Transformation** Narrow down the dataset to state-level data and clean it for easier usage:

    `state_oews_df = all_oews_df[all_oews_df['AREA_TYPE'] == 2]`
    `clean_oews_df = state_oews_df[['AREA', 'AREA_TITLE', 'PRIM_STATE', 'OCC_CODE', ...]]`
    `renamed_oews_df = clean_oews_df.rename(columns={ ... })`

5. **Export Cleaned Data to CSV** Save the cleaned data as a CSV file:


    `renamed_oews_df.to_csv('data/EmploymentWageData.csv', index=False)`

6. **Setup PostgreSQL Database** Ensure you have PostgreSQL installed and create the database schema:


    `CREATE TABLE "State_Table" (...);`
    `CREATE TABLE "Occupation_Table" (...);`
    `CREATE TABLE "EmploymentWage_Table" (...);`

7. **Run the ETL Process** Establish a connection to the PostgreSQL database and load the cleaned data:


8. **Run Queries** Use SQL to query the employment and wage data for analysis.

9. **additional library used psycopg**
import psycopg2
    connection = psycopg2.connect(
        host=os.getenv('DB_HOST2'),
        port=os.getenv('DB_PORT2'),
        database=os.getenv('DB_NAME2'),
        user=os.getenv('DB_USER2'),
        password=os.getenv('DB_PASS2')
    )
cursor = connection.cursor()
      [text](../Project-3/SQL-Psycopg2.ipynb)
      
# Ethical consideration

      In this project, we prioritized the responsible use of publicly available data from the Bureau of Labor Statistics (BLS) Occupational Employment and Wage Statistics (OEWS) survey. Since the BLS data is fully anonymized and aggregated, no personally identifiable information (PII) was included, ensuring privacy protection. We adhered to the BLS guidelines for public data access and distribution, focusing on accurate and transparent reporting of employment and wage statistics. Care was taken to present the data objectively and clearly, with proper context to avoid any misleading interpretations. The project also aimed to highlight key economic trends, particularly employment and wage disparities, while maintaining ethical standards in data usage and communication.


# Contributors

* Yen Lu
* Bryan HB
* Stephanie Ayala
* Nebiat Beyene
* Adebola Shellby


    Role: Data Engineering, ETL Pipeline

# code source

* Simon Kingaby
* UNC bootcamp data analytics class resources
