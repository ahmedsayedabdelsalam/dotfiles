# Toggl time tracking

When starting work on a task (a Jira key is given, or the user says to work on something), if `TOGGL_API_TOKEN` is set:
1. Pick the project from the workspace folder under `~/Sites/workspace/<name>/` the repo lives in: match `<name>` to a Toggl project name (`~/.claude/bin/toggl projects`, case-insensitive). There is no global default; if nothing matches, ask which project.
2. Run `~/.claude/bin/toggl current`; stop it first if it is for a different task.
3. Run `~/.claude/bin/toggl start "<JIRA-ID> <title>" <project_id>`.
4. Stop it with `~/.claude/bin/toggl stop` when the user says done, switches tasks, or the PR is merged.
5. When the task is finished, run `~/.claude/bin/toggl total <JIRA-ID>` and read the issue's existing Jira worklogs. Work out the per-day worklogs that are missing or short, show them to the user, and post them with `addWorklogToJiraIssue` only after the user confirms. Do the same before changing any existing worklog.

If the token is unset, skip silently. Mention start/stop in one short line.
