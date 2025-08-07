using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Data.SqlClient;

namespace DataAccess
{
    public class UserRepository
    {
        private readonly string _connectionString;

        public UserRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void InsertUser(UserApplication user)
        {
            string sql = @"INSERT INTO UserApplication (UserName, Email, UserPasswordHash, CreatedAt, IsActive)
                       VALUES (@UserName, @Email, @UserPasswordHash, @CreatedAt, @IsActive)";

            using (var conn = new SqlConnection(_connectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@UserName", user.UserName);
                cmd.Parameters.AddWithValue("@Email", user.Email);
                cmd.Parameters.AddWithValue("@UserPasswordHash", user.UserPasswordHash);
                cmd.Parameters.AddWithValue("@CreatedAt", user.CreatedAt);
                cmd.Parameters.AddWithValue("@IsActive", user.IsActive);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
