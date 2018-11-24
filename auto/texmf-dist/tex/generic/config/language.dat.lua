-- Generated by /home/texlive/karl/Master/bin/x86_64-linux/tlmgr on Sun Jul 29 02:24:14 2018
-- $Id: language.us.lua 18737 2010-06-04 17:09:02Z karl $
--[[
language.us.dat (and the start of language.dat.lua), used by:
- a special luatex version of hyphen.cfg (derived from the babel system);
- a special luatex version of etex.src (from the e-TeX distributon).

See luatex-hyphen.pdf (currently part of the hyph-utf8 package) for details.

DO NOT EDIT THIS FILE (language.dat.lua)! It is generated by tlmgr.
See language.dat (or language.us) for more information.

Warning: formats using this file also use one of language.dat or
language.def. Update them accordingly. The interaction between these
files is documented in luatex-hyphen.pdf, but here is a summary:
- a language must be mentioned in language.dat or language.def to be
available; if, in addition, it is:
  - not mentioned in language.dat.lua, then it is dumped in the format;
  - mentioned in language.dat.lua with a key special="disabled:<reason>",
    then it is not available at all;
  - mentioned in language.dat.lua with a normal entry, then it will not
    be dumped in the format, but loaded at runtime when activated.
]]

return {
	["english"]={
		loader="hyphen.tex",
		special="language0", -- should be dumped in the format
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={"usenglish","USenglish","american"},
	},
        -- dumylang and zerohyph are dumped in the format,
        -- since they contain either very few or no patterns at all
-- END of language.us.lua (missing '}' appended after all entries)
-- from dehyph-exptl:
	['german-x-2018-03-31'] = {
		loader = 'dehypht-x-2018-03-31.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'german-x-latest' },
		patterns = 'hyph-de-1901.pat.txt',
		hyphenation = 'hyph-de-1901.hyp.txt',
	},
	['ngerman-x-2018-03-31'] = {
		loader = 'dehyphn-x-2018-03-31.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'ngerman-x-latest' },
		patterns = 'hyph-de-1996.pat.txt',
		hyphenation = 'hyph-de-1996.hyp.txt',
	},
-- from hyphen-afrikaans:
	['afrikaans'] = {
		loader = 'loadhyph-af.tex',
		lefthyphenmin = 1,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-af.pat.txt',
		hyphenation = 'hyph-af.hyp.txt',
	},
-- from hyphen-ancientgreek:
	['ancientgreek'] = {
		loader = 'loadhyph-grc.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-grc.pat.txt',
		hyphenation = '',
	},
	['ibycus'] = {
		loader = 'ibyhyph.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		special = 'disabled:8-bit only',
	},
-- from hyphen-arabic:
	['arabic'] = {
		loader = 'zerohyph.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = '',
	},
-- from hyphen-armenian:
	['armenian'] = {
		loader = 'loadhyph-hy.tex',
		lefthyphenmin = 1,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-hy.pat.txt',
		hyphenation = '',
	},
-- from hyphen-basque:
	['basque'] = {
		loader = 'loadhyph-eu.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-eu.pat.txt',
		hyphenation = '',
	},
-- from hyphen-belarusian:
	['belarusian'] = {
		loader = 'loadhyph-be.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-be.pat.txt',
		hyphenation = '',
	},
-- from hyphen-bulgarian:
	['bulgarian'] = {
		loader = 'loadhyph-bg.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-bg.pat.txt',
		hyphenation = '',
	},
-- from hyphen-catalan:
	['catalan'] = {
		loader = 'loadhyph-ca.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-ca.pat.txt',
		hyphenation = 'hyph-ca.hyp.txt',
	},
-- from hyphen-chinese:
	['pinyin'] = {
		loader = 'loadhyph-zh-latn-pinyin.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-zh-latn-pinyin.pat.txt',
		hyphenation = '',
	},
-- from hyphen-churchslavonic:
	['churchslavonic'] = {
		loader = 'loadhyph-cu.tex',
		lefthyphenmin = 1,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-cu.pat.txt',
		hyphenation = 'hyph-cu.hyp.txt',
	},
-- from hyphen-coptic:
	['coptic'] = {
		loader = 'loadhyph-cop.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-cop.pat.txt',
		hyphenation = '',
	},
-- from hyphen-croatian:
	['croatian'] = {
		loader = 'loadhyph-hr.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-hr.pat.txt',
		hyphenation = '',
	},
-- from hyphen-czech:
	['czech'] = {
		loader = 'loadhyph-cs.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-cs.pat.txt',
		hyphenation = 'hyph-cs.hyp.txt',
	},
-- from hyphen-danish:
	['danish'] = {
		loader = 'loadhyph-da.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-da.pat.txt',
		hyphenation = '',
	},
-- from hyphen-dutch:
	['dutch'] = {
		loader = 'loadhyph-nl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-nl.pat.txt',
		hyphenation = 'hyph-nl.hyp.txt',
	},
-- from hyphen-english:
	['ukenglish'] = {
		loader = 'loadhyph-en-gb.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = { 'british', 'UKenglish' },
		patterns = 'hyph-en-gb.pat.txt',
		hyphenation = 'hyph-en-gb.hyp.txt',
	},
	['usenglishmax'] = {
		loader = 'loadhyph-en-us.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-en-us.pat.txt',
		hyphenation = 'hyph-en-us.hyp.txt',
	},
-- from hyphen-esperanto:
	['esperanto'] = {
		loader = 'loadhyph-eo.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-eo.pat.txt',
		hyphenation = '',
	},
-- from hyphen-estonian:
	['estonian'] = {
		loader = 'loadhyph-et.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-et.pat.txt',
		hyphenation = '',
	},
-- from hyphen-ethiopic:
	['ethiopic'] = {
		loader = 'loadhyph-mul-ethi.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = { 'amharic', 'geez' },
		patterns = 'hyph-mul-ethi.pat.txt',
		hyphenation = '',
	},
-- from hyphen-farsi:
	['farsi'] = {
		loader = 'zerohyph.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = { 'persian' },
		patterns = '',
	},
-- from hyphen-finnish:
	['finnish'] = {
		loader = 'loadhyph-fi.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-fi.pat.txt',
		hyphenation = '',
	},
-- from hyphen-french:
	['french'] = {
		loader = 'loadhyph-fr.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'patois', 'francais' },
		patterns = 'hyph-fr.pat.txt',
		hyphenation = '',
	},
-- from hyphen-friulan:
	['friulan'] = {
		loader = 'loadhyph-fur.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-fur.pat.txt',
		hyphenation = '',
	},
-- from hyphen-galician:
	['galician'] = {
		loader = 'loadhyph-gl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-gl.pat.txt',
		hyphenation = '',
	},
-- from hyphen-georgian:
	['georgian'] = {
		loader = 'loadhyph-ka.tex',
		lefthyphenmin = 1,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-ka.pat.txt',
		hyphenation = '',
	},
-- from hyphen-german:
	['german'] = {
		loader = 'loadhyph-de-1901.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-de-1901.pat.txt',
		hyphenation = '',
	},
	['ngerman'] = {
		loader = 'loadhyph-de-1996.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-de-1996.pat.txt',
		hyphenation = '',
	},
	['swissgerman'] = {
		loader = 'loadhyph-de-ch-1901.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-de-ch-1901.pat.txt',
		hyphenation = '',
	},
-- from hyphen-greek:
	['monogreek'] = {
		loader = 'loadhyph-el-monoton.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-el-monoton.pat.txt',
		hyphenation = '',
	},
	['greek'] = {
		loader = 'loadhyph-el-polyton.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = { 'polygreek' },
		patterns = 'hyph-el-polyton.pat.txt',
		hyphenation = '',
	},
-- from hyphen-hungarian:
	['hungarian'] = {
		loader = 'loadhyph-hu.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-hu.pat.txt',
		hyphenation = '',
	},
-- from hyphen-icelandic:
	['icelandic'] = {
		loader = 'loadhyph-is.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-is.pat.txt',
		hyphenation = '',
	},
-- from hyphen-indic:
	['assamese'] = {
		loader = 'loadhyph-as.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-as.pat.txt',
		hyphenation = '',
	},
	['bengali'] = {
		loader = 'loadhyph-bn.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-bn.pat.txt',
		hyphenation = '',
	},
	['gujarati'] = {
		loader = 'loadhyph-gu.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-gu.pat.txt',
		hyphenation = '',
	},
	['hindi'] = {
		loader = 'loadhyph-hi.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-hi.pat.txt',
		hyphenation = '',
	},
	['kannada'] = {
		loader = 'loadhyph-kn.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-kn.pat.txt',
		hyphenation = '',
	},
	['malayalam'] = {
		loader = 'loadhyph-ml.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-ml.pat.txt',
		hyphenation = '',
	},
	['marathi'] = {
		loader = 'loadhyph-mr.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-mr.pat.txt',
		hyphenation = '',
	},
	['oriya'] = {
		loader = 'loadhyph-or.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-or.pat.txt',
		hyphenation = '',
	},
	['panjabi'] = {
		loader = 'loadhyph-pa.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-pa.pat.txt',
		hyphenation = '',
	},
	['pali'] = {
		loader = 'loadhyph-pi.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-pi.pat.txt',
		hyphenation = '',
	},
	['tamil'] = {
		loader = 'loadhyph-ta.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-ta.pat.txt',
		hyphenation = '',
	},
	['telugu'] = {
		loader = 'loadhyph-te.tex',
		lefthyphenmin = 1,
		righthyphenmin = 1,
		synonyms = {  },
		patterns = 'hyph-te.pat.txt',
		hyphenation = '',
	},
-- from hyphen-indonesian:
	['indonesian'] = {
		loader = 'loadhyph-id.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-id.pat.txt',
		hyphenation = 'hyph-id.hyp.txt',
	},
-- from hyphen-interlingua:
	['interlingua'] = {
		loader = 'loadhyph-ia.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-ia.pat.txt',
		hyphenation = 'hyph-ia.hyp.txt',
	},
-- from hyphen-irish:
	['irish'] = {
		loader = 'loadhyph-ga.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-ga.pat.txt',
		hyphenation = 'hyph-ga.hyp.txt',
	},
-- from hyphen-italian:
	['italian'] = {
		loader = 'loadhyph-it.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-it.pat.txt',
		hyphenation = '',
	},
-- from hyphen-kurmanji:
	['kurmanji'] = {
		loader = 'loadhyph-kmr.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-kmr.pat.txt',
		hyphenation = '',
	},
-- from hyphen-latin:
	['latin'] = {
		loader = 'loadhyph-la.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-la.pat.txt',
		hyphenation = '',
	},
	['classiclatin'] = {
		loader = 'loadhyph-la-x-classic.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-la-x-classic.pat.txt',
		hyphenation = '',
	},
	['liturgicallatin'] = {
		loader = 'loadhyph-la-x-liturgic.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-la-x-liturgic.pat.txt',
		hyphenation = '',
	},
-- from hyphen-latvian:
	['latvian'] = {
		loader = 'loadhyph-lv.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-lv.pat.txt',
		hyphenation = '',
	},
-- from hyphen-lithuanian:
	['lithuanian'] = {
		loader = 'loadhyph-lt.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-lt.pat.txt',
		hyphenation = '',
	},
-- from hyphen-mongolian:
	['mongolian'] = {
		loader = 'loadhyph-mn-cyrl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-mn-cyrl.pat.txt',
		hyphenation = '',
	},
	['mongolianlmc'] = {
		loader = 'loadhyph-mn-cyrl-x-lmc.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		special = 'disabled:only for 8bit montex with lmc encoding',
	},
-- from hyphen-norwegian:
	['bokmal'] = {
		loader = 'loadhyph-nb.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'norwegian', 'norsk' },
		patterns = 'hyph-nb.pat.txt',
		hyphenation = 'hyph-nb.hyp.txt',
	},
	['nynorsk'] = {
		loader = 'loadhyph-nn.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-nn.pat.txt',
		hyphenation = 'hyph-nn.hyp.txt',
	},
-- from hyphen-occitan:
	['occitan'] = {
		loader = 'loadhyph-oc.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-oc.pat.txt',
		hyphenation = '',
	},
-- from hyphen-piedmontese:
	['piedmontese'] = {
		loader = 'loadhyph-pms.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-pms.pat.txt',
		hyphenation = '',
	},
-- from hyphen-polish:
	['polish'] = {
		loader = 'loadhyph-pl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-pl.pat.txt',
		hyphenation = 'hyph-pl.hyp.txt',
	},
-- from hyphen-portuguese:
	['portuguese'] = {
		loader = 'loadhyph-pt.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = { 'portuges' },
		patterns = 'hyph-pt.pat.txt',
		hyphenation = 'hyph-pt.hyp.txt',
	},
-- from hyphen-romanian:
	['romanian'] = {
		loader = 'loadhyph-ro.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-ro.pat.txt',
		hyphenation = '',
	},
-- from hyphen-romansh:
	['romansh'] = {
		loader = 'loadhyph-rm.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-rm.pat.txt',
		hyphenation = '',
	},
-- from hyphen-russian:
	['russian'] = {
		loader = 'loadhyph-ru.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-ru.pat.txt',
		hyphenation = 'hyph-ru.hyp.txt',
	},
-- from hyphen-sanskrit:
	['sanskrit'] = {
		loader = 'loadhyph-sa.tex',
		lefthyphenmin = 1,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-sa.pat.txt',
		hyphenation = '',
	},
-- from hyphen-serbian:
	['serbian'] = {
		loader = 'loadhyph-sr-latn.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-sh-latn.pat.txt,hyph-sh-cyrl.pat.txt',
		hyphenation = 'hyph-sh-latn.hyp.txt,hyph-sh-cyrl.hyp.txt',
	},
	['serbianc'] = {
		loader = 'loadhyph-sr-cyrl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-sh-latn.pat.txt,hyph-sh-cyrl.pat.txt',
		hyphenation = 'hyph-sh-latn.hyp.txt,hyph-sh-cyrl.hyp.txt',
	},
-- from hyphen-slovak:
	['slovak'] = {
		loader = 'loadhyph-sk.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-sk.pat.txt',
		hyphenation = 'hyph-sk.hyp.txt',
	},
-- from hyphen-slovenian:
	['slovenian'] = {
		loader = 'loadhyph-sl.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'slovene' },
		patterns = 'hyph-sl.pat.txt',
		hyphenation = '',
	},
-- from hyphen-spanish:
	['spanish'] = {
		loader = 'loadhyph-es.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = { 'espanol' },
		patterns = 'hyph-es.pat.txt',
		hyphenation = '',
	},
-- from hyphen-swedish:
	['swedish'] = {
		loader = 'loadhyph-sv.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-sv.pat.txt',
		hyphenation = '',
	},
-- from hyphen-thai:
	['thai'] = {
		loader = 'loadhyph-th.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-th.pat.txt',
		hyphenation = '',
	},
-- from hyphen-turkish:
	['turkish'] = {
		loader = 'loadhyph-tr.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-tr.pat.txt',
		hyphenation = '',
	},
-- from hyphen-turkmen:
	['turkmen'] = {
		loader = 'loadhyph-tk.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-tk.pat.txt',
		hyphenation = '',
	},
-- from hyphen-ukrainian:
	['ukrainian'] = {
		loader = 'loadhyph-uk.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-uk.pat.txt',
		hyphenation = '',
	},
-- from hyphen-uppersorbian:
	['uppersorbian'] = {
		loader = 'loadhyph-hsb.tex',
		lefthyphenmin = 2,
		righthyphenmin = 2,
		synonyms = {  },
		patterns = 'hyph-hsb.pat.txt',
		hyphenation = 'hyph-hsb.hyp.txt',
	},
-- from hyphen-welsh:
	['welsh'] = {
		loader = 'loadhyph-cy.tex',
		lefthyphenmin = 2,
		righthyphenmin = 3,
		synonyms = {  },
		patterns = 'hyph-cy.pat.txt',
		hyphenation = '',
	},
}
