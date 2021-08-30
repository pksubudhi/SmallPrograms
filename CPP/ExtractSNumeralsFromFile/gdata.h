#include<iostream>
using namespace std;
enum ErrorCode
{
	no_file_name_found=1, more_arguments=2, file_opening_failed=3	
};
void usagemsg(int ecode){
	cout<<"Usage: Operation failed due to.."<<endl;
	switch(ecode){
		case no_file_name_found:
			cout<<"You have not supplied input file name!"<<endl;
			break;
		case more_arguments:
			cout<<"To many aruments passed at command line processing!"<<endl;
			break;
		case file_opening_failed:
			cout<<"Either the said file does not esist or Unable to open the file!"<<endl;
	}
}
