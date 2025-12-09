#!../../bin/linux-x86_64/sim

#- You may have to change sim to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("PREFIX", "VAC_SIM")
epicsEnvSet("IOCNAME", "mpex-vacuum-sim")
epicsEnvSet("IOC", "iocsim")
epicsEnvSet("AS_PATH", "$(TOP)/iocBoot/$(IOC)/autosave")

## Register all support components
dbLoadDatabase "../../dbd/sim.dbd"
sim_registerRecordDeviceDriver(pdbbase) 

## Load record instances and send port "name" as parameter
dbLoadRecords("../../db/sim.db")

## Initialize EtherIP driver, define PLCs
drvEtherIP_init()

## Set AutoSave paths
set_requestfile_path("$(AS_PATH)")
set_savefile_path("$(AS_PATH)")

## Variables unique to this IOC
#epicsEnvSet("PLCIP","10.112.8.13")
#epicsEnvSet("PLCNAME","vcs")
#epicsEnvSet("PLCSLOT", 4)

# Attach port "name" to the IP and CPU slot number
#drvEtherIP_define_PLC($(PLCNAME), $(PLCIP), $(PLCSLOT))

## Reccaster db
dbLoadRecords("$(TOP)/db/reccaster.db", "P=$(PREFIX):RecSync")

## IOCSTATS db
dbLoadRecords("$(TOP)/db/iocAdminSoft.db", "IOC=$(PREFIX):STS")

## Access security file to load
#asSetFilename("${ASCF}/ics-default.acf")

iocInit()

save_restoreSet_Debug(0)
makeAutosaveFileFromDbInfo("$(AS_PATH)/info_settings.req", "autosaveFields")
create_monitor_set("info_settings.req", 30, "")