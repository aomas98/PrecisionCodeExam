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
    public class LeaveRequestService : Repository<LeaveRequest>, ILeaveRequestService, IDisposable
    {
        private readonly PrecisionContext _dbContext;

        public LeaveRequestService(DbContext dataDbContext) :
            base(dataDbContext)
        {
            _dbContext = (PrecisionContext)dataDbContext;
        }
    }
}
