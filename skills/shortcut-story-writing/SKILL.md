---
name: shortcut-story-writing
description: Draft and refine Shortcut stories and engineering tickets in concise, simple English. Use for feature stories, bug tickets, acceptance criteria, or removing repetitive AI-style writing while preserving requirements and scope. Do not use for merely retrieving tickets or explaining Shortcut.
---
# Shortcut story writing

Write for engineers who need to understand the change and verify completion. Remove repetition, not requirements. Read references/examples.md before drafting to calibrate tone and structure. Treat its domain details as examples, never as requirements for another ticket.

## Ground the content

1. Identify the affected screen or behaviour, requested change, scope, and observable outcomes from supplied material.
2. Read supplied requirement links when accessible. If unavailable, state the limitation outside the ticket and use the supplied text. Never claim verification that did not happen.
3. Preserve distinctions such as hidden versus disabled, selecting versus saving, and temporary selections versus persisted records. Keep exact UI labels, identifiers, limits, and confirmed constraints.
4. Do not invent APIs, component names, requirement IDs, test cases, loading behaviour, permissions, or implementation decisions. Include technical details only when supplied or verified and necessary to deliver the change.
5. Resolve only blocking ambiguity with a focused question. Otherwise draft supported content and identify consequential unknowns separately. Never turn an assumption or “unless product says otherwise” into a settled requirement.
6. For section-only revisions, edit only that section. Preserve user-specified wording when requested.

## Use the minimum structure

1. Read references/templates.md and start with its minimal template. Treat optional blocks as choices, never as a mandatory checklist.
2. Write a short, specific title. Preserve supplied team prefixes and identifiers. Prefer subject-led phrasing; do not force an imperative title.
3. Include supplied requirement links near the top. Add Covers only when confirmed requirement IDs are available; preserve partial coverage. Never fabricate traceability.
4. Use Context for one short paragraph explaining where the change applies, what changes, and why if needed. Put shared conditions here rather than repeating them in every AC.
5. Use Acceptance Criteria for a flat numbered list of observable, testable outcomes. Keep each item focused. Combine tightly related states only when this improves clarity. Preserve distinct edge cases and regression boundaries.
6. Add sections only when necessary. Do not add Problem, Goal, User story, Out of Scope, or Dependencies by default. For bugs, add reproduction and actual/expected behaviour only when needed and supported.

## Include supporting material only when useful

1. Keep one or two supporting links near the top without separate headings unless their purpose needs explanation. Link each document once. Do not create empty sections or leave template placeholders in a finished ticket.
2. Use Mockup for multiple screenshots, UI states, or design references that need grouping. Put it after Context. For a single screenshot, embed it near Context without an extra heading. Preserve exact supplied image references; do not invent or describe unread images as if inspected.
3. Use Tech Docs for implementation-relevant technical designs, API contracts, or confirmed technical constraints. Put it after Acceptance Criteria when a separate section is useful. Link to the source and include only the detail needed for this ticket, not a copy of the design document.
4. Use Related Docs for other directly relevant documents or related tickets that are not already listed as requirements, mockups, or technical designs. Put it last. Include a short explanation only when the relationship is unclear.
5. Do not move essential behaviour or acceptance conditions into links alone. Keep enough information in Context and AC for the ticket to be understood and tested.

## Keep the writing plain

1. Default ticket content to simple English unless the user requests another language. Match exact product terminology.
2. Use plain paragraphs and numbered lists. Allow simple unnumbered lists for Covers or an explicit user template, but never bold-label bullets followed by an explanation.
3. Do not use em-dashes, decorative dividers, emojis, or inline bold emphasis.
4. Do not use colons as prose separators or label-introduction devices. Preserve colons required by URLs, code, data formats, or exact quoted technical text.
5. Avoid tables unless row-by-row comparison is genuinely necessary. Do not use a table to explain a short list of UI options.
6. Prefer subjects and observable behaviour over repeated commands such as Ensure, Implement, Provide, and Enable. Do not mechanically ban all verb-led sentences or change an exact UI label.
7. Avoid boilerplate such as As a / I want / So that unless explicitly requested, promotional language, redundant summaries, and re-explanations of the same change in multiple sections.
8. Do not enforce a word count or maximum AC count. Keep every sentence that contributes necessary scope or behaviour.

## Check before returning

1. Confirm the reader can identify what changes, where it applies, and how to test completion.
2. Map every supplied requirement to the draft. Restore missing behaviour, including meaningful loading, empty, duplicate, and regression cases when supplied.
3. Remove repeated explanations and unnecessary formatting. Repair incomplete sentences without guessing missing requirements.
4. Keep uncertainty outside settled AC. Return the ticket without a preamble, rationale, or quality checklist unless requested or needed to disclose a material limitation.
5. Draft only. Never create or update a Shortcut record unless the user explicitly requests that external action and an authorized tool is available.
