@ECHO OFF
msbuild /t:rebuild >nul

ECHO ****Generating the package that contains app.config.transform instead of app.config in the content folder
nuget pack -Version 1.0.0.0-BAD -Verbosity detailed

ECHO ****Hiding packages.config from nuget so that it does not find EntityFramework dependency
ren packages.config packages1.config >nul

ECHO ****Generating the package that contains correct app.config in the content folder
nuget pack -Version 1.0.0.0-GOOD -Verbosity detailed

ECHO ****Restoring packages.config
ren packages1.config packages.config >nul