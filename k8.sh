#!/bin/bash

# Function to prompt for user input
prompt_for_input() {
  local prompt_message=$1
  local input_variable_name=$2
  read -p "$prompt_message: " $input_variable_name
}

# Prompt for each value
prompt_for_input "Enter cluster name" cluster_name
prompt_for_input "Enter region" region
prompt_for_input "Enter nodegroup name" nodegroup_name
prompt_for_input "Enter node type" node_type
prompt_for_input "Enter number of nodes" nodes
prompt_for_input "Enter minimum number of nodes" nodes_min
prompt_for_input "Enter maximum number of nodes" nodes_max

# Construct the command
eksctl_command="eksctl create cluster --name $cluster_name --region $region --nodegroup-name $nodegroup_name --node-type $node_type --nodes $nodes --nodes-min $nodes_min --nodes-max $nodes_max --managed"

# Show the constructed command and ask for confirmation
echo "The following command will be executed:"
echo "$eksctl_command"
read -p "Do you want to proceed? (Y/N): " confirmation

# Execute the command if the user confirms
if [[ "$confirmation" =~ ^[Yy]$ ]]; then
  eval $eksctl_command
else
  echo "Command execution canceled."
fi
