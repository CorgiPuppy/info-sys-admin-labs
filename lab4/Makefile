SRC_DIR := src
REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf

BSH := bash
PDFLTX := pdflatex

OUTPUT := --output-directory

.PHONY: all run-task%

all: clean-report run-report clean-aux

run-task%:
	@echo "Running a task$*.."
	sudo docker buildx build -t task$*:latest .
	sudo docker buildx build --load -t task$*:latest .
	sudo docker run task$* ./src/task$*.sh
	#@$(BSH) ./$(SRC_DIR)/task$*/main.sh

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

clean-report:
	@echo "Cleaning up.."
	@$(RM) $(RPRT)
