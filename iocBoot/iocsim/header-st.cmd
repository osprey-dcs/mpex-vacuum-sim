#--
epicsEnvSet("ENGINEER",  "Michael Dalesio")
epicsEnvSet("LOCATION",  "")
epicsEnvSet("WIKI", "")
#-- 
epicsEnvSet("IOCNAME", "mpex-sim")
epicsEnvSet("IOC", "iocsim")
#--

## Register all support components
dbLoadDatabase "../../dbd/sim.dbd"
sim_registerRecordDeviceDriver(pdbbase) 

# Initialize EtherIP driver, define PLCs
drvEtherIP_init()

EIP_verbosity(7)
# EIP_timeout(5000)