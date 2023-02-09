using System;
using System.Collections.Generic;

namespace Prcecision.Master.Data.Core.EntityModel;

public partial class User
{
    public int UserId { get; set; }

    public Guid UserGuid { get; set; }

    public int UserTypeId { get; set; }

    public string? Username { get; set; }

    public string FirstName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Email { get; set; }

    public string? MobileNumber { get; set; }

    public DateTime? Birthday { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }
}
