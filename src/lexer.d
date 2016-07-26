import std.stdio,core.stdc.stdlib; 

bool DEBUG=false;

string charToString(int c){
	if(DEBUG) write("Called CharToString with argument: "~intToString(c));
	if(c==65) return "A";
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
	kill("charToString: Number needs to be between 65 and 90 or 97 and 122");	
	return "";
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
	kill("digitToString: i needs to be between 0 and 9");
	return "";
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
	kill("CharToDigit: char needs to be between 48 and 57");
	return 0;
}

string intToString(int i){
	string s="";
	bool negative=false;
	if(i<0) negative=true;
	i=i*-1;
	while(i!=0){
		int temp=i%10;
		s= digitToString(temp)~s;
		i=i/10;
	}	
	if(negative) s="-"~s;
	return s;
}

void kill(string s){
	print("\n"~intToString(lineNumber) ~": " ~ s~'\n');
	exit(-1);
}
void print(string s){
	if(s=="\n") writeln();
	else write(s~" ");
}

int getNextChar(){
	int c;
	c=getchar();	
	return c;
}

bool isChar(int c){
	return (c>= 65 && c<= 122);
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
		(s=="string");
}

int lineNumber=1;
int main(){
	bool mightBeEqual=false;
	bool mightBeNotEqual=false;
	bool mightBeComment=false;
	bool workingOnString=false;
	bool workingOnNumber=false;
	string currentString;
	string currentNumber;
	while(true){
		int c=getNextChar();
		if(mightBeEqual){
			mightBeEqual=false;
			if(c=='='){
				print("EQUAL ");
				continue;
			}
			else print("ASSIGN ");
		}
		if(mightBeNotEqual){
			mightBeNotEqual=false;
			if(c=='='){
				print("NOTEQUAL");
				continue;
			}
			else kill("! but not followed by =");
		}
		if(mightBeComment){
			mightBeComment=false;
			//It is a line comment
			if(c=='/'){
				//Eat all chars til we reach EndOfLine
				eatRestOfLine();
				continue;
			}
			//It is a block comment
			else if(c=='*'){
				//Eat all chars till we reach */
				while(true){
					c=getNextChar();	
					if(c=='*'){
						c=getNextChar();
						if(c=='/'){
							break;		
						}
					}
				}
				continue;
			}
			//This should not happen
			else{
				print("DIVISION");
			}
		}
		if(workingOnString){
			if(isCharOrDigit(c)){
				currentString=currentString~charToString(c);
				continue;
			}
			else{
				if(currentString=="import") eatRestOfLine();
				else if(isKeyword(currentString)){
					print(currentString);
				}
				else{
					print("id("~currentString~")");
				}
				workingOnString=false;
				currentString="";
			}
		}
		if(workingOnNumber){
			if(isDigit(c)){
				currentNumber=currentNumber~charToString(c);			
				continue;
			}
			else{
				print("NUMBER("~currentNumber~")");
				currentNumber="";
				workingOnNumber=false;
			}
		}
		//If c is tab continue
		if(c=='\t') continue;

		//If c is space
		else if(c==' ') continue;

		//If c is newline continue
		else if(c=='\n'){
			lineNumber=lineNumber+1;
			print("\n");
		}

		//This could be a comment
		else if(c=='/'){
			mightBeComment=true;
		}
		else if(c=='='){
			mightBeEqual=true;
		}
		else if(c=='!'){
			mightBeNotEqual=true;
		}
		else if(c==';') print("SEMICOLON ");
		else if(c=='(') print("LPAREN ");
		else if(c==')') print("RPAREN ");
		else if(c=='}') print("RCPAREN ");
		else if(c=='{') print("LCPAREN ");
		else if(c=='~') print("TILDE ");
		else if(c=='%') print("MOD ");
		else if(isChar(c)){
			workingOnString=true;
			currentString= charToString(c);

		}
		else if(isDigit(c)){
			workingOnNumber=true;
			currentNumber=digitToString(charToDigit(c));
		}
		else if(c=='$') kill("bum");
		else if(c==EOF) return 0;
		else print("? ");

	}
}
