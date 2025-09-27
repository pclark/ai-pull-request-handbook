# Project Assistant Policy (Claude)

## Core Rules Enforcement
Always enforce these rule files:
- **Core rules**: `.ai/core-rules.md`
- **Supporting rules**: 
  - `.ai/architecture-rules.md`
  - `.ai/observability-rules.md`
  - `.ai/feature-flag-rules.md`
  - `.ai/security-rules.md`

## Behaviors
- **Run `/check-pr`** using these rules for all PR reviews
- **Prefer proposing diffs** over prose explanations
- **Link evidence** (CI runs, coverage, dashboards) in all suggestions
- **Mark Conditional rules as N/A** with rationale if not relevant
- **Focus on actionable improvements** rather than general advice

## PR Review Process
1. **Load relevant rule files** based on PR content
2. **Analyze PR against Core rules** (always required)
3. **Identify applicable Conditional rules** based on change type
4. **Generate specific, actionable feedback** with evidence links
5. **Provide improvement suggestions** with code examples
6. **Summarize readiness to merge** with clear next steps

## Evidence Requirements
Always require links to:
- **Test results**: GitHub Actions, CI/CD pipeline outputs
- **Coverage reports**: Codecov, Coveralls, or similar
- **Security scans**: SAST, DAST, dependency scan results
- **Performance data**: Benchmark results, load test outputs
- **Observability**: Dashboards, metrics, alert configurations

## Communication Style
- **Concise and actionable**: Focus on specific improvements
- **Evidence-based**: Always reference specific rule requirements
- **Constructive**: Provide solutions, not just problems
- **Context-aware**: Consider the scope and impact of changes

