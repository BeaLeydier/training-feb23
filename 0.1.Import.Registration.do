/*******************************************************************************
				IRC Registration Data De-Identification 
				
Description: This do file contains the scripts to import IRC registration data
raw into the repo, and deidenfify it. The file subsequent 1.1.Build.Registration 
is what merges all IRC individual registration files and cleans them for sampling.

We bring across only those dated registration files used in sampling:
- July 13 data (for initia Kawangware)
- July 22 data (for Kawangware)
- August 16 data (for Pangani)
- October 4 data (for Kitengela and Rongai)
*******************************************************************************/

/*******************************************************************************
							File Path Setups 
*******************************************************************************/
* Defining local file paths 
clear all 
set more off 

* Local path definitions 
if c(username)=="enrico" {
	global irc "/Users/enrico/Library/CloudStorage/Box-Box/GU-partner data transfers-irc rebuild kenya"
	gl box "/Users/enrico/Library/CloudStorage/Box-Box/ReBuild Kenya_Data"
	gl github "/Users/enrico/Git/reBuild_Kenya"
}
else if ("`c(username)'" == "az332") {
	global irc "D:\Box\GU-partner data transfers-irc rebuild kenya"
	global box "D:/Box/ReBuild Kenya_Data"
	global github "D:/reBuild_Kenya"
}
else if ("`c(username)'" == "bl517") {
	global irc "C:/Users/bl517/Box/GU-partner data transfers-irc rebuild kenya"
	global box "C:/Users/bl517/Box/ReBuild Kenya_Data"
	global github "C:/Users/bl517/Documents/Github/reBuild_Kenya"
}
else {
	di as err "Please enter machine-specific path information for the git repo"
	exit
}

****************************************************************************
/*  Import and de-identify dated registration files used */
****************************************************************************
global personal_id_data Clientname regst_birthdate Phone1 Phone2 Fullregistrationdate ReBuildID Whatsappnumber Emailaddress OfficialIDnumber regst_por_num regst_username

//  July 13 -- initial Kawangware sample
import excel using "$irc/ke rct data as at 13th july, 2022.xlsx", firstrow clear
drop $personal_id_data
save "$github/1_source/registration_20220713.dta", replace 

//  July 22
import excel using "$irc/ke rct data as at 22nd july, 2022.xlsx", ///
	firstrow clear // case(lower)
drop $personal_id_data
save "$github/1_source/registration_20220722.dta", replace 

//  August 16
import excel using "$irc/ke rct data as at 16th august, 2022.xlsx", firstrow clear // case(lower) 
drop $personal_id_data
save "$github/1_source/registration_20220816.dta", replace 
