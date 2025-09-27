# Automation & Tools

## GitHub Actions Integration

### PR Rules Check Workflow

The core GitHub Action that validates pull requests against the handbook's Core rules.

#### Workflow File: `.github/workflows/pr-rules-check.yml`

```yaml
name: PR Rules Check

on:
  pull_request:
    types: [opened, edited, synchronize]

jobs:
  validate-pr-template:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
    steps:
      - name: Check PR body against Core Rules
        uses: actions/github-script@v7
        with:
          script: |
            const prBody = context.payload.pull_request.body || "";
            const requiredSections = [
              "### Outcome (Core)",
              "### Risk & Rollback (Core)",
              "### AI Assistance (Core)",
              "Unit tests (Core)",
              "Integration/Contract tests (Core)",
              "Changed-lines coverage (Core)",
              "Secrets scan (Core)",
              "SAST (Core)",
              "SCA/License (Core)",
              "Backward/forward compatibility (Core)",
              "New metrics/traces/logs (Core)",
              "Provenance/SBOM (Core)",
              "### Approvals (Core)"
            ];
            let missing = requiredSections.filter(s => !prBody.includes(s));
            if (missing.length) {
              core.setFailed(`Missing sections: ${missing.join(", ")}`);
            }

  validate-markdown:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Markdown Lint
        uses: DavidAnson/markdownlint-action@v2
        with:
          files: 'docs/ templates/ examples/'
          config: '.markdownlint.yaml'
          
      - name: Check for broken links
        uses: gaurav-nelson/github-action-markdown-link-check@v1
        with:
          use-quiet-mode: 'yes'
          use-verbose-mode: 'yes'
          folder-path: 'docs/ templates/ examples/'

  validate-templates:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Validate PR template
        run: |
          if [ -f "templates/pull-request-template.md" ]; then
            echo "✅ PR template exists"
            grep -q "### Outcome (Core)" templates/pull-request-template.md || (echo "❌ Missing Outcome section" && exit 1)
            grep -q "### Risk & Rollback (Core)" templates/pull-request-template.md || (echo "❌ Missing Risk & Rollback section" && exit 1)
            grep -q "### AI Assistance (Core)" templates/pull-request-template.md || (echo "❌ Missing AI Assistance section" && exit 1)
            echo "✅ PR template validation passed"
          else
            echo "❌ PR template missing"
            exit 1
          fi
          
      - name: Validate release manifest template
        run: |
          if [ -f "templates/release-manifest-template.md" ]; then
            echo "✅ Release manifest template exists"
            grep -q "## Release Overview" templates/release-manifest-template.md || (echo "❌ Missing Release Overview section" && exit 1)
            grep -q "## Scope of Included Work" templates/release-manifest-template.md || (echo "❌ Missing Scope section" && exit 1)
            echo "✅ Release manifest template validation passed"
          else
            echo "❌ Release manifest template missing"
            exit 1
          fi

  check-file-structure:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Validate repository structure
        run: |
          echo "Checking repository structure..."
          
          # Check required directories
          [ -d "docs" ] || (echo "❌ docs/ directory missing" && exit 1)
          [ -d "templates" ] || (echo "❌ templates/ directory missing" && exit 1)
          [ -d "examples" ] || (echo "❌ examples/ directory missing" && exit 1)
          [ -d ".github/workflows" ] || (echo "❌ .github/workflows/ directory missing" && exit 1)
          
          # Check required files
          [ -f "README.md" ] || (echo "❌ README.md missing" && exit 1)
          [ -f "CONTRIBUTING.md" ] || (echo "❌ CONTRIBUTING.md missing" && exit 1)
          [ -f "LICENSE" ] || (echo "❌ LICENSE missing" && exit 1)
          
          echo "✅ Repository structure validation passed"
```

### Advanced PR Validation Workflow

Enhanced workflow with additional validation capabilities.

