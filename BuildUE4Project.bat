@echo off

set EnginePath=G:\UE_4.25\Engine\
set ProjectPath=G:\Projects\TheWicked\
set BuildPath=G:\Build
set ProjectName=TheWicked
set ProjectNameEditor=%ProjectName%Editor
set UprojectPath=%ProjectPath%%ProjectName%.uproject
set SlnPath=%ProjectPath%%ProjectName%.sln

%EnginePath%Binaries\DotNET\UnrealBuildTool.exe -projectfiles -project=%UprojectPath% -game -rocket -progress

call %EnginePath%Build\BatchFiles\Rebuild.bat %ProjectNameEditor% Win64 Development -Project=%UprojectPath% -WaitMutex -FromMsBuild

%EnginePath%Build\BatchFiles\RunUAT.bat -ScriptsForProject=%UprojectPath% BuildCookRun -nocompileeditor -installed -nop4 -project=%UprojectPath% -cook -stage -archive -archivedirectory=%BuildPath% -package -ue4exe=%EnginePath%Binaries\Win64\UE4Editor-Cmd.exe -build -pak -prereqs -nodebuginfo -targetplatform=Win64 -target=%ProjectName% -clientconfig=Development -utf8output 
