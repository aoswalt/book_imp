# Overview

The command system should be usable across platforms. For example, Slack, SMS, and rest api have different semantics and capabilities.

Platforms could implement more specialized capabilities. Slack could incorporate UI elements; rest api could include more context.

# Commands

A simple command can be stateful in its prompt to get the required arguments if not all are given.

Complex commands / interactions could involve multiple steps.

General operational commands should exist: help, quit, status, etc.

# Baseline Components

* script handler
* config file handler
* permissions
  * roles?

# Plugins

## Admin

Are these optional or baseline?

* database
* UI
  * extendible by plugins

## Platform Examples

* cli
* rest api
* sms
* slack
* mattermost
* twitter*

## Integrations Examples

* todoist
* twitter*
* github
* bitbucket
* jira
* jenkins

Are the twitter platform and integration components 1 plugin or 2 separate ones?

# Future Work

Some commands may need to specify platform to send response message to.

# Concerns

Baseline functionality needs to be focused.
