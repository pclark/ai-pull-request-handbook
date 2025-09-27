# Reference Tables & Evidence Links

## Evidence Links Reference Table

This table provides examples of evidence links that should be included in pull requests to validate compliance with Core and Conditional rules.

| Rule Category | Example Evidence Link | Description | Validation Purpose |
|---------------|----------------------|-------------|-------------------|
| **Unit / Integration Tests** | `https://github.com/org/repo/actions/runs/12345678` | GitHub Actions test run URL | Verify test execution and results |
| **Coverage** | `https://codecov.io/gh/org/repo/commit/abc123` | Codecov coverage report | Validate code coverage percentage |
| **Mutation Testing** | `https://ci.example.com/mutation/run-12345` | Mutation testing report | Verify mutation test coverage score |
| **Secrets Scan** | `https://github.com/org/repo/security/code-scanning` | GitHub security scanning results | Confirm no secrets in code |
| **SAST** | `https://github.com/org/repo/security/code-scanning` | Static Application Security Testing | Validate no high/critical vulnerabilities |
| **SCA/License** | `https://github.com/org/repo/security/dependabot` | Dependabot security advisories | Verify dependency security and licensing |
| **AuthN/AuthZ Tests** | `https://github.com/org/repo/blob/main/tests/auth/test_permissions.py` | Test file permalink | Validate authentication/authorization testing |
| **Performance** | `https://ci.example.com/benchmark/run-12345` | Benchmark job output | Verify performance regression testing |
| **DB/Cache Review** | `https://github.com/org/repo/pull/1234#issuecomment-123456` | PR comment with query plan | Document database query optimization |
| **Migration Plan** | `https://github.com/org/repo/blob/main/migrations/PLAN.md` | Migration documentation | Provide migration strategy and procedures |
| **Observability** | `https://grafana.example.com/d/dashboard-uid` | Grafana dashboard link | Link to monitoring dashboards and metrics |
| **Feature Flags** | `https://launchdarkly.com/org/project/features/feature-123` | Feature flag configuration | Document feature flag setup and configuration |
| **Provenance/SBOM** | `https://github.com/org/repo/releases/download/v1.0.0/artifact.sbom` | SBOM artifact download | Provide software bill of materials |
| **DAST/Smoke** | `https://security.example.com/scan/12345` | OWASP ZAP scan results | Validate external surface security testing |

## Link Validation Guidelines

### GitHub Actions Links
- **Format**: `https://github.com/{owner}/{repo}/actions/runs/{run_id}`
- **Validation**: Link should be accessible and show successful test execution
- **Example**: `https://github.com/microsoft/vscode/actions/runs/12345678`

### Coverage Report Links
- **Codecov**: `https://codecov.io/gh/{owner}/{repo}/commit/{commit_sha}`
- **Coveralls**: `https://coveralls.io/github/{owner}/{repo}`
- **SonarQube**: `https://sonarcloud.io/dashboard?id={project_key}`

### Security Scan Links
- **GitHub Security**: `https://github.com/{owner}/{repo}/security/code-scanning`
- **Snyk**: `https://app.snyk.io/org/{org}/project/{project}`
- **Veracode**: `https://analysiscenter.veracode.com/{app_id}`

### Performance Testing Links
- **GitHub Actions**: Link to performance test job
- **Jenkins**: Link to performance test build
- **Custom CI**: Link to performance test results

### Observability Links
- **Grafana**: `https://grafana.example.com/d/{dashboard_uid}`
- **Prometheus**: `https://prometheus.example.com/graph`
- **Datadog**: `https://app.datadoghq.com/dashboard/{dashboard_id}`

## Evidence Link Best Practices

### Link Accessibility
- ✅ **Public Access**: Links should be accessible to all reviewers
- ✅ **Persistent Links**: Use permanent links that won't expire
- ✅ **Specific Context**: Link to specific results, not general pages
- ❌ **Private Links**: Avoid links requiring special authentication
- ❌ **Temporary Links**: Don't use links that expire quickly