```yaml
name: Advanced PR Validation

on:
  pull_request:
    types: [opened, edited, synchronize]

jobs:
  comprehensive-validation:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Validate PR Content
        uses: actions/github-script@v7
        with:
          script: |
            const prBody = context.payload.pull_request.body || "";
            
            // Check for evidence links
            const linkPatterns = [
              /https?:\/\/.*\.com\/.*\/actions\/runs\/\d+/g, // GitHub Actions
              /https?:\/\/.*\.com\/.*\/pull\/\d+/g, // GitHub PRs
              /https?:\/\/.*\.com\/.*\/issues\/\d+/g, // GitHub Issues
              /https?:\/\/.*\.com\/.*\/security\/.*/g, // Security scans
              /https?:\/\/.*\.com\/.*\/coverage.*/g, // Coverage reports
            ];
            
            const foundLinks = linkPatterns.some(pattern => pattern.test(prBody));
            if (!foundLinks) {
              console.log("⚠️ No evidence links found in PR description");
            }
            
            // Check for placeholder text
            const placeholders = prBody.match(/\[link\]|\[description\]|TODO|FIXME/g);
            if (placeholders && placeholders.length > 0) {
              console.log(`⚠️ Found ${placeholders.length} placeholder(s) that should be replaced`);
            }
            
            // Check for risk assessment
            const riskLevels = ['Low', 'Medium', 'High'];
            const hasRiskLevel = riskLevels.some(level => prBody.includes(level));
            if (!hasRiskLevel) {
              console.log("⚠️ Risk level not specified");
            }

      - name: Security Scan Validation
        run: |
          echo "Validating security scan requirements..."
          # Add your security scan validation logic here
          
      - name: Performance Test Validation
        run: |
          echo "Validating performance test requirements..."
          # Add your performance test validation logic here
```

---

## Claude AI Integration

### Claude Configuration

#### Main Configuration File: `.claude/CLAUDE.md`

```markdown
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
```

#### PR Check Command: `.claude/commands/check-pr.md`

```markdown
# PR Rules Check Command

Use `.ai/core-rules.md` + supporting rules to review the PR.

## Review Process

### 1. Load Rules
- Load `.ai/core-rules.md` (always applicable)
- Load supporting rules based on PR content:
  - `.ai/architecture-rules.md` (for API/architecture changes)
  - `.ai/observability-rules.md` (for features with monitoring needs)
  - `.ai/security-rules.md` (for security-sensitive changes)
  - `.ai/feature-flag-rules.md` (for feature flag usage)

### 2. Core Rules Validation
Pass/fail each Core rule with evidence links:

#### ✅ Outcome (Core)
- [ ] Problem clearly described
- [ ] Business outcome specified
- [ ] Link to originating ticket/issue provided

#### ✅ Risk & Rollback (Core)
- [ ] Risk level assessed (Low/Medium/High)
- [ ] Rollback strategy documented
- [ ] Risk mitigation plans included

#### ✅ AI Assistance (Core)
- [ ] AI tool usage disclosed
- [ ] External code sourcing documented
- [ ] License compliance verified
- [ ] Security pattern review completed

#### ✅ Tests (Core)
- [ ] Unit tests provided with link
- [ ] Integration tests provided with link
- [ ] Coverage percentage specified with link
- [ ] Test results accessible

#### ✅ Security (Core)
- [ ] Secrets scan completed with link
- [ ] SAST scan completed with link
- [ ] SCA/License scan completed with link
- [ ] No high/critical vulnerabilities

#### ✅ Observability (Core)
- [ ] New metrics/traces/logs documented
- [ ] Observability changes linked
- [ ] Dashboard updates specified

#### ✅ Provenance/SBOM (Core)
- [ ] Build artifacts signed
- [ ] SBOM generated and linked
- [ ] Supply chain security validated

#### ✅ Approvals (Core)
- [ ] Required reviewers specified
- [ ] High-risk changes have security/arch review

### 3. Conditional Rules Assessment
Mark Conditional rules as N/A with rationale if not relevant:

#### 🔍 Mutation Testing (Conditional)
- **Applies to**: Critical business logic changes
- **Required if**: Core business logic modified
- **N/A if**: UI-only changes, documentation updates

#### 🔍 AuthN/AuthZ Tests (Conditional)
- **Applies to**: Authentication/authorization changes
- **Required if**: Security boundaries modified
- **N/A if**: Non-security related changes

#### 🔍 Performance Benchmarks (Conditional)
- **Applies to**: Performance-critical code paths
- **Required if**: Hot paths modified
- **N/A if**: Configuration or documentation changes

#### 🔍 DB/Cache Review (Conditional)
- **Applies to**: Database or cache modifications
- **Required if**: Data layer changes
- **N/A if**: Frontend-only changes

#### 🔍 Migration Plan (Conditional)
- **Applies to**: Database schema changes
- **Required if**: Data structure modifications
- **N/A if**: No data changes

#### 🔍 Dashboards/Alerts (Conditional)
- **Applies to**: Features requiring monitoring
- **Required if**: New functionality added
- **N/A if**: Bug fixes without new features

#### 🔍 Feature Flags (Conditional)
- **Applies to**: New features or risky changes
- **Required if**: Gradual rollout needed
- **N/A if**: Low-risk bug fixes

#### 🔍 DAST/Smoke Tests (Conditional)
- **Applies to**: External-facing changes
- **Required if**: API or UI changes
- **N/A if**: Internal-only changes

### 4. Generate Feedback
For each missing or incomplete item:
- **Identify the gap** with specific rule reference
- **Suggest concrete improvements** with examples
- **Provide evidence link requirements**
- **Offer implementation guidance**

### 5. Summarize Readiness
Provide clear assessment:
- **Ready to merge**: All Core rules satisfied, Conditional rules appropriately handled
- **Needs work**: Specific items that must be addressed
- **Next steps**: Prioritized list of improvements needed

## Example Output Format

```markdown
## 🔍 PR Rules Check Report

