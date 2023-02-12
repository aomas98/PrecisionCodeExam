import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-mat-confirm',
  templateUrl: 'mat-confirm.component.html'
})
export class MatConfirmComponent {
  title = '';
  message = '';
  
  constructor(
    private dialogRef: MatDialogRef<MatConfirmComponent>,
    @Inject(MAT_DIALOG_DATA) data: {  message: string,title:string }
  ) {
    this.message = data ? data.message : '';
    this.title = data ? data.title : '';
  }
}
