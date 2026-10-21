# Story templates

Use the minimal template by default. Replace placeholders with supplied or verified information. Omit unavailable links and unsupported AC. The sample AC count is illustrative, not a limit. Keep all meaningful requirements.

## Minimal template

```markdown
# [Team prefix] [Specific change]

[Requirements](<requirement URL>)

## Context

[Where the change applies, what changes, and why if needed. Include shared scope and important exclusions without repeating them in every AC.]

## Acceptance Criteria

1. [Observable expected behaviour.]
2. [Another distinct outcome, if required.]
3. [Relevant edge case or unchanged behaviour, if required.]
```

## Optional blocks

Use only blocks supported by the input. Remove unused blocks completely. Do not copy these instructions into the ticket.

Place Covers before Context when confirmed requirement IDs exist.

```markdown
## Covers

- [Requirement ID] - [Relevant scope, including partial coverage if applicable]
```

Place a single supplied screenshot near Context without an extra heading. Use Mockup after Context when multiple images, states, or design references need grouping. Identify each state only when known.

```markdown
## Mockup

[Design](<design URL>)

[State or screen name]

![Supplied image description](<exact supplied image URL>)
```

Place grouped technical references after AC and other related material last. For only one or two links overall, prefer links near the top without these headings.

```markdown
## Tech Docs

[Technical design](<technical design URL>)

[Only a confirmed constraint needed to implement this ticket, if necessary.]

## Related Docs

[Related ticket or document](<related URL>)
```

Do not duplicate a reference across blocks. Do not add generic technical notes or unrelated links just to fill the template. Adapt bug tickets when reproduction and actual/expected behaviour are needed and supplied.
