#!/bin/bash
# Qwen Code Status Line Script
# Shows model name, total tokens, cache statistics, current directory and git branch

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
model=$(echo "$input" | jq -r '.model.display_name')
total=$(echo "$input" | jq -r '.metrics.models["qwen3.5-plus"].tokens.total // 0')
cached=$(echo "$input" | jq -r '.metrics.models["qwen3.5-plus"].tokens.cached // 0')
dir=$(echo "$input" | jq -r '.workspace.current_dir')
branch=$(echo "$input" | jq -r '.git.branch // empty')

# Format token count with K/M suffix
format_tokens() {
    local num=$1
    if [ "$num" -ge 1000000 ]; then
        awk "BEGIN {printf \"%.1fM\", $num/1000000}"
    elif [ "$num" -ge 1000 ]; then
        awk "BEGIN {printf \"%.1fK\", $num/1000}"
    else
        echo "$num"
    fi
}

# Get basename of current directory
dir_name=$(basename "$dir")

# Check for uncommitted changes in git
git_status=""
if [ -n "$branch" ]; then
    # Check if there are uncommitted changes
    changes=$(git -C "$dir" status --porcelain 2>/dev/null | head -1)
    if [ -n "$changes" ]; then
        git_status=" ($branch*)"
    else
        git_status=" ($branch)"
    fi
fi

# Format token count with K/M suffix
format_tokens() {
    local num=$1
    if [ "$num" -ge 1000000 ]; then
        awk "BEGIN {printf \"%.1fM\", $num/1000000}"
    elif [ "$num" -ge 1000 ]; then
        awk "BEGIN {printf \"%.1fK\", $num/1000}"
    else
        echo "$num"
    fi
}

# Format and display
total_fmt=$(format_tokens "$total")

if [ "$cached" != "0" ] && [ "$total" != "0" ]; then
    cache_pct=$((cached * 100 / total))
    cached_fmt=$(format_tokens "$cached")
    echo "$model | $dir_name$git_status | Total: $total_fmt | Cached: $cached_fmt ($cache_pct%)"
else
    echo "$model | $dir_name$git_status | Total: $total_fmt"
fi
