#!/bin/bash
# Risk Advisory Council Installer for Claude Code
# https://github.com/HakAl/risk_advisory
#
# Usage:
#   curl -sL https://raw.githubusercontent.com/HakAl/risk_advisory/master/install.sh | bash
#
# Or download and run:
#   chmod +x install.sh && ./install.sh

set -e

REPO="https://github.com/HakAl/risk_advisory.git"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
TEMP_DIR=$(mktemp -d)
SCRIPT_VERSION="1.0.0"

# Skills to install (directories containing SKILL.md)
SKILLS="council coordinator adversary domain-expert risk-officer recorder"

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

# Check for git
if ! command -v git &> /dev/null; then
  echo -e "${RED}Error: git is required but not installed.${NC}"
  exit 1
fi

# Create skills directory if needed
if [ ! -d "$SKILLS_DIR" ]; then
  echo -e "Creating skills directory: ${YELLOW}$SKILLS_DIR${NC}"
  mkdir -p "$SKILLS_DIR"
fi

# Clone repo to temp directory
echo "Fetching latest from GitHub..."
if ! git clone --depth 1 --quiet "$REPO" "$TEMP_DIR/risk_advisory" 2>/dev/null; then
  echo -e "${RED}Error: Failed to clone repository.${NC}"
  rm -rf "$TEMP_DIR"
  exit 1
fi

echo ""
echo "Installing council skills:"

# Copy each skill
installed=0
updated=0
for skill in $SKILLS; do
  if [ -d "$TEMP_DIR/risk_advisory/$skill" ]; then
    if [ -d "$SKILLS_DIR/$skill" ]; then
      # Update existing
      rm -rf "$SKILLS_DIR/$skill"
      cp -r "$TEMP_DIR/risk_advisory/$skill" "$SKILLS_DIR/"
      echo -e "  ${GREEN}↻${NC} $skill (updated)"
      updated=$((updated + 1))
    else
      # Fresh install
      cp -r "$TEMP_DIR/risk_advisory/$skill" "$SKILLS_DIR/"
      echo -e "  ${GREEN}✓${NC} $skill"
      installed=$((installed + 1))
    fi
  fi
done

# Copy COUNCIL.md only if it doesn't exist (preserve user's protocols)
if [ ! -f "$SKILLS_DIR/COUNCIL.md" ]; then
  cp "$TEMP_DIR/risk_advisory/COUNCIL.md" "$SKILLS_DIR/"
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

# Cleanup
rm -rf "$TEMP_DIR"

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
