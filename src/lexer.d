import std.stdio,core.stdc.stdlib; 

int lineNumber=1;
int characterNumber=0;
int nextChar=0;

struct tok{
	TOK tok;
	string value;
	int line;
	int characterNumber;
}

enum TOK{
	lparen,
	rparen,
	rcparen,
	lcparen,
	EOF,
	equal,
	notequal,
	assign,
	division,
	keyword,
	identifier,
	number,
	semicolon,
	tilde,
	mod,
	notimplementet,
	comma,
	newline,
	space,
	tab,
	string,
	less,
	big,
	bigequal,
	lessequal,
	star,
	minus,
	plus,
	and,
	or,
	cha,
	dot,
}

string charToString(int c){
	if(c==32) return " ";
	else if(c==33) return "!";
	else if(c==34) return "\"";
	else if(c==35) return "#";
	else if(c==36) return "$";
	else if(c==37) return "%";
	else if(c==38) return "&";
	else if(c==39) return "'";
	else if(c==40) return "(";
	else if(c==41) return ")";
	else if(c==42) return "*";
	else if(c==43) return "+";
	else if(c==44) return ",";
	else if(c==45) return "-";
	else if(c==46) return ".";
	else if(c==47) return "/";
	else if(c==48) return "0";
	else if(c==49) return "1";
	else if(c==50) return "2";
	else if(c==51) return "3";
	else if(c==52) return "4";
	else if(c==53) return "5";
	else if(c==54) return "6";
	else if(c==55) return "7";
	else if(c==56) return "8";
	else if(c==57) return "9";
	else if(c==58) return ":";
	else if(c==59) return ";";
	else if(c==60) return "<";
	else if(c==61) return "=";
	else if(c==62) return ">";
	else if(c==65) return "A";
	else if(c==66) return "B";
	else if(c==67) return "C";
	else if(c==68) return "D";
	else if(c==69) return "E";
	else if(c==70) return "F";
	else if(c==71) return "G";
	else if(c==72) return "H";
	else if(c==73) return "I";
	else if(c==74) return "J";
	else if(c==75) return "K";
	else if(c==76) return "L";
	else if(c==77) return "M";
	else if(c==78) return "N";
	else if(c==79) return "O";
	else if(c==80) return "P";
	else if(c==81) return "Q";
	else if(c==82) return "R";
	else if(c==83) return "S";
	else if(c==84) return "T";
	else if(c==85) return "U";
	else if(c==86) return "V";
	else if(c==87) return "W";
	else if(c==88) return "Z";
	else if(c==89) return "Y";
	else if(c==90) return "Z";
	else if(c==91) return "[";
	else if(c==92) return "\\";
	else if(c==93) return "]";
	else if(c==94) return "^";
	else if(c==95) return "_";
	else if(c==96) return "`";
	else if(c==97) return "a";
	else if(c==98) return "b";
	else if(c==99) return "c";
	else if(c==100) return "d";
	else if(c==101) return "e";
	else if(c==102) return "f";
	else if(c==103) return "g";
	else if(c==104) return "h";
	else if(c==105) return "i";
	else if(c==106) return "j";
	else if(c==107) return "k";
	else if(c==108) return "l";
	else if(c==109) return "m";
	else if(c==110) return "n";
	else if(c==111) return "o";
	else if(c==112) return "p";
	else if(c==113) return "q";
	else if(c==114) return "r";
	else if(c==115) return "s";
	else if(c==116) return "t";
	else if(c==117) return "u";
	else if(c==118) return "v";
	else if(c==119) return "w";
	else if(c==120) return "x";
	else if(c==121) return "y";
	else if(c==122) return "z";
	else if(c==123) return "{";
	else if(c==124) return "|";
	else if(c==125) return "}";
	else if(c==126) return "~";
	assert(0,intToString(c)~" charToString: Number needs to be between 65 and 90 or 97 and 122");
}

string digitToString(int i){
	if(i==0) return "0";
	else if(i==1) return "1";
	else if(i==2) return "2";
	else if(i==3) return "3";
	else if(i==4) return "4";
	else if(i==5) return "5";
	else if(i==6) return "6";
	else if(i==7) return "7";
	else if(i==8) return "8";
	else if(i==9) return "9";
	assert(0,intToString(i)~"digitToString: i needs to be between 0 and 9");
}

