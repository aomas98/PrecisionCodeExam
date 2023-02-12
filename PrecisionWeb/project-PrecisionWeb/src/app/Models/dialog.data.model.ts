import { TemplateRef } from '@angular/core';

export class DialogData {
    Text: string
    Title: string
    Template: TemplateRef<any>
    ButtonTemplate: TemplateRef<any>
    FormValid: boolean = false;
}