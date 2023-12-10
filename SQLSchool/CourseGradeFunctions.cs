using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SQLSchool
{
    public class CourseGradeFunctions
    {
        public static void ListAllCourseGrades()
        {
            Console.Clear();
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT s.FirstName, s.LastName, " +
                    "c.CourseName, cg.DateOfGradeSetting, g.Grade FROM CourseGrades cg JOIN Students s " +
                    "ON s.StudentID = cg.StudentID JOIN Courses c ON c.CourseID = cg.CourseID JOIN Grades g " +
                    "ON g.GradeID = cg.GradeID WHERE DateOfGradeSetting >= DATEADD(month, -1, GETDATE())", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        Console.WriteLine("Course grades set in the past month:");
                        Console.WriteLine("\n--------------------------------------------\n");
                        while (reader.Read())
                        {
                            string firstName = reader.GetString(reader.GetOrdinal("FirstName"));
                            string lastName = reader.GetString(reader.GetOrdinal("LastName"));
                            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
                            int grade = reader.GetInt32(reader.GetOrdinal("Grade"));

                            Console.WriteLine($"{firstName} {lastName}, {courseName}: {grade}");
                        }
                    }
                }
            }
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }




        public static void ListCourseGradeStatistics()
        {
            Console.Clear();
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT c.CourseName, AVG(g.Grade) AS AverageCourseGrade " +
            "FROM CourseGrades cg JOIN Courses c ON cg.CourseID = c.CourseID JOIN Grades g ON g.GradeID = cg.GradeID GROUP BY CourseName", connection))

                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        Console.WriteLine("--- The average grade set in every course ---\n");
                        while (reader.Read())
                        {

                            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
                            int averageCourseGrade = reader.GetInt32(reader.GetOrdinal("AverageCourseGrade"));

                            Console.WriteLine($"{courseName}: {averageCourseGrade}");
                        }
                    }
                }
                Console.WriteLine("\n--------------------------------------------");
                using (SqlCommand command = new SqlCommand("SELECT c.CourseName, MAX(g.Grade) AS HighestCourseGrade " +
            "FROM CourseGrades cg JOIN Courses c ON cg.CourseID = c.CourseID JOIN Grades g ON g.GradeID = cg.GradeID GROUP BY CourseName", connection))

                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        Console.WriteLine("--- The highest grade set in every course ---\n");
                        while (reader.Read())
                        {

                            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
                            int highestCourseGrade = reader.GetInt32(reader.GetOrdinal("HighestCourseGrade"));

                            Console.WriteLine($"{courseName}: {highestCourseGrade}");
                        }
                    }
                }
                Console.WriteLine("\n--------------------------------------------");
                using (SqlCommand command = new SqlCommand("SELECT c.CourseName, MIN(g.Grade) AS LowestCourseGrade " +
            "FROM CourseGrades cg JOIN Courses c ON cg.CourseID = c.CourseID JOIN Grades g ON g.GradeID = cg.GradeID GROUP BY CourseName", connection))

                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        Console.WriteLine("--- The lowest grade set in every course ---\n");
                        while (reader.Read())
                        {

                            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
                            int lowestCourseGrade = reader.GetInt32(reader.GetOrdinal("LowestCourseGrade"));

                            Console.WriteLine($"{courseName}: {lowestCourseGrade}");
                        }
                    }
                }
            }
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }
    }
}
