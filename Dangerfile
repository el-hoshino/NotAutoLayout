# Check Result type definition
class CheckResult

    attr_accessor :warnings, :errors, :title, :message

    def initialize(title)
        @warnings = 0
        @errors = 0
        @title = "## " + title
        @message = markdown_message_template
    end

    def markdown_message_template
        template = "Item | Result\n"
        template << "|--- | --- |\n"
        return template
    end

end

# Check for modifications of bootstrap.sh
def bootstrap_sh_has_been_modified
    
    modified = git.modified_files.include?("bootstrap.sh")
    return modified
    
end

# Check for modifications of Brewfile
def brewfile_has_been_modified
    
    modified = git.modified_files.include?("Brewfile")
    return modified
    
end

# Check for modifications of Info.plist
def info_plist_has_been_modified

    modified = git.modified_files.include?("NotAutoLayout/Info.plist")
    return modified

end

# Check for modifications of CHANGELOG.md
def changelog_has_been_modified

    modified = git.modified_files.include?("CHANGELOG.md")
    return modified

end

# Find issue on GitHub
def find_github_issue

    issue = github.branch_for_head.match(/(issue\/\d+)/)
    if issue
        return issue[1]
    end

end

# Checking result from Xcode_summary
def common_xcode_summary_check

    xcode_summary.inline_mode = true
    xcode_summary.report 'xcodebuild.json'

end

# Checking result from SwiftLint
def common_swiftlint_check

    swiftlint.config_file = '.swiftlint.yml'
    swiftlint.lint_files inline_mode: true

end

# Release modification check
def release_modification_check_into_result(result)

    ## Version should be updated in Release
    result.message << "Info.plist modification check |"
    has_info_plist_modification = info_plist_has_been_modified

    if has_info_plist_modification
        result.message += ":heavy_exclamation_mark:\n"
        warn "This PR contains release modification. Please remember to check if the version in Info.plist has been updated."
    else
        fail "This PR contains release modification but Info.Plist file has no modification. Please update the version in the file."
        result.message += ":x:\n"
        result.errors += 1
    end

    ## Changelog should be updated in Release
    result.message << "CHANGELOG.md modification check |"
    has_changelog_modification = changelog_has_been_modified

    if has_changelog_modification
        result.message += ":heavy_exclamation_mark:\n"
        warn "This PR contains release modification. Please remember to check if CHANGELOG.md has been updated."
    else
        fail "This PR contains release modification but CHANGELOG.md file has no modification. Please update the change log file."
        result.message += ":x:\n"
        result.errors += 1
    end

    return result

end

def is_develop_pr

    ## If a PR's base branch is `develop`, treat it as a Develop PR
    is_to_develop = github.branch_for_base == "develop"
    if is_to_develop
        return true
    else
        return false
    end

end

def is_release_pr

    ## If a PR's base branch is `master`, treat it as a Release PR
    is_to_master = github.branch_for_base == "master"
    if is_to_master
        return true
    else
        return false
    end

end

# Review routine for Develop PR
def develop_pr_check

    result = CheckResult.new("Develop PR Check Result")

    ## PR should be sent from a branch that begins with `feature/`, `refactor/`, `fix/`, `issue/` or `version/`
    result.message << "Head Branch check |"
    is_from_feature = github.branch_for_head.start_with?("feature/")
    is_from_refactor = github.branch_for_head.start_with?("refactor/")
    is_from_fix = github.branch_for_head.start_with?("fix/")
    is_from_issue = github.branch_for_head.start_with?("issue/")
    is_from_version = github.branch_for_head.start_with?("version/")
    if is_from_feature || is_from_refactor || is_from_fix || is_from_issue || is_from_version
        result.message << ":o:\n"
    else
        fail "Please send the PR from a from a branch that begins with `feature/`, `refactor/`, `fix/`, `issue/` or `version/`."
        result.message << ":x:\n"
        result.errors += 1
    end

    ## PR should be sent to `develop` branch
    result.message << "Base Branch check |"
    is_to_develop = github.branch_for_base == "develop"
    if is_to_develop
        result.message << ":o:\n"
    else
        fail "Please send the PR to `develop` branch."
        result.message << ":x:\n"
        result.errors += 1
    end

    ## If PR is sent from a branch that begins with `version/`, do a release modification check
    if is_from_version
        release_modification_check_into_result(result)
    end

    ## PR shouldn't contain any merge commits
    result.message << "Merge Commits check |"
    contains_merge_commits = git.commits.any? { |c| c.parents.length > 1 }
    unless contains_merge_commits
        result.message << ":o:\n"
    else
        fail "Please don't contain any merge commits in the branch. Consider Rebase if required."
        result.message << ":x:\n"
        result.errors += 1
    end

    ## PR should have less than 1000 lines of modifications if possible.
    result.message << "Modification Volumn check |"
    is_fix_too_big = git.lines_of_code > 1_000
    unless is_fix_too_big
        result.message << ":o:\n"
    else
        warn "Too many modifications. Please consider splitting the PR if possible."
        result.message << ":heavy_exclamation_mark:\n"
        result.warnings += 1
    end

    return result

end

# Review routine for Release PR
def release_pr_check

    result = CheckResult.new("Release PR Check Result")

    ## PR should be sent from `develop` branch
    result.message << "Head Branch check |"
    is_from_develop = github.branch_for_head == "develop"
    if is_from_develop
        result.message += ":o:\n"
    else
        fail "Please send the PR from `develop` branch."
        result.message += ":x:\n"
        result.errors += 1
    end

    ## PR should be sent to `master` branch
    result.message << "Base Branch check |"
    is_to_master = github.branch_for_base == "master"
    if is_to_master
        result.message += ":o:\n"
    else
        fail "Please send the PR to `master` branch."
        result.message += ":x:\n"
        result.errors += 1
    end

    ## Release modification check
    release_modification_check_into_result(result)

    return result

end

# Main routine

## If there is a modification in bootstrap.sh file, ask for checking Bitrise workflow.
if bootstrap_sh_has_been_modified
    warn "bootstrap.sh file as modifications. Please remember to check and update Bitrise workflow in case needed."
end

## If there is a modification in Brewfile, ask for checking Brew Cache Settings and Bitrise.io Cache:Push step in Bitrise workflow.
if brewfile_has_been_modified
    warn "Brewfile has modifications. Please remember to update Brew Cache Settings and Bitrise.io Cache:Push step in Bitrise workflow."
end

## If there is a issue number in branch name, add a link to the issue in comment.
github_issue = find_github_issue
if github_issue
    message "GitHub Issue: <a href='https://github.com/el-hoshino/NotAutoLayout/issues/#{github_issue}'>##{github_issue}</a>"
end

## SwiftLint warnings check.
common_swiftlint_check

## Xcode Summary warnings check.
common_xcode_summary_check

## Find the check routine.
if is_develop_pr
    check_result = develop_pr_check
elsif is_release_pr
    check_result = release_pr_check
end

if check_result
    markdown(check_result.title)
    markdown(check_result.message)

    if check_result.errors == 0 && check_result.warnings == 0
        message "What a good PR :white_flower:"
    end

else
    fail "Failed to find the check routine for the PR. Please send the PR to `develop` or `master` branch."
end
