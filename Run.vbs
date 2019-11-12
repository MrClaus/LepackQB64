Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run "Slash.hta"
WScript.Sleep (4000)
WshShell.Run "delslash.bat", 0
WshShell.Run "LEPF.exe"