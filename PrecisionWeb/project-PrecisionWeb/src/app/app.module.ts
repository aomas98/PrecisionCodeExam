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
export function loadAppSettings(appConfig: AppConfigService) {
  return () => appConfig.load();
}

@NgModule({
  declarations: [
    AppComponent
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
    NgxMatSelectSearchModule
  ],
  providers: [{
    provide: APP_INITIALIZER,
    useFactory: loadAppSettings,
    deps: [AppConfigService],
    multi: true
}],
  bootstrap: [AppComponent]
})
export class AppModule { }
