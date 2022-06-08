#   AWS and Terraform: Infrastructure as Code
In my E-Portfolio, I will introduce you to the world of infrastructure as code, short IaC. If you want to follow along, you will need:
- a free-tier AWS Account (as long as you do as I say, you won't be charged anything)
- the AWS-CLI installed on your PC
- the Terraform CLI installed on your PC

## A free-tier AWS Account
The one thing immediately annoying anyone trying to get a free AWS Account is that you need a credit card. If you don't have one, I'm afraid you will need to follow along on my presentation. Also, I can totally understand if you do not want to go through the hassle of setting up an AWS Account (which is NOT THE SAME as a normal Amazon Account!), don't worry, I'll show every step on the screen ;) If you do want to register and follow along, you can find the official AWS docs for creating and activating an account [here](https://aws.amazon.com/de/premiumsupport/knowledge-center/create-and-activate-aws-account/).

## The AWS-CLI installed on your PC
for this, there is an official guide [too](https://docs.aws.amazon.com/de_de/cli/latest/userguide/getting-started-install.html), I'll try to explain it in short fashion here as well.
### Linux
On Linux, you can simply execute these commands:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
### MacOS
On MacOS, there are 3 different methods, I'm only going to explain one here. Therefore, you also have to just execute these commands:
```bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```
### Windows
On Windows, you can just execute these command:
```
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```
---
To check if the installation worked, execute `aws --version`.

To configure the AWS-CLI, you will first need to create a AWS Access Key on the web console:
1. sign in to the [AWS management console](https://eu-central-1.console.aws.amazon.com) with your E-Mail and Password
1.  on the top right Dropdown-Menu, go onto "[Security Credentials](https://us-east-1.console.aws.amazon.com/iam/home?region=eu-central-1#/security_credentials)"
1. click on "Access Keys", then on "Create New Access Key". You can now download the Key file. !DO NOT SHARE THIS INFORMATION!
1. now, open a Terminal and execute the command `aws configure`. You will get asked for a few things:
    - AWS Access Key ID [None]:  `enter_your_access_key_id_here`
    - AWS Secret Access Key [None]: `enter_your_secret_access_key_here`
    - Default region name [None]: `eu-central-1`
    - Default output format [None]: `json`
- You don't need to choose eu-central-1 as your region, but it is recommended as it is the closest to our geographical location.

## The Terraform CLI installed on your PC
The official installation guide from Hashicorp are [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).
### Install on Linux
Terraform is downloadable through the package managers apt-get, yum and dnf. For detailed instructions, please visit [this site](https://learn.hashicorp.com/tutorials/terraform/install-cli).
### Install on MacOS X
You can install Terraform by executing these commands:
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform
```
### Install on Windows using Chocolatey
If you have the Chocolatey Package Manager installed, just execute `choco install terraform` in an elevated command line. If you do not have Chocolatey installed, please visit [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) for installation and [this stackoverflow article](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) for setting the PATH variable.

---
To check if this installation worked, execute `terraform -help`.
If you have problems somewhere on the way, just contact me on Discord @axolotl#1337. I am welcome to help with any problem you might have. 
Now, you have everything ready for my E-Portfolio! See you soon :)