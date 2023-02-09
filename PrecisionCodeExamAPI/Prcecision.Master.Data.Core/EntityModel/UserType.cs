using System;
using System.Collections.Generic;

namespace Prcecision.Master.Data.Core.EntityModel;

public partial class UserType
{
    public int UserTypeId { get; set; }

    public Guid UserTypeGuid { get; set; }

    public string? UserTypeName { get; set; }

    public string? UserTypeDescription { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }
}
