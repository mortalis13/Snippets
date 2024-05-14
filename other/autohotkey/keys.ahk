;Shutdown, Suspend

#NoTrayicon

#Z::Shutdown 1
#S::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
