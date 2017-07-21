[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=7e324e7e-8649-445b-9c1e-c786c09c9f07
Description=我的脚本1
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Dim waitTime:waitTime = 0
Dim maxWait:maxWait = 20
Dim sgX:sgX = 0
Dim sgY:sgY = 0
Dim sgColor:sgColor = "#000000"
Call startFishing
//----------sub script------------------
Sub startFishing
    KeyPress "F", 1
    Delay 5000
    Call chugan
    Do
        Delay 1000
        waitTime = waitTime + 1
        IfColor sgX, sgY, sgColor, 2 Then
            Call shougan
            //这里用多线程可以提高钓鱼速度
            Delay 5000
            Call shiqu
            Exit Do
        Else 
            If waitTime > maxWait Then 
                Exit Do
            End If
        End If
    Loop
    If waitTime > maxWait Then 
        Call startFishing
    Else 
        Call chugan
    End If
End Sub
Sub chugan
    KeyPress "1", 1
    Delay 500
    waitTime = 0
End Sub
Sub shougan
    KeyPress "2", 1
    Delay 500
End Sub
Sub shiqu
    KeyPress "F", 1
    Delay 500
End Sub
