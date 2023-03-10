import { NgModule,APP_INITIALIZER } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FlexLayoutModule } from '@angular/flex-layout';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule ,ReactiveFormsModule} from '@angular/forms';
import {AppConfigService } from '../app/Service/Appsettings.service';
import { NgxMatSelectSearchModule}  from 'ngx-mat-select-search';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatNativeDateModule} from '@angular/material/core';
import { DatePipe } from '@angular/common';
import {MatDialogModule} from '@angular/material/dialog';
import { MatConfirmComponent } from './mat-confirm/mat-confirm.component';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
export function loadAppSettings(appConfig: AppConfigService) {
  return () => appConfig.load();
}

@NgModule({
  declarations: [
    AppComponent,
    MatConfirmComponent
  ],
  imports: [
    [FlexLayoutModule],
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    MatFormFieldModule,
    MatInputModule, 
    MatSelectModule,
    FormsModule,
    ReactiveFormsModule,
    NgxMatSelectSearchModule, 
    MatDatepickerModule,
    MatNativeDateModule,
    MatDialogModule,
    MatSnackBarModule
    
  ],
  providers: [{
    provide: APP_INITIALIZER,
    useFactory: loadAppSettings,
    deps: [AppConfigService],
    multi: true
},
DatePipe
],
  bootstrap: [AppComponent]
})
export class AppModule { }
