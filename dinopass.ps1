#Gets a random password from dinopass api


New-Variable -Name "password" -Value (Invoke-WebRequest 'https://www.dinopass.com/password/strong').Content

#prompts for username
write-Output "Welcome to the DinoPass password generator script!"
$user = Read-Host "Please enter username or email"
 

 #copies the password to clipboard
 $password | clip	


$folderCheck = Test-Path -Path "~\Desktop\Dinopass"


function GeneratePass { 
    if(Test-Path -Path "~\Desktop\Dinopass\$user.txt") 
    {   
        $response = Read-Host "$user already exist, password will be overwritten type Y to proceed or any other to cancel"
                if ($response -match "Y" -or $response -match "y") {
                    write-Output ("Username: $user 
    Password: $password") > ~\Desktop\Dinopass\$user.txt



                    
    
                }
                else {
                   break
                }
 } }



if (-Not $folderCheck) {
    mkdir ~\Desktop\Dinopass
    GeneratePass }



if ($folderCheck) { 
    GeneratePass
}






write-Output ("Username: $user 
Password: $password") > ~\Desktop\Dinopass\$user.txt

write-Output ("Username: $user 
Password: $password")

#why did I spend so much time making this?
write-Output ("File created Sucessfully")
$openFolder = Read-Host "Do you wish to open the text file? Y-Yes any other key -exit" 

if ($openFolder -match "Y" -or $response -match "y"){ Invoke-Item ~\Desktop\Dinopass\$user.txt}
else { break } 
