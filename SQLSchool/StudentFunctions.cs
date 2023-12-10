using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLSchool
{
    public static class StudentFunctions
    {
        public static void ListStudents()
        {
            Console.Clear();
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                Console.WriteLine("Choose student sorting order: \nA: First name in ascending order. \nB: First name" +
                    " in descending order. \nC: Last name in ascending order. \nD: Last name in descending order.");

                string sortingInput = Console.ReadLine().ToUpper();

                string orderByInput = "";

                switch (sortingInput)
                {
                    case "A":
                        orderByInput = "ORDER BY FirstName ASC, LastName ASC";
                        break;

                    case "B":
                        orderByInput = "ORDER BY FirstName DESC, LastName ASC";
                        break;

                    case "C":
                        orderByInput = "ORDER BY LastName ASC, FirstName ASC";
                        break;

                    case "D":
                        orderByInput = "ORDER BY LastName DESC, FirstName ASC";
                        break;

                    default:
                        Console.WriteLine("Oops! Invalid input. Sorting by last name, ascending order.");
                        orderByInput = "ORDER BY LastName ASC, FirstName ASC";
                        break;
                }

                Console.WriteLine("\n--------------------------------------------\n");

                string sqlQuery = $"SELECT FirstName, LastName FROM Students {orderByInput}";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string firstName = reader.GetString(reader.GetOrdinal("FirstName"));
                            string lastName = reader.GetString(reader.GetOrdinal("LastName"));

                            Console.WriteLine($"{firstName} {lastName}");
                        }
                    }
                }

            }
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }



        public static void ListClasses()
        {
            Console.Clear();
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT ClassName FROM Classes", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        Console.WriteLine("Current classes:");
                        while (reader.Read())
                        {
                            string className = reader.GetString(reader.GetOrdinal("ClassName"));

                            Console.WriteLine($"{className}");
                        }
                    }
                }

                Console.WriteLine("Choose a class to see its students:");

                string selectedClass = Console.ReadLine().ToUpper();

                Console.WriteLine("\n--------------------------------------------\n");

                if (selectedClass != "1A" && selectedClass != "3A")
                {
                    Console.WriteLine("Deuces! Invalid input.");
                }

                string sqlQuery = $"SELECT s.FirstName, s.LastName, c.ClassName FROM Students s JOIN Classes c ON s.ClassID = c.ClassID  WHERE ClassName = @ClassName";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@ClassName", selectedClass);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string firstName = reader.GetString(reader.GetOrdinal("FirstName"));
                            string lastName = reader.GetString(reader.GetOrdinal("LastName"));

                            Console.WriteLine($"{firstName} {lastName}");
                        }
                    }
                }
            }
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }




        public static void AddStudent()
        {
            Console.Clear();
            int classIDInput;

            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "INSERT INTO Students (FirstName, LastName, SocialSecurityNumber, ClassID) " +
                    "VALUES (@FirstName, @LastName, @SocialSecurityNumber, @ClassID)";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    Console.WriteLine("Which class will the student be attending?");
                    Console.WriteLine("1. 3A");
                    Console.WriteLine("2. 1A");

                    int input = Convert.ToInt32(Console.ReadLine());

                    switch (input)
                    {
                        case 1:
                            classIDInput = 1;
                            break;
                        case 2:
                            classIDInput = 2;
                            break;
                        default:
                            Console.WriteLine("Jeepers! Invalid input. Try again.");
                            return;
                    }

                    Console.Write("Input first name: ");
                    string firstNameInput = Console.ReadLine();

                    Console.Write("Input last name: ");
                    string lastNameInput = Console.ReadLine();

                    Console.Write("Input SSN (YYYYMMDD-XXXX): ");
                    string socialSecNumInput = Console.ReadLine();

                    command.Parameters.AddWithValue("@FirstName", firstNameInput);
                    command.Parameters.AddWithValue("@LastName", lastNameInput);
                    command.Parameters.AddWithValue("@SocialSecurityNumber", socialSecNumInput);
                    command.Parameters.AddWithValue("@ClassID", classIDInput);

                    command.ExecuteNonQuery();
                }
            }

            Console.WriteLine("\n--------------------------------------------\n");
            Console.WriteLine("Huzzah! New student added.");
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }
    }
}
