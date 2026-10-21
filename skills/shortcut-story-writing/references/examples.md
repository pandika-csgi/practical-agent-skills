# Writing examples

All scenarios, labels, and behaviours below are fictional and created for illustration. They are not copied from a company ticket or product specification. Do not treat them as requirements for another story.

## Concise feature story

Input

Users need to download search results as a CSV. The download must use the active filters, include all matching pages, and retain the displayed column order. If there are no results, the download button is disabled.

Preferred output

```markdown
# CSV download for filtered search results

## Context

Users can download the current search results as a CSV. The file uses the active filters and includes all matching records, not just the current page.

## Acceptance Criteria

1. Download CSV creates a file containing all records matching the active filters across all pages.
2. Columns in the file follow the displayed column order.
3. Download CSV is disabled when there are no matching records.
```

Context explains the change. AC identifies testable outcomes. No separate Problem, Goal, or User story is needed.

## Removing repetition without losing behaviour

Input

The report export dialog offers CSV and PDF. The current export service only supports CSV. PDF should be hidden, CSV should remain selectable, the file should download when confirmed, loading should reflect the CSV request only, and Cancel should close the dialog without starting an export. This change applies only to report exports; invoice exports stay unchanged.

Overwritten structure to avoid

```markdown
## Problem

The report export dialog offers CSV and PDF, but the export service only supports CSV. Users can see an unsupported option.

## Goal

The report export dialog should only offer CSV. PDF should be hidden because the service only supports CSV.

## User story

As a report user, I want only CSV export so that I do not choose PDF, which the service does not support.
```

Preferred output

```markdown
# CSV-only report export

## Context

The report export dialog should only offer CSV because the export service does not support PDF. This change applies to reports only. Invoice exports keep their existing behaviour.

## Acceptance Criteria

1. PDF is hidden from the report export dialog.
2. CSV remains selectable, and confirming the export downloads the file.
3. The loading state reflects only the CSV export request.
4. Cancel closes the dialog without starting an export.
5. Invoice exports retain their existing behaviour.
```

Keep all supplied outcomes, including loading, cancellation, and unchanged invoice exports. Remove repeated explanation, not scope. These examples do not require adding links, screenshots, or supporting sections when none were supplied.
