Dim answer,curpath,batexec
curpath=left(wscript.scriptfullname,instrrev(wscript.scriptfullname,"\")-1)
batexec=curpath+"\Deepcreampy\run.bat"
Do
  wscript.createobject("wscript.shell").run(batexec),0,True
  answer=MsgBox("要再来一次吗？",4161)
  If answer=2 Then
    Exit Do
  End If
Loop
