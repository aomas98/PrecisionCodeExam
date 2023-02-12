using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prcecision.Master.Data.Core.IService;
using Precision.ViewModel.RequestLeaveViewModel;
using Prcecision.Master.Data.Core.EntityModel;
namespace PrecisionCodeExamAPI.Controllers
{
    [Route("api/LeaveRequest")]
    [ApiController]
    public class LeaveRequestController : ControllerBase
    {
        private readonly ILogger<LeaveRequestController> _logger;
        private readonly ILeaveRequestService _leaveRequestService;
        public LeaveRequestController(ILogger<LeaveRequestController> logger,
             ILeaveRequestService leaveRequestService)
        {
            _logger = logger;
            _leaveRequestService = leaveRequestService;
        }

        [HttpPost("CreateLeaveRequest")]
        public async Task<IActionResult> CreateLeaveRequest(RequestLeaveViewModel requestLeaveViewModel)
        {
            var LeaveRequest = new LeaveRequest();
            LeaveRequest.RequestorId = requestLeaveViewModel.RequestorId;
            LeaveRequest.ReportingToId = requestLeaveViewModel.ReportingToId;
            LeaveRequest.StartDate = requestLeaveViewModel.StartDateString;
            LeaveRequest.EndDate = requestLeaveViewModel.EndDateString;
            LeaveRequest.ReturnDate = requestLeaveViewModel.ReturnDateString;
            LeaveRequest.Comments = requestLeaveViewModel.Comments;

            var result = await _leaveRequestService.CreateLeaveRequestAsync(LeaveRequest);
            try
            {
               
                if (result.ReturnStatus)
                {
                    return Ok(result);

                }
                else
                {
                    return BadRequest(result);
                }
            }
            catch (Exception ex)
            {
                result.ReturnStatus = false;
                result.Errors.Add(ex.ToString());
                return BadRequest(result);
            }

        }


    }
}
