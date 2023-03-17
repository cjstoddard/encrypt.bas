' encrypt.bas
' Uses the RND and XOR functions to encrypt text files
Input "Password: ", Password$
Print

For Count = 1 To Len(Password$)
  MyNumber = MyNumber + Asc(Left$(Password$,Count))
Next

Randomize MyNumber
Input "Enter File to be encrypted: ", FileName$
Print
Open FileName$ For Input As #1
Input "Enter the name to save the encryted file as: ", EncryptedFile$
Print
Open EncryptedFile$ For OutPut As #2
Print "Encrypting the file, please wait..."
Print
 
For Count = 1 To Lof(#1)
  Print ".";
  RealPassword = Int(Rnd * 126) + 1
  Temp$ = Input$(1,#1)
  Encrypt = RealPassword Xor Asc(Temp$)
  If Encrypt < 1 Then Encrypt = Encrypt + 126
  If Encrypt > 126 Then Encrypt = Encrypt - 126
  Encrypt$ = Chr$(Encrypt)
  Print #2, Encrypt$;
Next Count

Close #1
Close #2
Print "Done"
Print
End
