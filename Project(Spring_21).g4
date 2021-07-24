grammar Project;
root : declaration;
declaration:  declarationlist declarationtype declarationlist declarationtype body;
declarationlist: 'from' | 'import';
declarationtype: term | '*';
body: function;
function: 'func' term '('')'':' statement|'func' term '('term')'':' statement;
statement:
(
typespec
|datatype
|outputstm
|selectionstm
|scstement
|statementreturn
|loopstm
|initialization
|inputstm
|arraystm
)+
;
typespec: datatype VAR ';'| datatype VAR '=' DIGIT+';' | datatype VAR '=' ALPHABET+ ';'| datatype arraystm';';
datatype: integer | floatt | charr | doublee | boool;
statementreturn: 'return' term ';' |'return' exp ';';
initialization: VAR incop ';'| VAR decop';'| VAR '=' DIGIT+ ';'| VAR eqlop DIGIT+';'| VAR '=' VAR bsign VAR ';'| datatype VAR '=' VAR bsign VAR';'|arraystm '=' VAR';'| arraystm '=' DIGIT+';';
inputstm:  'input''(' VAR ')'';';
arraystm: VAR'['term']'| VAR'['term']''['term']';
selectionstm:
'if''('exp')'':'
|'if''('exp')'':' 'else'':'
|'if''('exp')'':' ('else if''('exp')'':')* ('else'':')? ;
loopstm: While '(' exp')' ':'
| Do ':' While '(' exp ')' ';'
| For '(' forCondition ')' ':';
forCondition: infinite|datatype VAR'=' term ';' VAR rop term ';' (VAR incop|decop)|VAR eqlop DIGIT+|VAR '=' term ';' VAR rop term ';' (VAR incop|decop)|VAR eqlop DIGIT+;
infinite:'\t\n\n';
scstement: 'break'';'|'continue'';';
bsign: '+' | '-' | '*' | '/'| '%' ;
lop : '&&' | '||' | 'and'| 'or'| 'in' ;
rop: '=' | '==' | '!=' | '>' | '>=' | '=>' | '<' | '<=' | '=<' ;
eqlop: '+='|'-='|'*=';
incop:'++';
decop:'--';
For:'for';
While:'while';
Do:'do';
exp: exp bsign exp | exp rop exp | exp lop exp | '(' exp')' | term | arraystm;
outputstm:'print''(' '"' exp '"'')'|'print''('  exp ')';
integer: 'integer';
floatt: 'float';
doublee: 'double';
charr: 'character';
boool : 'bool';
term: VAR|DIGIT;
VAR : ALPHABET(ALPHABET | DIGIT)*;
ALPHABET: [a-zA-Z]+;
DIGIT:[0-9]+;
WS: [\t\r\n]+ -> skip;