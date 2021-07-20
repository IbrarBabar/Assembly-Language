#include <iostream>
using namespace std;
void login();
#include <iostream>
#include <stdlib.h> //system ("cls") is defined here
#include<string>   //string library
using namespace std;

char patients[100] = { 'A', 'B' }; //Ids A and B are already registered.
int doctors[2] = { 0,0 }; //  0 represents doctor is available 1 represents doctor is not available  
int patientsSize = 2; //variable initialization
string firstname, lastname, fullname;

void signup(); //function prototype
void login();
void consult();





void main()
{
	char reply; //variable declaration

	cout << " \t\t\t |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| " << endl;
	cout << endl;
	cout << " \t\t\t WELCOME TO TELEMEDICINE CONSULTATION SYSTEM!! " << endl;
	cout << " \t\t\t By: Rida Tul Iman, Muhammad Saad Ali, Awais Khan, Hassaan Kashif " << endl;
	cout << endl;
	cout << " \t\t\t |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| " << endl;
	cout << endl;
	/*cout << "Enter your first name:" << endl;
	cin >> firstname;
	cout << "Enter your last name:" << endl;
	cin >> lastname;
	fullname = firstname + " " + lastname;
	cout << "\t\t\t\t\t\t HELLO"" " << fullname << "!!";
	cout << endl;*/
	cout << " \t\t\t |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| " << endl;
	cout << endl;


	while (true)
	{
		cout << "\n\n\t\t\tPress 1 for Registeration In TMC" << endl;
		cout << "\t\t\tPress 2 for Login" << endl;
		cout << "\t\t\tPress 3 To Exit the system" << endl;
		int choice;
		cin >> choice;
		if (choice == 1)
			signup();
		else if (choice == 2)
			login();
		else if (choice == 3)
			break;

	}
	cout << "Thanks for Usin TMC Service" << endl;
	/*while (true)
	{

		signup(); //function calling

		login();

		break;
	}*/


}


void signup()
{
	system("cls");
	while (true)
	{
		cout << "\n \t\t\t SIGN UP PAGE!!" << endl;
		cout << " \t\t\t ==============" << endl;
		cout << "\n \t\t\t Enter Patient ID: ";
		cout << "\n \t\t\t NOTE: Only enter Alphabets!!!:   ";
		char id;
		cin >> id;
		id = toupper(id); //converts lowercase letter to uppercase letter
					//so user can enter either lowercase or uppercase letter, both are accepted.

		bool checkIfDuplicate = false; //program will check if ID already exists or not.

		cout << "\n" << endl;


		if (isalpha(id)) //checks if entered value is an alphabet.
		{

			for (int i = 0; i < patientsSize; i++) //for loop
			{
				if (patients[i] == id) //if user enters A or B, these IDs already exist.
				{
					cout << " \t\t\t This ID already Exists. Try Again." << endl;
					checkIfDuplicate = true;
					break;
				}
			}

			if (!checkIfDuplicate)
			{ //if user enters any ID other than A or B, sign up is successful.
				patients[patientsSize] = id;
				patientsSize++;

				cout << "\n" << endl;
				cout << " \t\t\t" << id << "  Registered Successfully" << endl;
				break;
			}



		}
		else
		{
			cout << " \t\t\t Please Enter Only Alphabets" << endl;
		}

	}


}



void consult()
{
	int id; //variable declaration;
	system("cls");
	cout << "\n \t\t\t DOCTORS' CONSULTATION PAGE!!" << endl;
	cout << " \t\t\t ============================" << endl;
	cout << "\n \t\t\t Doctors: Ali and Ahmed. \n \t\t\t For Dr. Ali, enter 1 \n \t\t\t For Dr. Ahmed enter 2." << endl;
	cout << endl;
	cout << " \t\t\t Enter Doctor ID: ";
	cin >> id;
	system("cls");

	//if user enters 1, doctor Ali will contact him/her.
	//if user enters 2, doctor Ahmed will contact him/her.
	//if any doctor is alreday assigned to a patient, he cannot be assigned again
	//patient will have to choose other doctor.

	if (doctors[id - 1] == 0)
	{
		cout << " \t\t\t Doctor No. " << id << " Will Contact You." << endl;
		doctors[id - 1] = 1;
	}
	else
	{
		if (id == 1)
		{
			if (doctors[1] == 0)
			{
				cout << " \t\t\t Sorry Doctor No 1 is assigned to another patient " << endl;
				cout << " \t\t\t Doctor No 2 will contanct you now" << endl;
				doctors[1] = 1;
			}
			else
			{
				cout << " \t\t\t Sorry No Doctor Is Available" << endl;
			}
		}
		else if (id == 2)
		{
			if (doctors[0] == 0)
			{
				cout << " \t\t\t Sorry Doctor No 2 is assigned to another patient " << endl;
				cout << " \t\t\t Doctor No 2 will contanct you now" << endl;
				doctors[0] = 1;
			}
			else
			{
				cout << " \t\t\t Sorry No Doctor Is Available" << endl;
			}




		}
	}


}

void login()
{
	system("cls");
	int loginCount = 0; // variable initialization.
					   //times user is allowed to try to login.

	while (true)
	{

		char id; //variable declaration.

		cout << " \n \t\t\t LOGIN PAGE!!" << endl;
		cout << " \t\t\t ============" << endl;
		cout << " \t\t\t Enter Login id: ";
		cin >> id;
		id = toupper(id);

		bool checkIfIdExists = false; //variable initialization
		system("cls");
		for (int i = 0; i < patientsSize; i++)
		{
			if (patients[i] == id)
			{
				checkIfIdExists = true;
				break;
			}
		}

		if (checkIfIdExists)
		{
			system("cls"); //previous page is removed.

			cout << "\n " << endl;
			cout << " \t\t\t " << id << "  Logged In Succesfully" << endl;
			consult();

			break;


		}
		else
		{
			cout << " \t\t\t Wrong ID: re-Enter ID." << endl;
			loginCount++;
			//only 3 login attempts are allowed.
			if (loginCount >= 3) //if 3 login attempts are made, user is asked to sign up.
			{

				cout << " \t\t\t You are not a registered patient sign up first." << endl;
				signup(); //function calling
				break;


			}

		}
	}

}