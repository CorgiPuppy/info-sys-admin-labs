SRC_DIR := src
REPORT_DIR := report

SRC := $(SRC_DIR)
RPRT := $(REPORT_DIR)/report.pdf

PDFLTX := pdflatex

OUTPUT := --output-directory

.PHONY: all

all: clean run-report clean-aux

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
