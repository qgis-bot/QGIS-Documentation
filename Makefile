# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
SPHINXOPTS      =
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG)
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = /var/www/html/qgisdocs
<<<<<<< HEAD
SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation-3.4/live/html
CONFDIR         = .
=======
SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation/live/html
>>>>>>> 2759453b2... Remove the unnecessary confdir option from Makefile



# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

springclean:
	rm -r $(BUILDDIR)
	# all .mo files
	find $(SOURCEDIR)/locale/*/LC_MESSAGES/ -type f -name '*.mo' -delete

gettext:
	@$(SPHINXBUILD) -M gettext "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

html:
	echo "$(SPHINXOPTS) $(SPHINXINTLOPTS)"
	if [ $(LANG) != "en" ]; then \
		$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXINTLOPTS) $(0); \
	else \
		$(SPHINXBUILD) -b html -nW --keep-going "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	fi

site: html
	rsync -az $(BUILDDIR)/html/$(LANG) $(SITEDIR)/

doctest:
	$(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
