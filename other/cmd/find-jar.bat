@echo off

rem set class_name=javax.activation.ActivationDataFlavor
rem set class_name=org.jboss.aesh.cl.internal.OptionInt
set class_name=org.aspectj.weaver.reflect.ReflectionWorld

for /F "eol=;" %%i in (jars.txt) do (
  grepj %class_name% "%%i"
)
