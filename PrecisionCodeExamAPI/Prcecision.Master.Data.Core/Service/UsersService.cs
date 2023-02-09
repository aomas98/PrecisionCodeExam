using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prcecision.Master.Data.Core.IService;
using Prcecision.Master.Data.Core.Repositories;
using Prcecision.Master.Data.Core.EntityModel;
using Microsoft.EntityFrameworkCore;

namespace Prcecision.Master.Data.Core.Service
{
    public class UsersService : Repository<User>, IUsersService, IDisposable
    {
        private readonly PrecisionContext _dbContext;

        public UsersService(DbContext dataDbContext) :
            base(dataDbContext)
        {
            _dbContext = (PrecisionContext)dataDbContext;
        }

        public async Task<IEnumerable<User>> GetAllUserAsync()
        {
            return await _dbContext.Users.ToListAsync();
        }

        public Task<IEnumerable<User>> GetAllUserByUserTypeAsync(string CustomerType)
        {
            throw new NotImplementedException();
        }
    }

}
