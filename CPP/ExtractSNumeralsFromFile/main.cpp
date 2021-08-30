#include <iostream>
#include<fstream>
#include<cctype>
#include<vector>

#include<string>
#include<sstream>
#include "gdata.h" //Local and user defined header file

using namespace std;


//Prototypes
bool isNumeric(string); //Prototype of the method that examine if the string is numeric or not

int main(int argc, char** argv) {
	vector<string> slist;  //vector to store strings
	vector<int> ilist;   //vector to store integers
	int n;
	
	fstream fin;   //Input file stream object
	
	if(argc==2)
	{
		fin.open(argv[1],ios::in); //Opening the file in read more
		if(fin.is_open()){         //If file opening is sucessful
			string str; //temporary string
			//Reading file content string by string
			while(fin>>str){
				
				if(isNumeric(str)){	       //Examiniing if the input string is a numeric one or not
					istringstream sin(str);
					sin>>n;
					
					ilist.push_back(n);   //Storing back in the integer list
				}
				else{
					slist.push_back(str);      //Storing back in the string list
				}
			
			}
			cout<<"STRINGS......"<<endl;
			//Displaying all string
			for(std::vector<string>::iterator s=slist.begin(); s!=slist.end(); ++s){
				cout<<*s<<" ";
			}
			cout<<endl<<"NUMERALS..."<<endl;
			//Displaying all numerals
			for(std::vector<int>::iterator si=ilist.begin(); si!=ilist.end(); ++si){
				cout<<*si<<" ";
			}
		}
		else{
			cout<<"Usage: "<<argv[0]<<endl;   //when system fails to locate/open the file
			usagemsg(file_opening_failed);
		}
	}
	else
	{
		//in case no arguments passed
		if(argc==no_file_name_found){
			cout<<"Usage: "<<argv[0]<<endl;
			
			usagemsg(no_file_name_found);
		}
		//If there are more than one argument
		if(argc>more_arguments){
			cout<<"Usage: "<<argv[0]<<endl;
			usagemsg(more_arguments);
		}

	}
	return 0;
}
bool isNumeric(string s){ //Method that scrutinize character by character to find whether the whole string is a numeric data or not
	for(int i=0;i<s.length();i++){
		if(isdigit(s[i])){
		}
		else{
			return false;
		}
	}
	return true;
}

