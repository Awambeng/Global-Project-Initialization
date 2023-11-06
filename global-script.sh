#!/bin/bash
echo " "
echo "Hello, $(whoami)! welcome to our project setup script"
echo "***************************************************************"
echo " "

# function to create a python project environment
create_python_project(){
	echo "Setting up a new python project...."
	read -p "Enter the project name: " project_name
	echo "Creating project directories...."
	mkdir "$project_name"
	mv $project_name /home/$(whoami)/Desktop
	cd "/home/$(whoami)/Desktop/$project_name"
	mkdir "src"
	touch "./src/starter.py"
	echo "Setting up the virtual environment...."
	python3 -m venv venv
	echo "Virtual environment created successfully!!!"
	echo "To activate the virtual environment, use the command
	'source venv/bin/activate'"
	echo "You can start working on your python project now."
	echo "project $project_name" >> README.md
	echo "Project setup" >> README.md 
	echo "Clone the repository: \`git clone <repository_url>\`" >> README.md
	echo "Change directory: \`cd $project_name\`" >> README.md

	echo "Quick start"
	echo "Follow the instructions specific to your project type." >> README.md
}

#function to create a bash project environment
create_bash_project(){
	echo "Setting up a new bash project...."
	read -p "Enter the project name: " project_name
	echo "Creating project directories...."
	mkdir "$project_name"
	mv $project_name /home/$(whoami)/Desktop
	cd "/home/$(whoami)/Desktop/$project_name"
	mkdir "scripts"
	touch "./scripts/starter.py"
	echo "You can start working on your bash project now."
	echo "project $project_name" >> README.md
	echo "Project setup" >> README.md 
	echo "Clone the repository: \`git clone <repository_url>\`" >> README.md
	echo "Change directory: \`cd $project_name\`" >> README.md

	echo "Quick start"
	echo "Follow the instructions specific to your project type." >> README.md
	echo "Remember to make your bash script executable using 
	'chmod +x script_name.sh' and use 'bash script_name.sh' to
	execute the script" >> ./README.md
	echo " "
	echo "Your new project is found in the Desktop directory..."
	echo $PATH
	mv ./global-script.sh /usr/local/bin
}

# Main menu

while true
do
	echo " "
	echo "Please what type of project will you like to setup"
	echo "*****************************************************************"
	echo " "
	echo "******************* PROJECT TYPES *******************************"
	echo " "
	echo "1- Python project"
	echo " "
	echo "2- Bash project"
	echo " "
	read -p "Please select the type of project: " choice
	case $choice in
		1) create_python_project;;
		2) create_bash_project;;
		*) echo "Invalid choice. Exiting.";;
	esac
done
