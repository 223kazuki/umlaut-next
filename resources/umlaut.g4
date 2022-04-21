grammar umlaut;

types: type+ ;

type
  : 'type' identifier '{' member '}'
;

identifier
  : IDENTIFIER
;

member
  : IDENTIFIER ':' IDENTIFIER
;

IDENTIFIER
  : ('a'..'z'|'A'..'Z')+
;

fragment
INT
  : '0'..'9'+
;

NUMBER
  : '-'? ('0' | ( '1'..'9' INT* )) ('.' INT+)? EXPONENT?
;

NEWLINE
  : [\r\n] -> channel(HIDDEN)
;

WS
  : ' '+ -> channel(HIDDEN)
;

STRING
  : '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
;

fragment
EXPONENT
  : ('e'|'E') ('+'|'-')? ('0'..'9')+
;

fragment
HEX_DIGIT
  : ('0'..'9'|'a'..'f'|'A'..'F')
;

fragment
ESC_SEQ
  : '\\' ('"'|'\\'|'/'|'b'|'f'|'n'|'r'|'t')
  | UNICODE_ESC
;

fragment
UNICODE_ESC
  : '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
;