using Prcecision.Master.Data.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prcecision.Master.Data.Core.EntityModel;

namespace Prcecision.Master.Data.Core.IService
{
    public interface IUsersService : IRepository<User>
    {
        Task<IEnumerable<User>> GetAllUserByUserTypeAsync(string CustomerType);

        Task<IEnumerable<User>> GetAllUserAsync();
    
    }
}
