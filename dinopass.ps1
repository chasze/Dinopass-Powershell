#Gets a random password from dinopass api

New-Variable -Name "password" -Value (Invoke-WebRequest 'https://www.dinopass.com/password/strong').Content

#prompts for username
$user = Read-Host "Please enter username or email"
 
$password >> ~\Desktop\password.txt

 #copies the password to clipboard
 $password | clip	

#Prints to console



write-Output ("Username: $user 
Password: $password") 



if (Test-Path -Path "~\Desktop\Dinopass")
{
    write-Output ("Username: $user 
Password: $password") > ~\Desktop\Dinopass\$user.txt
}
else {
    mkdir ~\Desktop\Dinopass
    write-Output ("Username: $user 
Password: $password") > ~\Desktop\Dinopass\$user.txt

}


