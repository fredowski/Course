SHELL := /bin/bash

SOURCE_FMT := markdown_strict+simple_tables+pipe_tables+backtick_code_blocks+auto_identifiers+strikeout+yaml_metadata_block+implicit_figures+all_symbols_escapable+link_attributes+smart+fenced_divs

TEMPLATE     := pandoc/templates/default_mod.latex
TEMPLATE_OLD := pandoc/templates/default_mod_old.latex

GLOBAL_ASSETS := $(shell find pics icons -type f 2>/dev/null)

define PANDOC
pandoc -s \
    --verbose \
    --output=$@ \
    --slide-level 2 \
    --shift-heading-level=-1 \
    --listings \
    --toc \
    --columns=50 \
    -f "$(SOURCE_FMT)" \
    --template $(TEMPLATE) \
    --pdf-engine lualatex \
    -t beamer \
    --from=markdown+rebase_relative_paths \
    $<
endef

# Chapter directories
DIR_C00 := Chapter_00_Preparations
DIR_C01 := Chapter_01_Introduction
DIR_C02 := Chapter_02_OpenROAD_tools
DIR_C03 := Chapter_03_Verilog
DIR_C04 := Chapter_04_OpenROAD_first_run
DIR_C05 := Chapter_05_PDK
DIR_C06 := Chapter_06_OpenROAD_gui
DIR_C07 := Chapter_07_OpenROAD_flow_scripts
DIR_C08 := Chapter_08_Tapeout