int charToDigit(int i){
	if(i==48) return 0;
	else if(i==49) return 1;
	else if(i==50) return 2;
	else if(i==51) return 3;
	else if(i==52) return 4;
	else if(i==53) return 5;
	else if(i==54) return 6;
	else if(i==55) return 7;
	else if(i==56) return 8;
	else if(i==57) return 9;
	assert(0,"CharToDigit: char needs to be between 48 and 57");
}

string intToString(int i){
	if(i==0) return "0";
	string s="";
	bool negative=false;
	if(i<0){
		negative=true;
		i=i*-1;
	}
	while(i!=0){
		int temp=i%10;
		s= digitToString(temp)~s;
		i=i/10;
	}	
	if(negative) s="-"~s;
	return s;
}

void kill(string s){
	print("\n"~intToString(lineNumber) ~": " ~ s~"\n");
	exit(-1);
}
void print(string s){
	write(s);
}
void print(TOK t){
	write(t);
}

int getNextChar(){
	int c;
	characterNumber=characterNumber+1;
	if(nextChar!=0){
		c=nextChar;
		nextChar=0;
	}
	else c=getchar();	
	return c;
}

int peakNextChar(){
	assert(nextChar==0,"can't peak twice");
	nextChar=getNextChar();
	return nextChar;
}

bool isChar(int c){
	return (c>= 65 && c<= 90) || (c>=97 && c<=122);
}

bool isUnderscore(int c){
	return c==95;
}

bool isDigit(int c){
	return (c>= 48 && c<= 57);
}

bool isCharOrDigit(int c){
	return isDigit(c) || isChar(c);
}
void eatRestOfLine(){
	int c=getNextChar();
	if(c!='\n') eatRestOfLine();
	else lineNumber=lineNumber+1;
}
bool isKeyword(string s){
	return 
		(s=="if") ||
		(s=="else") ||
		(s=="while") ||
		(s=="continue") ||
		(s=="break") ||
		(s=="return")||
		(s=="int")||
		(s=="bool")||
		(s=="void")||
		(s=="char")||
		(s=="true")||
		(s=="false")||
		(s=="enum")||
		(s=="assert")||
		(s=="string");
}

