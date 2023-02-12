using System;
using System.Collections.Generic;

namespace Prcecision.Master.Data.Core.EntityModel;

public partial class LeaveRequest
{
    public int LeaveRqstId { get; set; }

    public Guid LeaveRqstGuid { get; set; }

    public int RequestorId { get; set; }

    public int ReportingToId { get; set; }

    public int? RequestedBy { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public DateTime ReturnDate { get; set; }

    public int NoOfDays { get; set; }

    public string? Comments { get; set; }

    public string? Status { get; set; }

    public string? ApprovedBy { get; set; }

    public DateTime? ApprovedDate { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }

    public virtual User ReportingTo { get; set; } = null!;

    public virtual User Requestor { get; set; } = null!;
}
