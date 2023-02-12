using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prcecision.Master.Data.Core.IService;
using Prcecision.Master.Data.Core.Repositories;
using Prcecision.Master.Data.Core.EntityModel;
using Microsoft.EntityFrameworkCore;
using Precision.ViewModel;
using System.Transactions;

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

        public async Task<ResponseModel<LeaveRequest>> CreateLeaveRequestAsync(LeaveRequest leaveRequest)
        {
            var result = new ResponseModel<LeaveRequest>();
            try
            {
                using (TransactionScope scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
                {
                    var Validation = ValidateLeaveRequest(leaveRequest);
                    if (Validation.Errors.Count > 0)
                    {
                        return Validation;
                    }
                    leaveRequest.CreatedBy = "Admin";
                    leaveRequest.Status = "PENDING";
                    _dbContext.Add(leaveRequest);
                    await _dbContext.SaveChangesAsync();
                    scope.Complete();
                   // Validation.Entity = leaveRequest;
                    Validation.ReturnMessage = "Success";
                    Validation.ReturnStatus = true;
                    return Validation;
                }
            }
            catch (Exception ex)
            {
                result.AddErrorMessage(ex);
            }
            return result;
        }

        public ResponseModel<LeaveRequest> ValidateLeaveRequest(LeaveRequest leaveRequest)
        {
            var result = new ResponseModel<LeaveRequest>();
            try
            {
                if (leaveRequest.RequestorId == leaveRequest.ReportingToId)
                {
                    result.Errors.Add("Applicant and Manager cannot be the same person");
                }
                if (leaveRequest.StartDate > leaveRequest.EndDate || leaveRequest.StartDate > leaveRequest.ReturnDate)
                {
                    result.Errors.Add("End date and Return date must be greater than the Start date.");
                }
                if (leaveRequest.EndDate < leaveRequest.StartDate)
                {
                    result.Errors.Add("End date must be greater than The Start date");
                }
                if (leaveRequest.EndDate > leaveRequest.ReturnDate)
                {
                    result.Errors.Add("End date must be less than The return date");
                }
                if (leaveRequest.ReturnDate <= leaveRequest.EndDate)
                {
                    result.Errors.Add("Return date must be greater than the End date");
                }
                if(!string.IsNullOrEmpty(leaveRequest.Comments))
                {
                    if (leaveRequest.Comments.Length > 500)
                    {
                        result.Errors.Add("General comments should allow for max 500 characters.");
                    }
                }
               
            }
            catch (Exception ex)
            {
                result.AddErrorMessage(ex);
            }
            return result;
        }
    }
}
