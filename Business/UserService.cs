using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using Entities;
using Helpers;


namespace Business
{
    public class UserService
    {
        private readonly UserRepository _repo;

        public UserService(string connectionString)
        {
            _repo = new UserRepository(connectionString);
        }

        public void RegisterUser(string userName, string email, string plainPassword)
        {
            var user = new UserApplication
            {
                UserName = userName,
                Email = email,
                UserPasswordHash = CryptoHelper.Hash(plainPassword),
                CreatedAt = DateTime.Now,
                IsActive = true
            };

            _repo.InsertUser(user);
        }
    }
}
