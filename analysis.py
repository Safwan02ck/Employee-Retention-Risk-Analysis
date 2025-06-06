import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Connect to MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Blackstormer@02",
    database="employee_retention"
)
cursor = db.cursor()

# Query: Employees with high workload and low ratings
query = """
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    AVG(p.rating) AS avg_rating,
    SUM(pr.hours_logged) AS total_hours
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN performance p ON e.emp_id = p.emp_id
LEFT JOIN projects pr ON e.emp_id = pr.emp_id
GROUP BY e.emp_id
HAVING avg_rating < 3.5 AND total_hours > 100;
"""

cursor.execute(query)
results = cursor.fetchall()

# Convert to DataFrame
df = pd.DataFrame(results, columns=[
    'emp_id', 'emp_name', 'salary', 'dept_name', 'avg_rating', 'total_hours'
])

# Generate Visualization
plt.figure(figsize=(10, 6))
sns.scatterplot(
    data=df,
    x='total_hours',
    y='avg_rating',
    hue='dept_name',
    size='salary',
    sizes=(50, 200)
)
plt.title("Employee Retention Risk Analysis")
plt.xlabel("Total Project Hours")
plt.ylabel("Average Performance Rating")
plt.axhline(y=3.5, color='r', linestyle='--', alpha=0.5)
plt.axvline(x=100, color='r', linestyle='--', alpha=0.5)
plt.grid(True)
plt.savefig('retention_risk.png')
plt.show()

# Close connections
cursor.close()
db.close()