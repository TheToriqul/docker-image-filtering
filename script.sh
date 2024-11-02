#!/bin/bash

###############################################################################
#
# Docker Image Filtering Reference Commands
# Author: Md Toriqul Islam
# Description: Command reference for Docker image filtering and management
# Note: This is a reference script. Do not execute directly.
#
###############################################################################

#------------------------------------------------------------------------------
# Basic Image Filtering
#------------------------------------------------------------------------------

# List all images
docker images

# List images with specific format
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"

# List dangling images
docker images --filter "dangling=true"

#------------------------------------------------------------------------------
# Advanced Filtering Techniques
#------------------------------------------------------------------------------

# Filter by label
docker images --filter "label=maintainer=toriqul.int@gmail.com"

# Filter by reference (repository/tag)
docker images --filter=reference='alpine:latest'

# Filter images by time
docker images --filter "before=alpine:latest"
docker images --filter "since=ubuntu:latest"

#------------------------------------------------------------------------------
# Size-Based Filtering
#------------------------------------------------------------------------------

# List images with size (using custom format)
docker images --format "{{.Repository}}:{{.Tag}} {{.Size}}"

# Find large images (using shell tools)
docker images --format "{{.Repository}}:{{.Tag}}\t{{.Size}}" | \
    awk '$2 ~ /GB$/ {print}'

#------------------------------------------------------------------------------
# Cleanup Operations
#------------------------------------------------------------------------------

# Remove dangling images
docker image prune

# Remove all unused images
docker image prune -a

# Remove specific image
docker rmi image_name:tag

#------------------------------------------------------------------------------
# Output Formatting
#------------------------------------------------------------------------------

# Custom table format
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"

# JSON output
docker images --format "{{json .}}"

# Specific fields
docker images --format "ID: {{.ID}} - Created: {{.CreatedSince}}"

#------------------------------------------------------------------------------
# Complex Filtering Combinations
#------------------------------------------------------------------------------

# Multiple filters
docker images --filter "dangling=false" --filter "label=environment=production"

# Filter with size threshold (example using shell tools)
docker images --format "{{.Repository}}:{{.Tag}}\t{{.Size}}" | \
    awk '$2 ~ /MB$/ && $2 > 100 {print $1}'

###############################################################################
# End of Reference Commands
###############################################################################