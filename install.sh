#!/bin/bash
# Risk Advisory Council Installer for Claude Code
# https://github.com/HakAl/risk_advisory
#
# Usage:
#   curl -sL https://raw.githubusercontent.com/HakAl/risk_advisory/master/install.sh | bash
#
# Or from local clone:
#   ./install.sh --local
#
# Options:
#   --local    Install from current directory instead of cloning from GitHub

set -e

REPO="https://github.com/HakAl/risk_advisory.git"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
SCRIPT_VERSION="1.0.1"
LOCAL_INSTALL=false
SOURCE_DIR=""

# Skills to install (directories containing SKILL.md)
SKILLS="council coordinator profiler adversary domain-expert risk-officer recorder"

# Parse arguments
for arg in "$@"; do
  case $arg in
    --local)
      LOCAL_INSTALL=true
      shift
      ;;
  esac
done

# Colors (if terminal supports them)
if [ -t 1 ]; then
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  BLUE='\033[0;34m'
  NC='\033[0m' # No Color
else
  RED=''
  GREEN=''
  YELLOW=''
  BLUE=''
  NC=''
fi

echo ""
echo -e "${BLUE}Risk Advisory Council Installer v${SCRIPT_VERSION}${NC}"
echo "============================================="
echo ""

# Determine source directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Auto-detect local install if running from repo directory
if [ -f "$SCRIPT_DIR/COUNCIL.md" ] && [ -d "$SCRIPT_DIR/council" ]; then
  LOCAL_INSTALL=true
  echo -e "Detected local repository at ${YELLOW}$SCRIPT_DIR${NC}"
fi

# Create skills directory if needed
if [ ! -d "$SKILLS_DIR" ]; then
  echo -e "Creating skills directory: ${YELLOW}$SKILLS_DIR${NC}"
  mkdir -p "$SKILLS_DIR"
fi

if [ "$LOCAL_INSTALL" = true ]; then
  # Use local directory
  SOURCE_DIR="$SCRIPT_DIR"
  echo -e "Installing from local directory..."
else
  # Clone repo to temp directory
  TEMP_DIR=$(mktemp -d)
  SOURCE_DIR="$TEMP_DIR/risk_advisory"

  # Check for git
  if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is required but not installed.${NC}"
    exit 1
  fi

  echo "Fetching latest from GitHub..."
  if ! git clone --depth 1 --quiet "$REPO" "$SOURCE_DIR" 2>/dev/null; then
    echo -e "${RED}Error: Failed to clone repository.${NC}"
    echo -e "${YELLOW}Tip: Use --local flag to install from a local clone.${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
  fi
fi

echo ""
echo "Installing council skills:"

# Copy each skill
installed=0
updated=0
for skill in $SKILLS; do
  if [ -d "$SOURCE_DIR/$skill" ]; then
    if [ -d "$SKILLS_DIR/$skill" ]; then
      # Update existing
      rm -rf "$SKILLS_DIR/$skill"
      cp -r "$SOURCE_DIR/$skill" "$SKILLS_DIR/"
      echo -e "  ${GREEN}↻${NC} $skill (updated)"
      updated=$((updated + 1))
    else
      # Fresh install
      cp -r "$SOURCE_DIR/$skill" "$SKILLS_DIR/"
      echo -e "  ${GREEN}✓${NC} $skill"
      installed=$((installed + 1))
    fi
  else
    echo -e "  ${RED}✗${NC} $skill (not found in source)"
  fi
done

# Copy COUNCIL.md only if it doesn't exist (preserve user's protocols)
if [ ! -f "$SKILLS_DIR/COUNCIL.md" ]; then
  cp "$SOURCE_DIR/COUNCIL.md" "$SKILLS_DIR/"
  echo -e "  ${GREEN}✓${NC} COUNCIL.md"
else
  echo -e "  ${YELLOW}·${NC} COUNCIL.md (kept existing)"
fi

# Copy .council directory only if it doesn't exist (preserve user's assessments)
if [ ! -d "$SKILLS_DIR/.council" ]; then
  mkdir -p "$SKILLS_DIR/.council"
  mkdir -p "$SKILLS_DIR/.council/assessments"
  echo -e "  ${GREEN}✓${NC} .council/"
else
  echo -e "  ${YELLOW}·${NC} .council/ (kept existing)"
fi

# Cleanup temp directory (only if we cloned from remote)
if [ "$LOCAL_INSTALL" = false ] && [ -n "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi

echo ""
echo -e "${GREEN}Done!${NC} Council installed to $SKILLS_DIR"
echo ""

if [ $installed -gt 0 ] && [ $updated -eq 0 ]; then
  # Fresh install
  echo "Next steps:"
  echo "  1. Open Claude Code"
  echo "  2. Run: /council genesis"
  echo ""
  echo "Then try:"
  echo "  /council \"your situation here\""
  echo ""
  echo "Example:"
  echo "  /council I'm touring Barcelona and want to park near La Rambla"
elif [ $updated -gt 0 ]; then
  # Update
  echo "Council updated. Your COUNCIL.md and .council/ were preserved."
  echo ""
  echo "To see what's new, check:"
  echo "  https://github.com/HakAl/risk_advisory/releases"
fi

echo ""
echo "Documentation: https://github.com/HakAl/risk_advisory"
echo "Original framework: https://github.com/HakAl/team_skills"
echo "Issues: https://github.com/HakAl/risk_advisory/issues"
echo ""
