%%
%% This is file `rawebnum.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ra.dtx  (with options: `ranumbst')
%% ********************************************************************
%% Copyright (C) 1998-2000 INRIA/MIAOU
%% 
%% Style bibliographique ^^ab rapport d'activit^^e9 Inria ^^bb
%% Version 2,5 date Mon Jun 16 11:46:40 MEST 2003

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    class
    series
    title
    type
    url
    volume
    year
  }
  {}
  { label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block
  firstentry }
STRINGS { s t lasttype }
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #0 'firstentry :=
  "XX" 'lasttype :=
}
FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { ", " * write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {preamble.print}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
}
STRINGS { longest.label }
FUNCTION {begin.bib}
{
  "\begin{thebibliography}{"
    longest.label #1 #16 substring$  *
   "}[\RAbib" * lasttype * "name]" * write$
  newline$
  "\small" write$ newline$
}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
INTEGERS { global.label}
FUNCTION {output.bibitem}
{
  newline$
  "% " type$ * write$ newline$
%%  "\bibitem{" write$
 "\bibitem[" write$ global.label #1 + 'global.label :=
 global.label int.to.str$ write$  "]{" write$
  cite$ write$
  "}" write$
  ""
  before.all 'output.state :=
}
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}
FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
function {url.output}
{
   url
   empty$
   {}
   {
     "\url{"  url * "}" * output
   }
   if$
}
FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {quote}
{ duplicate$ empty$
    { pop$ "" }
    { "``" swap$ * "''" * }
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { " \emph{" swap$ * "}" * }
  if$
}
FUNCTION {emphasizeic}
{ duplicate$ empty$
    { pop$ "" }
    { " \emph{" swap$ * "}" * }
  if$
}
FUNCTION {scapify}
{ duplicate$ empty$
    { pop$ "" }
    { "\RAsc{" swap$ * "}" * }
  if$
}
INTEGERS { nameptr namesleft numnames }
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { t "others" =
                { " \emph{et~al.}" * }
                { ", " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {format.innames}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " \emph{et~al.}" * }
                { " and " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names scapify }
  if$
}
FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names scapify
      editor num.names$ #1 >
        { " (editors)" * }
        { " (editor)" * }
      if$
     }
  if$
}
FUNCTION {format.ineditors}
{ editor empty$
    { "" }
    { editor format.innames
      editor num.names$ #1 >
        { " (editors)" * }
       { " (editor)" * }
      if$
    }
  if$
}
FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}
FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}
FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
      "missing year in " cite$ * warning$
    }
    { month empty$
        'year
        { month " " * year * }
      if$
    }
  if$
}
FUNCTION {format.btitle}
{ title emphasize
}
FUNCTION {format.qtitle}
{ title quote
}
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "number " }
            { "Number " }
          if$
          number *
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { " in " * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}
FUNCTION {format.series.volume.number}
{ series empty$
    { volume empty$
        { number empty$
            { "" }
            { "there's a number but no series in " cite$ * warning$
              number }
          if$ }
        { volume emphasize
          number empty$
             'skip$
             { ", " * number * }
          if$ }
      if$ }
    { series emphasize
      volume empty$
        { number empty$
            'skip$
            { ", " * number * }
          if$ }
        { ", " * volume emphasize *
          number empty$
            'skip$
            { ", " * number * }
          if$ }
      if$ }
  if$
}
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { "edition " edition * }
        { "Edition " edition * }
      if$
    }
  if$
}
FUNCTION {format.bpages}
{ pages empty$
    { "" }
    { pages n.dashify "p." * }
  if$
}
FUNCTION {format.pp.pages}
{ pages empty$
    { "" }
    { "p.~" pages n.dashify * }
  if$
}
FUNCTION {format.journal.vol.num.date}
{ journal empty$
    { "empty journal in " cite$ * warning$
      ""
    }
    { journal
      volume empty$
        'skip$
        { " " * volume * }
      if$
      number empty$
        'emphasizeic
        { emphasize ", " * number * }
      if$
      year empty$
        { "empty year in " cite$ * warning$ }
        { ", " * format.date * }
      if$
    }
  if$
}
FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pp.pages
    { type empty$
        { "ch.~" chapter * }
        { type "l" change.case$ chapter tie.or.space.connect }
      if$
      pages empty$
        'skip$
        { ", " * format.pp.pages * }
      if$
    }
  if$
}
FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { "in\,: " booktitle * emphasize
      editor empty$
        'skip$
        { ", " * format.ineditors * }
      if$
    }
  if$
}
FUNCTION {format.in.booktitle.ed}
{ booktitle empty$
    { "" }
    { "in\,: " booktitle * emphasize
      editor empty$
        'skip$
        { ", " * editor format.names *
           editor num.names$ #1 >
             { " (editors)" * }
             { " (editor)" * }
           if$
        }
      if$
    }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}
