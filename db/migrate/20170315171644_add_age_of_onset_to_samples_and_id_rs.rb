class AddAgeOfOnsetToSamplesAndIdRs < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :age_of_onset, :integer
    add_column :IDRs, :age_of_onset, :integer
  end
end