### Link Context
- ✅ **Descriptive Text**: Provide context for what the link shows
- ✅ **Status Information**: Include pass/fail status in description
- ✅ **Relevant Metrics**: Include key metrics or scores
- ❌ **Generic Links**: Avoid links without context
- ❌ **Broken Links**: Ensure all links are working and accessible

### Link Formatting
```markdown
✅ **Unit tests**: [GitHub Actions run](https://github.com/org/repo/actions/runs/12345678) - All 47 tests passed
✅ **Coverage**: [Codecov report](https://codecov.io/gh/org/repo/commit/abc123) - 87% coverage (target: 80%)
✅ **Security scan**: [SAST results](https://github.com/org/repo/security/code-scanning) - 0 high/critical issues
```

## Validation Checklist

### Link Quality Checks
- [ ] All links are accessible and working
- [ ] Links provide specific, relevant evidence
- [ ] Links include context and status information
- [ ] Links are permanent and won't expire
- [ ] Links are accessible to all reviewers

### Evidence Completeness
- [ ] All Core rules have supporting evidence links
- [ ] Conditional rules have evidence links where applicable
- [ ] Evidence links demonstrate compliance with requirements
- [ ] Links provide sufficient detail for validation

### Link Organization
- [ ] Links are grouped by rule category
- [ ] Links are formatted consistently
- [ ] Links include descriptive text
- [ ] Links are easy to find and verify

## Common Link Patterns

### GitHub Actions
```markdown
[GitHub Actions run](https://github.com/{owner}/{repo}/actions/runs/{run_id})
[Workflow file](https://github.com/{owner}/{repo}/blob/main/.github/workflows/{workflow}.yml)
```

### Security Scans
```markdown
[SAST scan](https://github.com/{owner}/{repo}/security/code-scanning)
[Dependabot alerts](https://github.com/{owner}/{repo}/security/dependabot)
[Secret scanning](https://github.com/{owner}/{repo}/security/secret-scanning)
```

### Testing & Coverage
```markdown
[Unit tests](https://github.com/{owner}/{repo}/actions/runs/{run_id})
[Integration tests](https://github.com/{owner}/{repo}/actions/runs/{run_id})
[Coverage report](https://codecov.io/gh/{owner}/{repo}/commit/{commit_sha})
```

### Observability
```markdown
[Dashboard](https://grafana.example.com/d/{dashboard_uid})
[Metrics](https://prometheus.example.com/graph?g0.expr={query})
[Alerts](https://grafana.example.com/alerting/list)
```

### Documentation
```markdown
[API docs](https://docs.example.com/api/v1.0)
[User guide](https://docs.example.com/user-guide)
[Migration guide](https://docs.example.com/migration/v2.0)
```

## Link Validation Tools

### Automated Link Checking
- **GitHub Actions**: Use link checking workflows
- **Markdown Linters**: Include link validation in CI/CD
- **Custom Scripts**: Build custom link validation tools

### Manual Link Validation
- **Accessibility**: Test all links for accessibility
- **Context**: Verify links provide relevant evidence
- **Permanence**: Ensure links won't expire or break
- **Security**: Verify links don't expose sensitive information

## Troubleshooting Common Issues

### Broken Links
- **Issue**: Links return 404 or access denied
- **Solution**: Update links to working URLs, check permissions
- **Prevention**: Use permanent links, test accessibility

### Missing Context
- **Issue**: Links don't clearly show what they validate
- **Solution**: Add descriptive text explaining the evidence
- **Prevention**: Include context in link descriptions

### Expired Links
- **Issue**: Links work initially but expire later
- **Solution**: Use permanent links, archive important results
- **Prevention**: Choose link sources that maintain permanent URLs

### Access Issues
- **Issue**: Links require special authentication
- **Solution**: Use public links or provide access instructions
- **Prevention**: Ensure all evidence is publicly accessible

---

## Next Steps

- **[User Guides](user-guides.md)** - Learn how to use evidence links effectively
- **[Automation](automation.md)** - Set up automated link validation
- **[Templates](templates/)** - Use templates with proper link formatting
- **[Examples](examples/)** - See evidence links in action

---

**Need help with evidence links?** Check out our [User Guides](user-guides.md) for detailed examples and best practices! 📊

