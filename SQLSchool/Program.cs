using System.Data.SqlClient;
using System.Diagnostics.Tracing;
using System.Xml.Serialization;

namespace SQLSchool
{
    public class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine(" --- Menu ---\n");
                Console.WriteLine("1. See a list of all students.");
                Console.WriteLine("2. See a list of all classes.");
                Console.WriteLine("3. Add a new staff member.");
                Console.WriteLine("4. See a list of staff members.");
                Console.WriteLine("5. See a list of all grades set in the last month.");
                Console.WriteLine("6. Look up grade statistics.");
                Console.WriteLine("7. Add a new student.");
                Console.WriteLine("8. Exit the menu.");

                string input = Console.ReadLine();

                switch (input)
                {
                    case "1":
                        StudentFunctions.ListStudents();
                        break;

                    case "2":
                        StudentFunctions.ListClasses();
                        break;

                    case "3":
                        StaffFunctions.AddStaff();
                        break;

                    case "4":
                        StaffFunctions.ListStaff();
                        break;

                    case "5":
                        CourseGradeFunctions.ListAllCourseGrades();
                        break;

                    case "6":
                        CourseGradeFunctions.ListCourseGradeStatistics();
                        break;

                    case "7":
                        StudentFunctions.AddStudent();
                        break;

                    case "8":
                        Environment.Exit(0);
                        break;

                    default:
                        Console.WriteLine("Fiddlesticks! Invalid input, please try again.");
                        break;
                }
            }
 
        }
    }
}