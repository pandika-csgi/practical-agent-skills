# Agent Skills

Reusable instructions for AI assistants. Each skill covers one task and includes examples or templates when useful.

The collection starts with a skill for clear engineering tickets. More skills can be added in separate folders.

## Available skills

[Shortcut story writing](skills/shortcut-story-writing/SKILL.md) helps draft and simplify engineering tickets in simple English. It keeps the scope and acceptance criteria while removing repeated explanations and unnecessary formatting.

[Templates](skills/shortcut-story-writing/references/templates.md) and [fictional examples](skills/shortcut-story-writing/references/examples.md) are included.

## Installation

The local script copies skill folders, including references, into a location that [Cursor discovers](https://cursor.com/docs/skills). It does not use npm, download packages, or send files to a service. You need Bash and standard file tools, available on macOS and Linux or through Git Bash on Windows. On Windows, check that HOME points to your normal user folder before using --global.

On macOS, open Terminal in the repository root. Zsh can launch this script directly. The shebang selects the built-in Bash interpreter, so you do not need to type `bash` or install another shell. Do not run it with `zsh scripts/install-cursor.sh`.

If the downloaded copy is not executable, set permission once

```sh
chmod +x scripts/install-cursor.sh
```

Then use either command below.

For one project, replace the example path with an existing project folder

```bash
./scripts/install-cursor.sh --project "/path/to/your-project" --skill shortcut-story-writing
```

The copy goes into `.cursor/skills/shortcut-story-writing/` inside that project.

For all projects on your machine

```bash
./scripts/install-cursor.sh --global --skill shortcut-story-writing
```

The global copy goes into `~/.agents/skills/shortcut-story-writing/`, which Cursor also discovers. This script does not enable cloud sync or publish skills.

To copy every skill in this repository, omit `--skill shortcut-story-writing`. Existing skill folders are skipped, not overwritten or updated. To update an installed copy, move the old folder outside the skills directory, then run the script again.

Restart Cursor after copying. In Agent chat, type `/` and select the skill name. If it does not appear, check that the destination contains the skill folder and its `SKILL.md` file.

Only the copy step is offline. Using the skill in Cursor still follows your Cursor settings and your organisation's policies.

## Usage

1. Start a session in your selected assistant after installing or providing the skill files.
2. Request the skill by name and provide the task and relevant source material.
3. Review the result for accuracy and missing requirements before using it.

Example request

```text
Use shortcut-story-writing to simplify the story below.
Keep the confirmed scope and UI labels. Do not invent missing requirements.

[Paste the story and relevant source material]
```

These files provide instructions. They do not grant access to external systems or publish tickets by themselves.

## Repository structure

```text
agent-skills/
├── README.md
├── LICENSE
├── .gitignore
├── scripts/
│   └── install-cursor.sh
└── skills/
    └── shortcut-story-writing/
        ├── SKILL.md
        └── references/
            ├── examples.md
            └── templates.md
```

## Adding a skill

1. Create a folder under `skills/` with a short, lowercase, hyphen-separated name.
2. Add a `SKILL.md` with a name, description, and focused instructions. The existing skill shows the format.
3. Add `references/`, `scripts/`, or `assets/` only when needed. Check that referenced files are included.
4. Try the skill on a representative task and check whether it preserves the important details.
5. Add it to the available skills section in this README.

Keep writing plain. Avoid em-dashes, bold-label bullets, colons used as prose separators, repeated summaries, and unnecessary sections. Prefer numbered lists for distinct points. Use subject-led sentences when they are clearer than repeated commands.

Only commit material you have the right to share. Examples should be fictional or explicitly cleared for public use. Check files for private links, company details, personal data, and secrets before committing. Ignore rules are not a security check.

## License

This starter includes the [MIT License](LICENSE), a permissive option that allows reuse, modification, and distribution, including commercial use. Copies must retain the copyright and license notice. The work is provided without warranty.

The standard text is available from [Choose a License](https://choosealicense.com/licenses/mit/). GitHub explains why licenses matter in its [repository licensing guide](https://docs.github.com/articles/licensing-a-repository).

Before publishing, check the copyright holder in `LICENSE` and confirm that you have the right to license all included material. A license does not remove confidentiality obligations or grant rights to someone else's work.
