SRC_DIR := src
GNUPLOT_DIR := plots/gnuplot-files
REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf
GNP := $(wildcard $(GNUPLOT_DIR)/*.p)

BSH := bash
GNPLT := gnuplot
TPST := typst compile --root .
ZTHR := zathura

.PHONY: all run-task%

all: clean-report compile-gnp run-report

run-task%:
	@echo "Running a task$*.."
	@$(BSH) ./$(SRC_DIR)/task$*/main.sh

compile-gnp: $(GNP)
	@echo "Compile gnuplot files.."
	@$(foreach file_name, $(GNP), $(GNPLT) $(file_name);)

run-report: $(RPRT)
	@echo "Running a report.."
	@$(ZTHR) $<

$(RPRT): $(REPORT_DIR)/*.typ
	@echo "Building pdf.."
	@$(TPST) $<

clean-report:
	@echo "Cleaning up.."
	@$(RM) $(RPRT)
