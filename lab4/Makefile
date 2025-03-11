SRC_DIR := src
REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf

BSH := bash
TPST := typst compile --root .
ZTHR := zathura

.PHONY: all run-task%

all: clean-report run-report

run-task%:
	@echo "Running a task$*.."
	@$(BSH) ./$(SRC_DIR)/task$*/main.sh

run-report: $(RPRT)
	@echo "Running a report.."
	@$(ZTHR) $<

$(RPRT): $(REPORT_DIR)/*.typ
	@echo "Building pdf.."
	@$(TPST) $<

clean-report:
	@echo "Cleaning up.."
	@$(RM) $(RPRT)