### Core Rules Status
- ✅ **Outcome**: Clear problem description and business outcome
- ⚠️ **Tests**: Unit tests provided but integration test link missing
- ❌ **Security**: SAST scan results not linked
- ✅ **Observability**: Metrics properly documented

### Conditional Rules Assessment
- 🔍 **Performance**: N/A (UI-only changes)
- 🔍 **Migration Plan**: N/A (no database changes)
- ⚠️ **Feature Flags**: Consider adding for gradual rollout

### Required Actions
1. Add integration test link: [GitHub Actions run URL]
2. Provide SAST scan results: [Security scan link]
3. Consider feature flag for safe deployment

### Ready to Merge: ❌ (2 Core rule violations)
```

## Usage Instructions

1. **Copy command files** to your repository's `.claude/` directory
2. **Customize rules** in `.ai/` directory for your organization
3. **Run `/check-pr`** in Claude interface for PR reviews
4. **Iterate on rules** based on team feedback and usage
```

---

## Rule File Setup

### Core Rules File: `.ai/core-rules.md`

```markdown
# Core Rules - AI-Enhanced Pull Request Handbook

## Universal Requirements

### Outcome (Core)
Every PR must clearly describe:
- **Problem**: What problem is being solved?
- **Outcome**: What business outcome is expected?
- **Link**: Reference to originating ticket/issue

### Risk & Rollback (Core)
Every PR must include:
- **Risk Level**: Low, Medium, or High assessment
- **Rollback Strategy**: Specific rollback procedures
- **Mitigation**: Risk mitigation plans

### AI Assistance (Core)
Every PR must disclose:
- **AI Usage**: Which AI tools were used (Copilot, Claude, etc.)
- **External Code**: Any external code copied and licensing
- **Security Review**: Confirmation of security pattern review

### Tests (Core)
Every PR must provide:
- **Unit Tests**: Link to unit test results
- **Integration Tests**: Link to integration test results
- **Coverage**: Percentage with link to coverage report
- **Results**: Accessible test execution results

### Security (Core)
Every PR must include:
- **Secrets Scan**: No secrets in code, scan results linked
- **SAST**: Static analysis results with no high/critical issues
- **SCA**: Dependency scan results with no high/critical issues
- **Licenses**: License compliance verification

### Observability (Core)
Every PR must document:
- **Metrics**: New metrics defined and implemented
- **Traces**: Tracing spans added for new functionality
- **Logs**: Logging improvements and structured logging
- **Dashboards**: Links to updated monitoring dashboards

### Provenance/SBOM (Core)
Every PR must ensure:
- **Signed Artifacts**: Build artifacts are signed and verified
- **SBOM**: Software Bill of Materials generated and attached
- **Supply Chain**: Supply chain security validation completed

### Approvals (Core)
Every PR must have:
- **Reviewers**: Minimum required reviewers approved
- **Security Review**: High-risk changes reviewed by security team
- **Architecture Review**: Architecture changes reviewed by architecture team

## Validation Criteria

### Evidence Links Required
- **Tests**: GitHub Actions, CI/CD pipeline URLs
- **Security**: Security scan result URLs
- **Coverage**: Coverage report URLs
- **Performance**: Benchmark result URLs
- **Observability**: Dashboard and metric URLs

### Quality Thresholds
- **Coverage**: Minimum 80% for changed lines
- **Security**: Zero high or critical vulnerabilities
- **Performance**: No regression > 5% from baseline
- **Tests**: All tests passing in CI/CD pipeline

### Compliance Requirements
- **Licensing**: All dependencies properly licensed
- **SBOM**: Complete software bill of materials
- **Signing**: All artifacts cryptographically signed
- **Audit**: Complete audit trail for all changes
```

