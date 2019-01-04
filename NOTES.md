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

## Standalone Examples

* TIL
  * also UI
* poll
* reminders

## Integrations Examples

* todoist
* twitter*
* github
* bitbucket
* jira
* jenkins

Are the twitter platform and integration components 1 plugin or 2 separate ones?

# Scripting

Custom user commands should be easy to create.

Can these be `.exs` files and loaded with `Code.eval_file`?

## Commands

sigil style

Easy to write but how to handle body? Normal function?

```elixir
~C"remind {who:self} {what} {when}"

def remind(who, what, at) do
  post("https://reminder.api/reminders", %{
    who: who,
    what: what,
    when: at
  })

  say("#{who} will be reminded to #{what} on #{at}")
end
```

script style
```elixir
command remind do
  who = param(default: :self)
  what = param("What do you want to remember?")
  at = param("When do you want to be reminded?")

  post("https://reminder.api/reminders", %{
    who: who,
    what: what,
    when: at
  })

  say("#{who} will be reminded to #{what} on #{when}")
end
```

```elixir
command giphy do
  term = param("What do you want to giphy-ify?")

  # giphy api doesn't quite work this way
  response = get("https://giphy.com?q=#{term}")
  first = List.first(response["data"])

  # too complex for a scripted command?
  if first do
    image = first["images"]["downsized"]["url"]
    show(:image, image)
  else
    say("Nothing found")
  end
end
```

## Interactions

```elixir
interaction complete_task do
  say("Tasks remainng:")
  user
  |> get_tasks()
  |> Enum.map(&("#{&1.id} - #{&1.tile}"))
  |> Enum.join("\n")
  |> say()

  # pagination handling?

  id = prompt("Complete which task?")

  say("Task #{task_id} completed")
end
```

# Future Work

Some commands may need to specify platform to send response message to.

# Concerns

Baseline functionality needs to be focused.
