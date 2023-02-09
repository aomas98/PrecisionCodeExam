export interface User {
    UserId: number;
    UserGuid: string;
    UserTypeId: number;
    Username: string | null;
    FirstName: string;
    MiddleName: string;
    LastName: string;
    FullName: string;
    Email: string | null;
    MobileNumber: string | null;
    Birthday: string | null;
    CreatedBy: string;
    CreatedDate: string;
    ModifiedBy: string | null;
    ModifiedDate: string | null;
}