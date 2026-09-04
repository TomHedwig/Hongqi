\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hongqi}[2026/09/02 v0.1 Hongqi magazine class]

\LoadClass[UTF8,zihao=5,twoside,openany]{ctexbook}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{expl3}
\RequirePackage{xparse}

\RequirePackage{hongqi-layout}
\RequirePackage{hongqi-fonts}
\RequirePackage{hongqi-headings}
\RequirePackage{hongqi-marks}
\RequirePackage{hongqi-covers}

\ExplSyntaxOn
\tl_new:N \g_hongqi_year_tl
\tl_new:N \g_hongqi_number_tl
\tl_new:N \g_hongqi_date_tl
\tl_new:N \g_hongqi_serial_tl
\tl_new:N \g_hongqi_publisher_tl

\keys_define:nn { hongqi / issue }
  {
    year      .tl_gset:N = \g_hongqi_year_tl,
    number    .tl_gset:N = \g_hongqi_number_tl,
    date      .tl_gset:N = \g_hongqi_date_tl,
    serial    .tl_gset:N = \g_hongqi_serial_tl,
    publisher .tl_gset:N = \g_hongqi_publisher_tl,
    publisher .initial:n = {中国共产党中央委员会主办}
  }

\NewDocumentCommand \HongqiIssueSetup { m }
  { \keys_set:nn { hongqi / issue } { #1 } }

\NewExpandableDocumentCommand \HongqiYear {} { \tl_use:N \g_hongqi_year_tl }
\NewExpandableDocumentCommand \HongqiIssueNumber {} { \tl_use:N \g_hongqi_number_tl }
\NewExpandableDocumentCommand \HongqiIssueDate {} { \tl_use:N \g_hongqi_date_tl }
\NewExpandableDocumentCommand \HongqiSerialNumber {} { \tl_use:N \g_hongqi_serial_tl }
\NewExpandableDocumentCommand \HongqiPublisher {} { \tl_use:N \g_hongqi_publisher_tl }
\ExplSyntaxOff

\setlist{nosep}
\pagestyle{hongqi}
