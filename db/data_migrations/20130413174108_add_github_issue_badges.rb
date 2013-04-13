module DataMigration
  module MigrationFiles
    class AddGithubIssueBadges < Base

      def up
        Badge.create!(name: '1_github_issue_opened',    tag: 'Picky bug-ger', description: 'First GitHub issue opened')
        Badge.create!(name: '25_github_issues_opened',  tag: 'Master bug spotter!', description: '25 GitHub issues opened')
        Badge.create!(name: '50_github_issues_opened',  tag: 'Half-century, one-man bug wrecking ball!', description: '50 GitHub issues opened')
        Badge.create!(name: '100_github_issues_opened', tag: 'Bug-spotting centurion!', description: '100 GitHub issues opened')
        Badge.create!(name: '500_github_issues_opened', tag: 'The greatest Bug Spotter there ever was!', description: '500 GitHub issues opened')

        Badge.create!(name: '1_github_issue_closed',    tag: 'Bug squasher', description: 'First GitHub issue closed')
        Badge.create!(name: '25_github_issues_closed',  tag: '25 issues resolved... not too shabby', description: '25 GitHub issues closed')
        Badge.create!(name: '50_github_issues_closed',  tag: 'Half-century of issues crushed', description: '50 GitHub issues closed')
        Badge.create!(name: '100_github_issues_closed', tag: '100 bugs swept away. Marry me xoxoxo', description: '100 GitHub issues closed')
        Badge.create!(name: '500_github_issues_closed', tag: 'GOD of the bug-smashers!', description: '500 GitHub issues closed')
      end

      def down
        Badge.find_by_name('1_github_issue_opened').destroy
        Badge.find_by_name('25_github_issues_opened').destroy
        Badge.find_by_name('50_github_issues_opened').destroy
        Badge.find_by_name('100_github_issues_opened').destroy
        Badge.find_by_name('500_github_issues_opened').destroy

        Badge.find_by_name('1_github_issue_closed').destroy
        Badge.find_by_name('25_github_issues_closed').destroy
        Badge.find_by_name('50_github_issues_closed').destroy
        Badge.find_by_name('100_github_issues_closed').destroy
        Badge.find_by_name('500_github_issues_closed').destroy
      end
    end
  end
end
