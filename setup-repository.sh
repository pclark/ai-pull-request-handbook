#!/bin/bash

# AI-Enhanced Pull Request Handbook - Repository Setup Script
# This script helps you set up the GitHub repository

set -e

echo "🚀 Setting up AI-Enhanced Pull Request Handbook Repository"
echo "=========================================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Initialize git repository
echo "📁 Initializing git repository..."
git init

# Add all files
echo "📝 Adding files to repository..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: AI-Enhanced Pull Request Handbook

- Complete handbook transformation from Word to GitHub markdown
- Copy-paste ready templates for PR and release management
- GitHub Actions workflows for automated validation
- Claude AI integration for intelligent PR checking
- Comprehensive documentation and user guides
- Production-ready automation and quality assurance"

# Set main branch
echo "🌿 Setting main branch..."
git branch -M main

echo ""
echo "✅ Repository initialized successfully!"
echo ""
echo "📋 Next Steps:"
echo "1. Create a new repository on GitHub.com:"
echo "   - Go to https://github.com/new"
echo "   - Name: ai-pull-request-handbook"
echo "   - Description: AI-Enhanced Pull Request Handbook - GitHub-native guide for PR automation"
echo "   - Visibility: Public (recommended) or Private"
echo "   - Don't initialize with README (we already have one)"
echo ""
echo "2. Connect your local repository to GitHub:"
echo "   git remote add origin https://github.com/YOUR-USERNAME/ai-pull-request-handbook.git"
echo "   git push -u origin main"
echo ""
echo "3. Follow the Implementation Guide:"
echo "   - Read IMPLEMENTATION-GUIDE.md for detailed setup instructions"
echo "   - Copy templates to your project repositories"
echo "   - Set up AI integration (Claude/Copilot)"
echo "   - Train your team on the new workflow"
echo ""
echo "🎉 Your AI-Enhanced Pull Request Handbook is ready for deployment!"
