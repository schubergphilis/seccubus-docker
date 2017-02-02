FROM centos:7

RUN yum install -y epel-release && \
	yum update -y && \
	yum install -y perl mariadb-server "perl(Algorithm::Diff)" "perl(CGI)" "perl(CGI::Carp)" \
	"perl(DBI)" "perl(DBD::mysql)" 	"perl(Data::Dumper)" "perl(Date::Format)" "perl(HTML::Entities)" \
	"perl(JSON)" "perl(LWP::Simple)" "perl(LWP::Protocol::https)" "perl(LWP::UserAgent)" \
	"perl(Net::IP)" "perl(XML::Simple)" httpd nmap which git java-1.7.0-openjdk make \
	"perl(ExtUtils::MakeMaker)" wget

# Build time arguments
ARG VERSION=master

COPY docker-install.sh /tmp/install.sh
RUN bash -x /tmp/install.sh && rm /tmp/install.sh

COPY docker-files /
COPY README.md /

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80