### Supporting Rules Examples

#### Architecture Rules: `.ai/architecture-rules.md`

```markdown
# Architecture Rules - Supporting Rules

## When Applied
- New API endpoints or modifications
- Database schema changes
- Service architecture modifications
- Integration pattern changes

## Requirements

### API Design
- **Versioning**: Proper API versioning maintained
- **Documentation**: API documentation updated
- **Compatibility**: Backward/forward compatibility considered
- **Performance**: API performance impact assessed

### Database Design
- **Schema**: Database schema properly designed
- **Indexes**: Appropriate indexes added
- **Constraints**: Data integrity constraints defined
- **Migration**: Safe migration procedures documented

### Service Architecture
- **Boundaries**: Service boundaries clearly defined
- **Dependencies**: Service dependencies documented
- **Communication**: Inter-service communication patterns
- **Scaling**: Scalability considerations addressed

### Integration Patterns
- **Patterns**: Standard integration patterns used
- **Error Handling**: Proper error handling and retry logic
- **Monitoring**: Integration monitoring and alerting
- **Testing**: Integration testing strategies

## Evidence Required
- **ADR**: Architecture Decision Record (if applicable)
- **Design Doc**: Design documentation updated
- **Performance**: Performance impact analysis
- **Testing**: Architecture-level testing results
```

#### Observability Rules: `.ai/observability-rules.md`

```markdown
# Observability Rules - Supporting Rules

## When Applied
- New features or endpoints
- Performance-critical changes
- Error handling modifications
- Business logic changes

## Requirements

### Metrics
- **Business Metrics**: Key business indicators tracked
- **Technical Metrics**: Performance and reliability metrics
- **Custom Metrics**: Feature-specific metrics defined
- **Thresholds**: Alert thresholds configured

### Tracing
- **Distributed Tracing**: End-to-end request tracing
- **Span Coverage**: All critical paths traced
- **Trace Context**: Proper trace context propagation
- **Sampling**: Appropriate trace sampling strategy

### Logging
- **Structured Logging**: JSON-structured log format
- **Log Levels**: Appropriate log level usage
- **Context**: Sufficient context in log messages
- **Retention**: Log retention policies defined

### Dashboards
- **Operational Dashboards**: System health dashboards
- **Business Dashboards**: Business metric dashboards
- **Alert Dashboards**: Alert status dashboards
- **Custom Dashboards**: Feature-specific dashboards

## Evidence Required
- **Dashboard Links**: Grafana or similar dashboard URLs
- **Metric Definitions**: Prometheus or similar metric definitions
- **Alert Rules**: Alert configuration and thresholds
- **Log Examples**: Sample log entries and structure
```

---

## Setup Instructions

### 1. Repository Setup

```bash
# Create rule directories
mkdir -p .ai .claude/commands

# Copy rule files
cp docs/rules/core-rules.md .ai/
cp docs/rules/architecture-rules.md .ai/
cp docs/rules/observability-rules.md .ai/

# Copy Claude configuration
cp templates/claude-config/CLAUDE.md .claude/
cp templates/claude-config/commands/check-pr.md .claude/commands/
```

### 2. GitHub Actions Setup

```bash
# Copy workflow files
cp .github/workflows/pr-rules-check.yml .github/workflows/

# Enable GitHub Actions in repository settings
# Go to Settings > Actions > General
# Enable "Allow all actions and reusable workflows"
```

### 3. Claude Integration Setup

```bash
# Install Claude in your development environment
# Follow Claude installation instructions for your platform

# Configure Claude with your repository
# Point Claude to your .claude/ directory
```

### 4. Customization

1. **Review and customize rule files** in `.ai/` directory
2. **Update Claude configuration** in `.claude/CLAUDE.md`
3. **Modify GitHub Actions** workflows as needed
4. **Test the integration** with sample PRs

---

## Next Steps

- **[User Guides](user-guides.md)** - Learn how to use the automation tools
- **[Examples](examples/)** - See automation in action
- **[Templates](templates/)** - Copy-paste ready templates
- **[References](references.md)** - Evidence links and validation references

---

**Ready to automate your PR process?** Start with our [User Guides](user-guides.md) 🚀

