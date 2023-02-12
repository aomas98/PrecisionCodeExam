using Prcecision.Master.Data.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prcecision.Master.Data.Core.EntityModel;
using Precision.ViewModel;

namespace Prcecision.Master.Data.Core.IService
{
    public interface ILeaveRequestService : IRepository<LeaveRequest>
    {
        Task<ResponseModel<LeaveRequest>> CreateLeaveRequestAsync(LeaveRequest leaveRequest);
       ResponseModel<LeaveRequest> ValidateLeaveRequest(LeaveRequest leaveRequest);
    }
}
