import { HttpClient,HttpBackend } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {AppSettings} from '../Models/AppSettings.model'
@Injectable({
  providedIn: 'root'
})

export class AppConfigService {

  private appConfig: any;
  settings: AppSettings;

  private httpClient: HttpClient;
  constructor(private handler: HttpBackend) {
    this.httpClient = new HttpClient(handler);
 
}

  load() {

    let appSettingsPath = `assets/AppSettings.json`;
    return new Promise<void>((resolve, reject) => {
        this.httpClient.get(appSettingsPath).toPromise().then((response) => {
            this.settings = <AppSettings>response;
            resolve();
        }).catch((response: any) => {
            reject(`Could not load file '${appSettingsPath}': ${JSON.stringify(response)}`);
        });
    });
}

  // This is an example property ... you can make it however you want.
  get apiBaseUrl() {

    if (!this.appConfig) {
      throw Error('Config file not loaded!');
    }

    return this.appConfig.apiBaseUrl;
  }
}
