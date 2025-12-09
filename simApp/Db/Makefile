TOP=../..
include $(TOP)/configure/CONFIG

DB += sim.db

ifneq ($(IOCSTATS),)
DB_INSTALLS += $(IOCSTATS)/db/iocAdminSoft.db
endif

ifneq ($(RECCASTER),)
DB_INSTALLS += $(RECCASTER)/db/reccaster.db
endif

ifneq ($(AUTOSAVE),)
DB_INSTALLS += $(AUTOSAVE)/db/save_restoreStatus.db
endif

include $(TOP)/configure/RULES