ASSETS_C00 := $(shell find $(DIR_C00) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C01 := $(shell find $(DIR_C01) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C02 := $(shell find $(DIR_C02) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C03 := $(shell find $(DIR_C03) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C04 := $(shell find $(DIR_C04) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C05 := $(shell find $(DIR_C05) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C06 := $(shell find $(DIR_C06) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C07 := $(shell find $(DIR_C07) -type f -not -name "*.md" 2>/dev/null)
ASSETS_C08 := $(shell find $(DIR_C08) -type f -not -name "*.md" 2>/dev/null)

PDFS := \
    build/c00_preparations.pdf \
    build/c01_lecture.pdf \
    build/c01_training_common.pdf \
    build/c01_training_advanced.pdf \
    build/c01_training_bonus.pdf \
    build/c01_questions.pdf \
    build/c02_lecture.pdf \
    build/c02_training_common.pdf \
    build/c02_training_advanced.pdf \
    build/c02_questions.pdf \
    build/c03_lecture.pdf \
    build/c03_training_common.pdf \
    build/c03_training_advanced.pdf \
    build/c03_questions.pdf \
    build/c04_lecture.pdf \
    build/c04_training_common.pdf \
    build/c04_training_advanced.pdf \
    build/c04_training_bonus.pdf \
    build/c04_questions.pdf \
    build/c05_lecture.pdf \
    build/c05_training_common.pdf \
    build/c05_training_advanced.pdf \
    build/c05_training_bonus.pdf \
    build/c05_questions.pdf \
    build/c06_lecture.pdf \
    build/c06_training_common.pdf \
    build/c06_questions.pdf \
    build/c07_lecture.pdf \
    build/c07_training_common.pdf \
    build/c07_training_bonus.pdf \
    build/c07_questions.pdf \
    build/c08_lecture.pdf \
    build/c08_training_common.pdf \
    build/c08_questions.pdf

.PHONY: all clean help c0 c1 c2 c3 c4 c5 c6 c7 c8

help:
	@echo "Targets:"
	@echo "  all        Build all PDFs (default)"
	@echo "  clean      Remove all generated PDFs"
	@echo ""
	@echo "  c0         Chapter 0: Preparations"
	@echo "  c1         Chapter 1: Introduction"
	@echo "  c2         Chapter 2: OpenROAD Tools"
	@echo "  c3         Chapter 3: Verilog"
	@echo "  c4         Chapter 4: OpenROAD First Run"
	@echo "  c5         Chapter 5: PDK"
	@echo "  c6         Chapter 6: OpenROAD GUI"
	@echo "  c7         Chapter 7: OpenROAD Flow Scripts"
	@echo "  c8         Chapter 8: Tapeout"

c0: build/c00_preparations.pdf

c1: build/c01_lecture.pdf \
    build/c01_training_common.pdf \
    build/c01_training_advanced.pdf \
    build/c01_training_bonus.pdf \
    build/c01_questions.pdf

c2: build/c02_lecture.pdf \
    build/c02_training_common.pdf \
    build/c02_training_advanced.pdf \
    build/c02_questions.pdf

c3: build/c03_lecture.pdf \
    build/c03_training_common.pdf \
    build/c03_training_advanced.pdf \
    build/c03_questions.pdf

c4: build/c04_lecture.pdf \
    build/c04_training_common.pdf \
    build/c04_training_advanced.pdf \
    build/c04_training_bonus.pdf \
    build/c04_questions.pdf

c5: build/c05_lecture.pdf \
    build/c05_training_common.pdf \
    build/c05_training_advanced.pdf \
    build/c05_training_bonus.pdf \
    build/c05_questions.pdf

c6: build/c06_lecture.pdf \
    build/c06_training_common.pdf \
    build/c06_questions.pdf

c7: build/c07_lecture.pdf \
    build/c07_training_common.pdf \
    build/c07_training_bonus.pdf \
    build/c07_questions.pdf

c8: build/c08_lecture.pdf \
    build/c08_training_common.pdf \
    build/c08_questions.pdf

all: $(PDFS)

build:
	mkdir -p build

# Chapter 0
build/c00_preparations.pdf: $(DIR_C00)/c00_preparations.md $(TEMPLATE) $(ASSETS_C00) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 1
build/c01_lecture.pdf: $(DIR_C01)/c01_lecture.md $(TEMPLATE) $(ASSETS_C01) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c01_training_common.pdf: TEMPLATE := $(TEMPLATE_OLD)
build/c01_training_common.pdf: $(DIR_C01)/c01_training_common.md $(TEMPLATE_OLD) $(ASSETS_C01) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c01_training_advanced.pdf: $(DIR_C01)/c01_training_advanced.md $(TEMPLATE) $(ASSETS_C01) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c01_training_bonus.pdf: $(DIR_C01)/c01_training_bonus.md $(TEMPLATE) $(ASSETS_C01) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c01_questions.pdf: $(DIR_C01)/c01_questions.md $(TEMPLATE) $(ASSETS_C01) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 2
build/c02_lecture.pdf: $(DIR_C02)/c02_lecture.md $(TEMPLATE) $(ASSETS_C02) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c02_training_common.pdf: $(DIR_C02)/c02_training_common.md $(TEMPLATE) $(ASSETS_C02) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c02_training_advanced.pdf: $(DIR_C02)/c02_training_advanced.md $(TEMPLATE) $(ASSETS_C02) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c02_questions.pdf: $(DIR_C02)/c02_questions.md $(TEMPLATE) $(ASSETS_C02) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 3
build/c03_lecture.pdf: $(DIR_C03)/c03_lecture.md $(TEMPLATE) $(ASSETS_C03) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c03_training_common.pdf: $(DIR_C03)/c03_training_common.md $(TEMPLATE) $(ASSETS_C03) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c03_training_advanced.pdf: $(DIR_C03)/c03_training_advanced.md $(TEMPLATE) $(ASSETS_C03) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c03_questions.pdf: $(DIR_C03)/c03_questions.md $(TEMPLATE) $(ASSETS_C03) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 4
build/c04_lecture.pdf: $(DIR_C04)/c04_lecture.md $(TEMPLATE) $(ASSETS_C04) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c04_training_common.pdf: $(DIR_C04)/c04_training_common.md $(TEMPLATE) $(ASSETS_C04) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c04_training_advanced.pdf: $(DIR_C04)/c04_training_advanced.md $(TEMPLATE) $(ASSETS_C04) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c04_training_bonus.pdf: $(DIR_C04)/c04_training_bonus.md $(TEMPLATE) $(ASSETS_C04) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c04_questions.pdf: $(DIR_C04)/c04_questions.md $(TEMPLATE) $(ASSETS_C04) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 5
build/c05_lecture.pdf: $(DIR_C05)/c05_lecture.md $(TEMPLATE) $(ASSETS_C05) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c05_training_common.pdf: $(DIR_C05)/c05_training_common.md $(TEMPLATE) $(ASSETS_C05) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c05_training_advanced.pdf: $(DIR_C05)/c05_training_advanced.md $(TEMPLATE) $(ASSETS_C05) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c05_training_bonus.pdf: $(DIR_C05)/c05_training_bonus.md $(TEMPLATE) $(ASSETS_C05) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c05_questions.pdf: $(DIR_C05)/c05_questions.md $(TEMPLATE) $(ASSETS_C05) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 6
build/c06_lecture.pdf: $(DIR_C06)/c06_lecture.md $(TEMPLATE) $(ASSETS_C06) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c06_training_common.pdf: $(DIR_C06)/c06_training_common.md $(TEMPLATE) $(ASSETS_C06) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c06_questions.pdf: $(DIR_C06)/c06_questions.md $(TEMPLATE) $(ASSETS_C06) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 7
build/c07_lecture.pdf: $(DIR_C07)/c07_lecture.md $(TEMPLATE) $(ASSETS_C07) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c07_training_common.pdf: $(DIR_C07)/c07_training_common.md $(TEMPLATE) $(ASSETS_C07) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c07_training_bonus.pdf: $(DIR_C07)/c07_training_bonus.md $(TEMPLATE) $(ASSETS_C07) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c07_questions.pdf: $(DIR_C07)/c07_questions.md $(TEMPLATE) $(ASSETS_C07) $(GLOBAL_ASSETS) | build
	$(PANDOC)

# Chapter 8
build/c08_lecture.pdf: $(DIR_C08)/c08_lecture.md $(TEMPLATE) $(ASSETS_C08) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c08_training_common.pdf: $(DIR_C08)/c08_training_common.md $(TEMPLATE) $(ASSETS_C08) $(GLOBAL_ASSETS) | build
	$(PANDOC)

build/c08_questions.pdf: $(DIR_C08)/c08_questions.md $(TEMPLATE) $(ASSETS_C08) $(GLOBAL_ASSETS) | build
	$(PANDOC)

clean:
	rm -f $(PDFS)
