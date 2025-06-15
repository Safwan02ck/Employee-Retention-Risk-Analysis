Employee Retention Risk Analysis--

A comprehensive data analysis project that identifies employees at high risk of leaving the organization by analyzing performance metrics, workload patterns, and departmental data stored in a MySQL database. The system provides visual insights through interactive charts and automated risk assessment.

Project Overview:

This project combines database analysis with data visualization to help HR departments identify potential employee retention risks. By analyzing employee performance ratings, project workload, salary information, and departmental data, the system flags employees who may be at risk of leaving due to high workload combined with poor performance ratings.

Project Structure:

```
Employee-Retention-Risk-Analysis/
├── analysis.py              # Main analysis script
├── database_schema.sql      # MySQL database schema and sample data
├── README.md               # Project documentation
├── retention_risk.png      # Generated visualization output
└── .vscode/               # VS Code configuration
```

Key Features:

- Database-Driven Analysis: Connects to MySQL database to retrieve real-time employee data
- Risk Assessment Algorithm: Identifies employees with high workload (>100 hours) and low performance ratings (<3.5)
- Multi-Dimensional Visualization: Creates scatter plots showing the relationship between workload, performance, department, and salary
- Automated Reporting: Generates visual reports saved as PNG files
- Cross-Departmental Analysis: Compares retention risk across different departments

Database Schema:

The project uses a MySQL database with the following structure:

Tables:
- `employees`: Core employee information (ID, name, department, salary, hire date)
- `departments`: Department details (ID, name)
- `projects`: Project assignments and hours logged per employee
- `performance`: Performance review ratings (1-5 scale)

Key Relationships:
- Employees belong to departments
- Projects are assigned to employees
- Performance reviews are linked to employees

Analysis Logic

The main analysis identifies at-risk employees using these criteria:
- High Workload: Total project hours > 100
- Low Performance: Average performance rating < 3.5

The system aggregates data across multiple tables to provide comprehensive employee profiles including:
- Total hours worked across all projects
- Average performance ratings from reviews
- Salary and departmental information

Visualization Features:

The generated scatter plot includes:
- X-axis: Total project hours logged
- Y-axis: Average performance rating
- Color coding: Different departments
- Bubble size: Represents salary levels
- Risk boundaries: Red dashed lines at 100 hours and 3.5 rating thresholds

Technologies Used

- Python 3.x: Core programming language
- MySQL: Database management system
- pandas: Data manipulation and analysis
- matplotlib: Basic plotting functionality
- seaborn: Statistical data visualization
- mysql-connector-python: Database connectivity

Prerequisites

Before running this project, ensure you have:

1. MySQL Server installed and running
2. Python 3.x with the following packages:
   - `mysql-connector-python`
   - `pandas`
   - `matplotlib`
   - `seaborn`

Installation & Setup:

1. Clone the Repository
```bash
git clone <repository-url>
cd Employee-Retention-Risk-Analysis
```

2. Install Required Packages
```bash
pip install mysql-connector-python pandas matplotlib seaborn
```

3. Set Up Database
```bash
# Log into MySQL
mysql -u root -p

# Run the schema file
source database_schema.sql
```

4. Configure Database Connection
Update the database connection parameters in `analysis.py`:
```python
db = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="employee_retention"
)
```

How to Run:

1. Ensure MySQL is running with the employee_retention database set up
2. Execute the analysis script**:
   ```bash
   python3 analysis.py
   ```
3. View results**:
   - The script will display a scatter plot on screen
   - A PNG file `retention_risk.png` will be saved in the project directory
   - Console output will show any employees identified as at-risk

Output & Results-

Console Output:
The script displays a DataFrame showing employees who meet the risk criteria, including:
- Employee ID and Name
- Salary and Department
- Average Performance Rating
- Total Project Hours

Visual Output:
- Interactive Plot: Displays immediately when script runs
- **Saved File**: `retention_risk.png` contains the same visualization for reports

Risk Identification:
Employees appearing in the lower-right quadrant of the plot (high hours, low rating) are flagged as retention risks.

Customization Options:

### Modify Risk Thresholds
Edit the SQL query in `analysis.py` to adjust risk criteria:
```sql
HAVING avg_rating < 3.5 AND total_hours > 100;
```

Visualization Styling:
Customize the plot appearance by modifying:
- Color schemes (`hue` parameter)
- Size scaling (`sizes` parameter)
- Figure dimensions (`figsize`)
- Threshold lines (axhline/axvline values)

Sample Data:

The database includes sample data for:
- 3 departments (Engineering, Marketing, HR)
- 3 employees with varying performance and workload patterns
- Project assignments with different completion statuses
- Performance reviews with ratings from 1-5

Future Enhancements:

Potential improvements for this project:
- **Predictive Modeling**: Add machine learning models for attrition prediction
- **Real-time Dashboard**: Web-based interface for live monitoring
- **Additional Metrics**: Include tenure, overtime, and satisfaction scores
- **Email Alerts**: Automated notifications for HR when new risks are identified
- **Historical Trending**: Track retention risk changes over time

Contributing:

To contribute to this project:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

License:

This project is available for educational and commercial use. Please refer to the license file for detailed terms.

Support:

For questions or issues:
- Check the database connection settings
- Ensure all required Python packages are installed
- Verify MySQL service is running
- Review the console output for specific error messages

---

**Note**: Remember to update the database credentials in `analysis.py` before running the analysis. The current credentials are for demonstration purposes only.
