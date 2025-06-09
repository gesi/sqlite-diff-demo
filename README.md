# Diffing sqlite databases in git

This is a (somewhat) minimal demo for diffing sqlite3 files in git. Thanks to
Adam Dunkels for [this guide][adam_guide]!

## How it works

### `.gitconfig`: adds a git diff driver

Basically we configure git to dump the database in a text format, which it can
use to display our diff. This is done with a custom diff driver with a
[`textconv` property][doc_textconv], defined in [`.gitconfig#L4`](.gitconfig#L4)

### `.envrc`: updates the local git configuration

Since there is no way of telling git to include our `.gitconfig` automatically
when the repository is cloned, we need to
[update our local configuration](.envrc#L2). If you have [direnv] installed,
just run `direnv allow`. If not, execute it manually with `bash .envrc`.

### `test.sh`: creates a diff and displays it

This script simply inserts a record into our database and runs `git diff`.

[adam_guide]: https://dunkels.com/adam/git-diff-sqlite3/
[doc_textconv]: https://git-scm.com/docs/diff-config#Documentation/diff-config.txt-diffltdrivergttextconv
[direnv]: https://direnv.net/
