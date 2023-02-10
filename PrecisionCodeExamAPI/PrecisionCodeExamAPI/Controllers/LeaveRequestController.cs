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
        public IActionResult CreateLeaveRequest(RequestLeaveViewModel requestLeaveViewModel)
        {
            var LeaveRequest = new LeaveRequest();
            return Ok();
        }


    }
}
