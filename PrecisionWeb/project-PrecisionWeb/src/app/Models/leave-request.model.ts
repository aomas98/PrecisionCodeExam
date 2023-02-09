export class LeaveRequest {
    LeaveRqstId: number;
    LeaveRqstGuid: string;
    RequestorId: number;
    ReportingToId: number;
    RequestedBy: number | null;
    StartDate: string;
    EndDate: string;
    ReturnDate: string;
    NoOfDays: number;
    Comments: string;
    Status: string | null;
    ApprovedBy: string | null;
    ApprovedDate: string | null;
    CreatedBy: string;
    CreatedDate: string;
    ModifiedBy: string | null;
    ModifiedDate: string | null;
}