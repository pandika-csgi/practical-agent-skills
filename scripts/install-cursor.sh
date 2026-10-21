#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'HELP'
Copy local skills to a directory discovered by Cursor.

Usage
  ./scripts/install-cursor.sh --project /path/to/project [--skill NAME]
  ./scripts/install-cursor.sh --global [--skill NAME]

Project copies go to .cursor/skills/ inside the selected project.
Global copies go to ~/.agents/skills/ for the current user.
Without --skill, all skills in this repository are copied.
Existing folders are skipped. No files are downloaded or executed.
HELP
}

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

mode=''
project=''
selected=''
while [ "$#" -gt 0 ]; do
  case "$1" in
    --project)
      [ -z "$mode" ] || fail 'Choose either --project or --global.'
      [ "$#" -ge 2 ] && [ -n "$2" ] && [[ "$2" != --* ]] || fail 'Provide a project path after --project.'
      mode='project'
      project="$2"
      shift 2
      ;;
    --global)
      [ -z "$mode" ] || fail 'Choose either --project or --global.'
      mode='global'
      shift
      ;;
    --skill)
      [ "$#" -ge 2 ] && [ -n "$2" ] || fail 'Provide a skill name after --skill.'
      [ -z "$selected" ] || fail 'Choose only one skill, or omit --skill for all skills.'
      selected="$2"
      [[ "$selected" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || fail 'Use a lowercase, hyphen-separated skill name.'
      shift 2
      ;;
    --help|-h) usage; exit 0 ;;
    *) fail "Unknown option $1" ;;
  esac
done

[ -n "$mode" ] || { usage; exit 1; }
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd -- "$script_dir/.." && pwd -P)"
skills_root="$repo_root/skills"
[ -d "$skills_root" ] || fail 'The repository skills folder is missing.'

if [ "$mode" = 'project' ]; then
  [ -d "$project" ] || fail 'The project folder does not exist.'
  destination="$(cd -- "$project" && pwd -P)/.cursor/skills"
else
  [ -n "${HOME:-}" ] || fail 'HOME is not set.'
  destination="$HOME/.agents/skills"
fi

sources=()
if [ -n "$selected" ]; then
  [ -f "$skills_root/$selected/SKILL.md" ] || fail "Skill not found $selected"
  sources+=("$skills_root/$selected")
else
  for source in "$skills_root"/*; do
    [ -f "$source/SKILL.md" ] || continue
    sources+=("$source")
  done
fi
[ "${#sources[@]}" -gt 0 ] || fail 'No skills found.'

# Check sources and paths before copying anything.
for source in "${sources[@]}"; do
  [ ! -L "$source" ] || fail 'Skill folders must not be symbolic links.'
  [ -z "$(find "$source" -type l -print -quit)" ] || fail 'Skill files must not contain symbolic links.'
  case "$destination/" in
    "$source/"*) fail 'The destination must be outside the source skill folder.' ;;
  esac
done

mkdir -p -- "$destination"
for source in "${sources[@]}"; do
  name="$(basename -- "$source")"
  target="$destination/$name"
  if [ -e "$target" ] || [ -L "$target" ]; then
    printf 'Skipped existing skill %s\n' "$name"
    continue
  fi
  cp -R -- "$source" "$target"
  printf 'Copied %s to %s\n' "$name" "$target"
done
