using Microsoft.AspNetCore.Mvc;
using Prcecision.Master.Data.Core.IService;
using Precision.ViewModel.UsersViewModel;
namespace PrecisionCodeExamAPI.Controllers
{
    [ApiController]
    [Route("api/Users")]
    public class UsersController : ControllerBase
    {
      

        private readonly ILogger<UsersController> _logger;
        private readonly IUsersService _usersService;
        public UsersController(ILogger<UsersController> logger,
             IUsersService usersService)
        {
            _logger = logger;
            _usersService = usersService;
        }

        [HttpGet("GetAllUsers")]
        public async Task<IActionResult> GetAllUsers()
        {
            try
            {
                var UserList = await _usersService.GetAllUserAsync();
                var result = new List<UserViewModel>();
                UserList.ToList().ForEach(x =>
                {
                    result.Add(new UserViewModel { 
                            UserId = x.UserId,
                            FullName = x.FirstName + " " + x.MiddleName + " " + x.LastName,
                    });
                });

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status400BadRequest, ex);
            }
       
        }
    }
}