import { Component, OnInit ,ViewChild ,TemplateRef} from '@angular/core';
import { AppConfigService } from '../app/Service/Appsettings.service';
import { ReplaySubject, Observable } from 'rxjs';
import { User } from './Models/user.model';
import { LeaveRequest } from './Models/leave-request.model';
import { FormControl, Validators } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Location, DatePipe, KeyValue } from '@angular/common';
import {ResponseModel } from './Models/response-mode';
import { MatConfirmComponent } from './mat-confirm/mat-confirm.component';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from "@angular/material/snack-bar";
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  LeaveRequest: LeaveRequest = new LeaveRequest;

  Applicants: User[];
  ApplicantList: ReplaySubject<User[]> = new ReplaySubject<User[]>(1);

  Managers: User[];
  ManagerList: ReplaySubject<User[]> = new ReplaySubject<User[]>(1);
  myFilter;
  MinDateForReturnDate: Date = new Date();
  ApplicantCtrl: FormControl = new FormControl();
  ManagerCtrl: FormControl = new FormControl();


  apiUsersUrl: string;
  LeaveRequestUrl: string;

  ResponseModel: ResponseModel<LeaveRequest>;

  @ViewChild('SaveRecord', { static: false }) public SaveRecord: TemplateRef<any>;
  constructor(
    private datePipe: DatePipe,
    private appConfigService: AppConfigService,
    private httpClient: HttpClient,
    private dialog: MatDialog,
    private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.apiUsersUrl = this.appConfigService.settings.MasterAPIEndpoint + 'api/Users';
    this.LeaveRequestUrl = this.appConfigService.settings.MasterAPIEndpoint + 'api/LeaveRequest';
    this.LoadUsers();

    this.ApplicantCtrl.valueChanges
      .subscribe(() => {
        this.filterApplicant();
      });

    this.ManagerCtrl.valueChanges
      .subscribe(() => {
        this.filterManager();
      });

  }
  showSnackbarTopPosition(content, action, duration) {
    this.snackBar.open(content, action, {
      duration: 2000,
      panelClass: ["custom-style"],
      verticalPosition: "top", // Allowed values are  'top' | 'bottom'
      horizontalPosition: "center" // Allowed values are 'start' | 'center' | 'end' | 'left' | 'right'
    });
  }

  CancelDialog() {
    const ref: MatDialogRef<MatConfirmComponent> = this.dialog.open(
      MatConfirmComponent,
      {
        width: '600px',
        height: '210px',
        data: {
          message: 'Are you sure you want to save ?',
          title: "Leave Request"
        },
        backdropClass: 'confirmDialogComponent',
        hasBackdrop: true,
      }
    );

    ref.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      if(result.clicked == 'Ok'){
        this.CreateLeaveRequest();
      }
    });

  }

  confirmDialog() {
    const ref: MatDialogRef<MatConfirmComponent> = this.dialog.open(
      MatConfirmComponent,
      {
        width: '600px',
        height: '210px',
        data: {
          message: 'Are you sure you want to save ?',
          title: "Leave Request"
        },
        backdropClass: 'confirmDialogComponent',
        hasBackdrop: true,
      }
    );

    ref.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      if(result.clicked == 'Ok'){
        this.CreateLeaveRequest();
      }
    });

  }
  ValidateDateStartAndEnd() {
    this.LeaveRequest.EndDate = new Date();
    this.LeaveRequest.EndDate.setDate(this.LeaveRequest.EndDate.getDate() + (this.LeaveRequest.NoOfDays - 1));
    this.MinDateForReturnDate = new Date();
    this.MinDateForReturnDate.setDate(this.LeaveRequest.EndDate.getDate() + 1);
    this.LeaveRequest.ReturnDate =this.MinDateForReturnDate;
  }

  ComputeTotalNoOfDays() {
    var date1 = new Date(this.LeaveRequest.StartDate);
    var date2 = new Date(this.LeaveRequest.EndDate);

    // To calculate the time difference of two dates
    var Difference_In_Time = date2.getTime() - date1.getTime();

    // To calculate the no. of days between two dates
    var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);
    this.LeaveRequest.NoOfDays = Difference_In_Days + 1;

    this.MinDateForReturnDate = new Date();
    this.MinDateForReturnDate.setDate(this.LeaveRequest.EndDate.getDate() + 1);
    this.LeaveRequest.ReturnDate.setDate(this.MinDateForReturnDate.getDate());
  }

  filterManager() {
    let search = this.ManagerCtrl.value;

    if (!search) {
      this.ManagerList.next(this.Managers.slice()); return;
    } else {
      search = search.toLowerCase();
    }

    this.ManagerList.next(
      this.Managers.filter(check => check.FullName.toLowerCase().indexOf(search) > -1)
    );
  }


  filterApplicant() {
    let search = this.ApplicantCtrl.value;

    if (!search) {
      this.ApplicantList.next(this.Applicants.slice()); return;
    } else {
      search = search.toLowerCase();
    }

    this.ApplicantList.next(
      this.Applicants.filter(check => check.FullName.toLowerCase().indexOf(search) > -1)
    );
  }
  LoadUsers() {
    let Url = this.apiUsersUrl + '/GetAllUsers';
    this.httpClient.get<User[]>(Url).subscribe(
      (data) => {
        this.Applicants = data;
        this.ApplicantList.next(this.Applicants.slice());

        this.Managers = data;
        this.ManagerList.next(this.Managers.slice());
      })
  }

  setSelected(optionValue: any, ActualValue: any): boolean {
    return optionValue == ActualValue;
  }

  CreateLeaveRequest() {
    let Url = this.LeaveRequestUrl + '/CreateLeaveRequest';
    this.LeaveRequest.StartDateString = this.datePipe.transform(this.LeaveRequest.StartDate, 'MM/dd/yyyy') ?? '';
    this.LeaveRequest.EndDateString = this.datePipe.transform(this.LeaveRequest.EndDate,'MM/dd/yyyy') ?? '';
    this.LeaveRequest.ReturnDateString = this.datePipe.transform(this.LeaveRequest.ReturnDate,'MM/dd/yyyy') ?? '';

    this.httpClient.post(Url,this.LeaveRequest).subscribe(
      (data) => {
              this.ResponseModel = data as any;
              if(this.ResponseModel.ReturnStatus == true){
                this.showSnackbarTopPosition('Successfully Saved!','Done','1000')
                this.LeaveRequest = new LeaveRequest();
              }
              
      }),
      (error: any) => {
        console.log(error);
        this.showSnackbarTopPosition(error,'Ok','1000')
      };
  }

  title = 'project-PrecisionWeb';
}
