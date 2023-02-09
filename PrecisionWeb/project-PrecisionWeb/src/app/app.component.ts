import { Component, OnInit } from '@angular/core';
import {AppConfigService } from '../app/Service/Appsettings.service';
import { ReplaySubject, Observable } from 'rxjs';
import { User } from './Models/user.model';
import { LeaveRequest } from  './Models/leave-request.model';
import { FormControl, Validators } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http'
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


  ApplicantCtrl: FormControl = new FormControl();
  ManagerCtrl: FormControl = new FormControl();


  apiUsersUrl: string;
  constructor(private appConfigService: AppConfigService,
    private httpClient: HttpClient) {}

  ngOnInit(): void {
    this.apiUsersUrl = this.appConfigService.settings.MasterAPIEndpoint + 'api/Users';

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
  LoadUsers(){
     let Url =   this.apiUsersUrl + '/GetAllUsers';
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

  title = 'project-PrecisionWeb';
}
