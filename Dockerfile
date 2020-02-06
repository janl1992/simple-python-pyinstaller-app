FROM ubuntu:bionic

WORKDIR /var/local

# combine into one run command to reduce image size
RUN apt-get update && apt-get install make && apt-get install -y perl wget libfontconfig1 && \
    wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh  && \
    apt-get clean
ADD ./startscript.sh .
ENV PATH="${PATH}:/root/bin"
RUN tlmgr install xetex
RUN fmtutil-sys --all

# install only the packages you need
# this is the bit which fails for most other methods of installation
RUN tlmgr install cm-super lm epstopdf-pkg xstring bigfoot titlesec import pgf caption graphics IEEEtran tools amsfonts lstaddons latex xcolor listings booktabs microtype appendix setspace subfiles geometry multirow hyperref acronym tikz-3dplot amsmath mathtools float relsize lipsum fancyhdr
#CMD ["sh", "startscript.sh"]