FROM perl:5.22

LABEL maintainer="Rick Tankard <Rick.Tankard@murdoch.edu.au>"

# Install CPAN dependencies
RUN cpanm File::ShareDir \
    && cpanm Moose \
    && cpanm MooseX \
    && cpanm MooseX::FollowPBP \
    && cpanm Spreadsheet::ParseExcel \
    && cpanm Spreadsheet::XLSX \
    && cpanm Text::Iconv \
    && cpanm Tie::IxHash \
    && cpanm namespace::autoclean \
    && rm -fr root/.cpanm

# Install HTSLIB
RUN curl -LO https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 \
    && tar xjf htslib-1.9.tar.bz2 \
    && cd htslib-1.9 \
    && ./configure \
    && make \
    && make install \
    && cd \
    && rm -fr htslib-1.9 htslib-1.9.tar.bz2 \
    && cpanm Bio::DB::HTS \
    && rm -fr root/.cpanm

# Install Bio::STR::exSTRa
ENV EXSTRA_PERL_VERSION "v1.1.1"
RUN curl -LO https://github.com/bahlolab/Bio-STR-exSTRa/archive/${EXSTRA_PERL_VERSION}.tar.gz \
    && tar xzf ${EXSTRA_PERL_VERSION}.tar.gz \
    && cd Bio-STR-exSTRa-* \
    && perl Build.PL \
    && ./Build \
    && ./Build test \
    && ./Build install \
    && cd \
    && rm -fr ${EXSTRA_PERL_VERSION}.tar.gz Bio-STR-exSTRa-*


CMD echo This container provides the executable: exSTRa_score.pl 1>&2

