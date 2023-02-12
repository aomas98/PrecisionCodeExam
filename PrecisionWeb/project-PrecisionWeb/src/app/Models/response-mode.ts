export class ResponseModel<T> {
    Token: string;
    ReturnStatus: boolean;
    ReturnMessage: string;
    Errors: string[];
    TotalPages: number;
    TotalRows: number;
    PageSize: number;
    IsAuthenicated: boolean;
    Entity: T;
}