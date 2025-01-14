#!/usr/bin/env bash

# Cache the plugins
mkdir -p ~/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_DIR=~/.terraform.d/plugin-cache
export TF_INPUT=0

DIRECTORIES=( \
"{{ cookiecutter.region }}/citizen/ec2" \
"{{ cookiecutter.region }}/citizen/sg" \
"{{ cookiecutter.region }}/citizen/keys" \
"{{ cookiecutter.region }}/p-rep/ec2" \
"{{ cookiecutter.region }}/p-rep/sg" \
"{{ cookiecutter.region }}/p-rep/keys" \
"{{ cookiecutter.region }}/network/vpc" \
"global/audit/s3-cloudtrail" \
"global/audit/cloudtrail" \
"global/profiles/citizen" \
"global/profiles/p-rep" \
"{{ cookiecutter.region }}/logging/log-config-bucket" \
)

for i in "${DIRECTORIES[@]}"
do
   terragrunt destroy -auto-approve --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir $i
done

#terragrunt destroy --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir {{ cookiecutter.region }}/citizen
#terragrunt destroy-all --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir {{ cookiecutter.region }}/p-rep
#terragrunt destroy-all --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir {{ cookiecutter.region }}/logging
#terragrunt destroy-all --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir {{ cookiecutter.region }}/network
#terragrunt destroy-all --terragrunt-source-update --terragrunt-non-interactive --terragrunt-working-dir global

