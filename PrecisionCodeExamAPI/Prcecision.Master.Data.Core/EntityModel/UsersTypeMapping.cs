using System;
using System.Collections.Generic;

namespace Prcecision.Master.Data.Core.EntityModel;

public partial class UsersTypeMapping
{
    public int UserTypeMappingId { get; set; }

    public Guid UserTypeMappingGuid { get; set; }

    public int UserId { get; set; }

    public int UserId2 { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }
}