tok getNextToken(){
	int c=getNextChar();
	if(c=='/'){

		//The line begins with / so its either a comment or division
		c=peakNextChar();

		//If next char is / we have a line comment
		if(c=='/'){

			//Eat all chars til we reach EndOfLine
			eatRestOfLine();
			return getNextToken();
		}

		//If next char is * it is a block comment
		else if(c=='*'){

			//Eat all chars till we reach */
			c=getNextChar();	
			while(true){
				if(c=='*'){
					c=getNextChar();
					if(c=='/'){
						break;		
					}
				}
				else c=getNextChar();
			}
			return getNextToken();
		}

		//If not followed by * or / it must be division
		else{
			return tok(TOK.division,"",lineNumber,characterNumber);
		}
	}
	else if(c=='\''){
		string s;
		string error= "Ill formed character";
		c=getNextChar();
		if(c=='\\'){
			c=getNextChar();	
			if(c=='\\' || c=='\'') s=charToString(c);
			else if(c=='n' || c=='t') s="\\"~charToString(c);
			else kill(error~", \\ not followed by \\ ' n or t, but followed by "~charToString(c));
		}
		else if(c>=32 && c<=126) s= charToString(c);
		else kill(error~", char not between 32 and 126 but is "~intToString(c));
		c=getNextChar();	
		if(c!='\'') kill(error~" not ended with ', but ended with "~charToString(c));
		return tok(TOK.cha,"",lineNumber,characterNumber);
	}
	else if(c=='"'){
		string currentString="";
		while(true){
			c=getNextChar();
			if(c=='\\'){
				int next=getNextChar();
				if(next=='"'){
					currentString= currentString~charToString('"');
					continue;
				}
				else if(next=='\\'){
					currentString= currentString~charToString('"');
					continue;
				}
			}
			if(c=='"') break;
			currentString=currentString~charToString(c);
		}
		return tok(TOK.string,currentString,lineNumber,characterNumber);
	}
	else if(isChar(c) || isUnderscore(c)){
		string currentString= charToString(c);
		c=peakNextChar();
		while(true){
			if(isChar(c) || isUnderscore(c) || isDigit(c)){
				getNextChar();
				currentString=currentString~charToString(c);
				c=peakNextChar();
			}
			else break;
		}
		if(currentString=="import"){
			eatRestOfLine();
			return getNextToken();
		}
		else if(isKeyword(currentString)){
			return tok(TOK.keyword,currentString,lineNumber,characterNumber);
		}
		else{

			return tok(TOK.identifier,currentString,lineNumber,characterNumber);
		}

	}
	else if(isDigit(c)){
		string currentNumber=digitToString(charToDigit(c));
		c=peakNextChar();
		while(true){
			if(isDigit(c)){
				getNextChar();
				currentNumber=currentNumber~digitToString(charToDigit(c));
				c=peakNextChar();
			}
			else{
				return tok(TOK.number,currentNumber,lineNumber,characterNumber);
			}
		}
	}
	//If c is tab continue
	else if(c=='\t') return tok(TOK.tab,"",lineNumber,characterNumber);

	//If c is space
	else if(c==' ') return tok(TOK.space,"",lineNumber,characterNumber);

	//If c is newline continue
	else if(c=='\n'){
		lineNumber=lineNumber+1;
		characterNumber=0;
		return tok(TOK.newline,"",lineNumber,characterNumber);
	}

	//This could be a comment
	else if(c=='='){
		if(peakNextChar()=='='){
			getNextChar();
			return tok(TOK.equal,"",lineNumber,characterNumber);
		}
		else return tok(TOK.assign,"",lineNumber,characterNumber);
	}
	else if(c=='!'){
		if(peakNextChar()=='='){
			getNextChar();
			return tok(TOK.notequal,"",lineNumber,characterNumber);
		}
		else kill("! but not followed by =");
	}
	else if(c=='<'){
		if(peakNextChar()=='='){
			getNextToken();	
			return  tok(TOK.lessequal,"",lineNumber,characterNumber);
		}
		return tok(TOK.less,"",lineNumber,characterNumber);
	}
	else if(c=='>'){
		if(peakNextChar()=='='){
			getNextToken();	
			return  tok(TOK.bigequal,"",lineNumber,characterNumber);
		}
		return tok(TOK.big,"",lineNumber,characterNumber);
	}
	else if(c=='&'){
		if(peakNextChar()=='&'){
			getNextChar();

			return tok(TOK.and,"",lineNumber,characterNumber);
		}
	}
	else if(c=='|'){
		if(peakNextChar()=='|'){
			getNextChar();

			return tok(TOK.or,"",lineNumber,characterNumber);
		}
	}
	else if(c==';') return tok(TOK.semicolon,"",lineNumber,characterNumber);
	else if(c=='(') return tok(TOK.lparen,"",lineNumber,characterNumber);
	else if(c==')') return tok(TOK.rparen,"",lineNumber,characterNumber);
	else if(c=='}') return tok(TOK.rcparen,"",lineNumber,characterNumber);
	else if(c=='{') return tok(TOK.lcparen,"",lineNumber,characterNumber);
	else if(c=='~') return tok(TOK.tilde,"",lineNumber,characterNumber);
	else if(c=='%') return tok(TOK.mod,"",lineNumber,characterNumber);
	else if(c==',') return tok(TOK.comma,"",lineNumber,characterNumber);
	else if(c=='*') return tok(TOK.star,"",lineNumber,characterNumber);
	else if(c=='-') return tok(TOK.minus,"",lineNumber,characterNumber);
	else if(c=='+') return tok(TOK.plus,"",lineNumber,characterNumber);
	else if(c=='.') return tok(TOK.dot,"",lineNumber,characterNumber);

	else if(c==EOF) return tok(TOK.EOF,"",lineNumber,characterNumber);
	assert(0,intToString(c)~" - "~intToString(lineNumber) ~ ":" ~intToString(characterNumber));
}

int main(){
	while(true){
		tok current= getNextToken();
		if(current.tok==TOK.EOF) return 0;
		else if(current.tok==TOK.newline) print("\n"~intToString(lineNumber)~" ");
		else if(current.tok==TOK.tab) continue;
		else if(current.tok==TOK.space) continue;
		else{
			print(current.tok);
			if(current.value!=""){
				print("("~current.value~")");
			}
			print(" ");

		}
	}
}
