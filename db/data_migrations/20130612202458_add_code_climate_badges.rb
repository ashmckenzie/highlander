module DataMigration
  module MigrationFiles
    class AddCodeClimateBadges < Base

      def up
        Badge.create!(name: '1_code_quality_improvement', tag: 'Clean coder', description: 'First Code Quality Improvement')
        Badge.create!(name: '10_code_quality_improvements', tag: "Damn this guy is good", description: '10 Code Quality Improvements')
        Badge.create!(name: '25_code_quality_improvements', tag: "No wonder recruiters hassle you all day!", description: '25 Code Quality Improvements')
        Badge.create!(name: '50_code_quality_improvements', tag: "Step aside, Uncle Bob", description: '50 Code Quality Improvements')
        Badge.create!(name: '100_code_quality_improvements', tag: "That's some Sandi Metz shit right there", description: '100 Code Quality Improvements!')
      end

      def down
        Badge.find_by_name('1_code_quality_improvement').destroy
        Badge.find_by_name('10_code_quality_improvements').destroy
        Badge.find_by_name('25_code_quality_improvements').destroy
        Badge.find_by_name('50_code_quality_improvements').destroy
        Badge.find_by_name('100_code_quality_improvements').destroy
      end

    end
  end
end
