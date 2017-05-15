package Example;

import java_cup.runtime.SymbolFactory;
%%
%cup
%class Scanner
%{
	public Scanner(java.io.InputStream r, SymbolFactory sf){
		this(r);
		this.sf=sf;
	}
	private SymbolFactory sf;
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

//Additional directives
%line
%unicode

// Macro declarations

// Numbers
digit = [0-9]
non_zero_digit = [1-9]
integer = -?(0|{non_zero_digit}{digit}*)
dot = ["."]
exp = (e|E)("+"|-)?
frac = {dot}{digit}+
scientific_notation = {exp}{digit}+
any_number = {integer}{frac}?{scientific_notation}?

// Strings (not escapes)
string =\"([^\\\"]|\\.)*\"

%%

// Commas, square/curly brackets, colons
"," { return sf.newSymbol("Comma",sym.COMMA); }
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }
"{" { return sf.newSymbol("Left Curly Bracket", sym.LCBRACKET);}
"}" { return sf.newSymbol("Right Curly Bracket", sym.RCBRACKET);}
":" { return sf.newSymbol("Colon", sym.COLON);}

//Scan for unicode strings (using unicode directive 
{string} { return sf.newSymbol("Unicode String", sym.STRING, new String(yytext()));}

//Scan for boolean strings
"true"|"false" { return sf.newSymbol("Boolean True", sym.BOOLEAN, new Boolean(yytext()));}

//Scan for null strings
"null" { return sf.newSymbol("Null Symbol", sym.NULL);}

//Scan for numbers: 0, integers or real numbers (flop)
{any_number} { return sf.newSymbol("Integral Number",sym.NUMBER, new Double(yytext())); }

// Do nothing for white spaces
[ \b\r\n\f\t\s] { }

//Look for and locate error
. { System.err.println("Illegal character "+yytext()+" at line "+(yyline+1)); }


