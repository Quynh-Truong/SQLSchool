using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLSchool
{
    internal class StaffFunctions
    {
        public static void AddStaff()
        {
            Console.Clear();
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "INSERT INTO Staff (FirstName, LastName, Position) VALUES (@FirstName, @LastName, @Position)";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    Console.WriteLine("What position will the new employee have?");
                    Console.WriteLine("1. Teacher");
                    Console.WriteLine("2. Janitor");
                    Console.WriteLine("3. Lunch lady");
                    Console.WriteLine("4. Administrator");

                    string positionInput = "";
                    string input = Console.ReadLine();

                    switch (input)
                    {
                        case "1":
                            positionInput = "Teacher";
                            break;

                        case "2":
                            positionInput = "Administrator";
                            break;

                        case "3":
                            positionInput = "Lunch lady";
                            break;

                        case "4":
                            positionInput = "Janitor";
                            break;

                        default:
                            Console.WriteLine("Dang! Invalid input. Try again.");
                            return;
                    }

                    Console.Write("Input first name: ");
                    string firstNameInput = Console.ReadLine();

                    Console.Write("Input last name: ");
                    string lastNameInput = Console.ReadLine();


                    command.Parameters.AddWithValue("@FirstName", firstNameInput);
                    command.Parameters.AddWithValue("@LastName", lastNameInput);
                    command.Parameters.AddWithValue("@Position", positionInput);

                    command.ExecuteNonQuery();
                }
            }

            Console.WriteLine("\n--------------------------------------------\n");
            Console.WriteLine("Huzzah! New staff added.");
            Console.WriteLine("\n--------------------------------------------");
            Console.WriteLine("Press enter to return to main menu.");
            Console.ReadLine();
        }



        public static void ListStaff()
        {
            Console.Clear();
            {
                string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SchoolDB;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    Console.WriteLine("Choose the staff you want to look up. \nA: All staff. \nB: Teachers. \nC: Principal. " +
                        "\nD: Administrator. \nE. Janitor. \nF. Lunch lady. \nG. Ex teachers.");

                    string filterStaff = Console.ReadLine().ToUpper();

                    string selectedStaff = "";

                    switch (filterStaff)
                    {
                        case "A":
                            selectedStaff = "WHERE Position IN ('Teacher', 'Principal', 'Administrator', 'Janitor', 'Lunch lady', 'Ex teacher')";
                            break;

                        case "B":
                            selectedStaff = "WHERE Position = 'Teacher'";
                            break;

                        case "C":
                            selectedStaff = "WHERE Position = 'Principal'";
                            break;

                        case "D":
                            selectedStaff = "WHERE Position = 'Administrator'";
                            break;

                        case "E":
                            selectedStaff = "WHERE Position = 'Janitor'";
                            break;

                        case "F":
                            selectedStaff = "WHERE Position = 'Lunch lady'";
                            break;

                        case "G":
                            selectedStaff = "WHERE Position = 'Ex teacher'";
                            break;

                        default:
                            Console.WriteLine("Oomph! Invalid input. Showing all staff.");
                            selectedStaff = "WHERE Position IN ('Teacher', 'Principal', 'Administrator', 'Janitor', 'Lunch lady', 'Ex teacher')";
                            break;
                    }
                    Console.WriteLine("\n--------------------------------------------\n");

                    string sqlQuery = $"SELECT FirstName, LastName, Position FROM Staff {selectedStaff} " +
                        $"ORDER BY LastName ASC, FirstName ASC";

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        using (
                            SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string firstName = reader.GetString(reader.GetOrdinal("FirstName"));
                                string lastName = reader.GetString(reader.GetOrdinal("LastName"));
                                string position = reader.GetString(reader.GetOrdinal("Position"));

                                Console.WriteLine($"{firstName} {lastName}: {position}");
                            }
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
