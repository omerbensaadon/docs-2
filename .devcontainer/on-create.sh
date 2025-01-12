#!/bin/bash

## Get branch Rad Bicep version number
CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" = "edge" ]; then
    RADIUS_VERSION=edge
else
    ## If CURRENT_BRANCH matches a regex of the form "v0.20", set RADIUS_VERSION to the matching string minus the "v"
    if [[ "$CURRENT_BRANCH" =~ ^v[0-9]+\.[0-9]+$ ]]; then
        RADIUS_VERSION=${CURRENT_BRANCH:1}
    else
        ## Otherwise, set RADIUS_VERSION to "edge"
        RADIUS_VERSION=edge
    fi
fi

## Download Bicep extension
curl https://get.radapp.dev/tools/vscode-extensibility/$RADIUS_VERSION/rad-vscode-bicep.vsix --output /tmp/rad-vscode-bicep.vsix
