using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace Mall_Management.Models
{
    public class Brandmodel
    {
        private string connectionString = "Data Source=LAPTOP-BJKS4LOA\\DUC;Initial Catalog=Mall;Integrated Security=True;";
        public ArrayList get(String sql)
        {
            ArrayList datalist = new ArrayList();
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();

            using (SqlDataReader r = command.ExecuteReader())
            {
                while (r.Read())
                {
                    ArrayList row = new ArrayList();
                    for (int i = 0; i < r.FieldCount; i++)
                    {
                        row.Add(r.GetValue(i).ToString());
                    }
                    datalist.Add(row);
                }
            }
            connection.Close();
            return datalist;
        }       
    }
}