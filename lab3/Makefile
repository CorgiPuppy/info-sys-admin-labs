SRC_DIR := src
REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf

BSH := bash
PDFLTX := pdflatex

OUTPUT := --output-directory

.PHONY: all

all: clean run-task% run-report clean-aux

run-task%:
	@echo "Running a task$*.."
	@$(BSH) ./$(SRC_DIR)/task$*/main.sh

run-report: $(RPRT)
	@echo "Running a report.."
	@zathura $<

$(RPRT): $(REPORT_DIR)/*.tex
	@echo "Building pdf.."
	$(PDFLTX) $(OUTPUT)=$(REPORT_DIR) $<
	$(PDFLTX) $(OUTPUT)=$(REPORT_DIR) $<

clean-aux:
	@echo "Cleaning up auxiliary files.."
	@find $(REPORT_DIR) -type f ! -name '*.pdf' ! -name '*.tex' -delete

clean:
	@echo "Cleaning up.."
	@$(RM) $(RPRT)
