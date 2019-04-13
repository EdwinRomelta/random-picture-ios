#!/bin/bash
carthage update --platform iOS
carthage build --platform iOS
xcodegen -s ui/project.yml
xcodegen -s presenter/project.yml
xcodegen -s domain/project.yml
xcodegen -s data/project.yml
xcodegen -s cache/project.yml
xcodegen -s remote/project.yml