FUNCTION {format.tr.number}
{ type empty$
    { "research report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { " number " * number * }
  if$
  emphasize
}
FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "in\,: " journal emphasize * }
      if$
    }
    { "in\,: " key * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " \emph{et~al.}" * }
    { #2 <
        'skip$
        { editor #2 "{f.~}{vv }{ll}{, jj}" format.name$ "others" =
            { " \emph{et~al.}" * }
            { " and " * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "in\,: "
    }
    { "Vol.~" volume *
      ", " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { "in\,: " booktitle emphasize * }
          if$
        }
        { "in\,: " key * }
      if$
    }
    { "in\,: " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.qtitle "title" output.check
  new.block
  crossref missing$
    { format.journal.vol.num.date output
      format.pp.pages output
    }
    { format.article.crossref output.nonnull
      format.pp.pages output
    }
  if$
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  crossref missing$
    {
      format.series.volume.number output
      new.block
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.qtitle "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  crossref missing$
    {
      format.series.volume.number output
      new.block
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  format.chapter.pages "chapter and pages" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.qtitle "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.edition output
      format.series.volume.number output
      new.block
      publisher "publisher" output.check
      address output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull }
  if$
  format.chapter.pages output
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.qtitle "title" output.check
  new.block
  crossref missing$
    {
      format.in.booktitle.ed "booktitle" output.check
      format.series.volume.number output
      organization output
      publisher output
      format.pp.pages output
      new.block
      address output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pp.pages output
    }
  if$
  new.sentence
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization scapify output }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  author empty$
    { address new.block.checka }
    { organization address new.block.checkb
      organization output
    }
  if$
  address output
  format.date output
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "M\'emoire" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {masterthesis} {mastersthesis}
FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.qtitle output
  howpublished new.block.checka
  howpublished output
  new.block
  publisher output
  address output
  format.in.booktitle.ed  output
  format.series.volume.number output
  format.date output
  note output
  new.block
  url.output
  fin.entry
  empty.misc.check
}
FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "PhD Thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {coursenotes}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  school "school" output.check
  class "class" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.series.volume.number output
  address empty$
    { editor empty$
        { publisher new.sentence.checka }
        { organization publisher new.sentence.checkb
          organization output
        }
      if$
      new.block
      publisher output
      format.date "year" output.check
      format.bpages output
    }
    {
      editor empty$
        'skip$
        { organization output }
      if$
      new.block
      address output.nonnull
      publisher output
      format.date "year" output.check
      format.bpages output
    }
  if$
  new.sentence
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.qtitle "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  new.block
  url.output
  fin.entry
}
FUNCTION {rapportcontrat}{techreport}
FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.qtitle "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}
FUNCTION {default.type} { misc }
MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}
READ
INTEGERS { len }
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}
FUNCTION {sortify}
{ purify$
  "l" change.case$
}
FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}
FUNCTION {presort}
{
  "    "
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}
ITERATE {presort}
SORT
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
EXECUTE {preamble.print}
EXECUTE {init.state.consts}
EXECUTE {begin.bib}
ITERATE {call.type$}
EXECUTE {end.bib}

