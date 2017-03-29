class KeysController < ApplicationController
  before_action :set_key, only: [:destroy]
  before_action :authenticate_user!
  load_and_authorize_resource #Cancancan feature to prevent unauthorized access to these views and methods

  def index
    @keys = Key.all
  end

  def new
    @key = Key.new
    @keys = Key.all
  end

  def create #action for uploading keyfiles and parsing individual records then storing them in db.
    @failed_samples = [] #structure to hold samples that can't be saved for any reason
    @number_samples_added = 0 #counter for keeping track of samples added to db
    @number_samples_updated = 0
    @current_dataset_id = nil
    @current_batch_id = nil
    @key = Key.new(key_params) #creating key model with imported file as the keyfile attribute value e.g. Key[:keyfile]
    if @key.save
      # :gflash => {:success => "File #{@key[:keyfile]} successfully uploaded" }
      if @key[:keyfile].split(".")[1] == 'csv' #checks to see if keyfile is a .csv file
        csv_text = File.read("#{Rails.root}/indigo_keys/#{@key.created_at.to_date}/#{@key[:keyfile]}") #reads the contents of the file stored on the server and stores it in a variable. File is a built-in Rails helper class with its own methods
        csv = CSV.parse(csv_text, :headers => true) #parses the text into csv rows. the :headers => true hash means that the first line of the csv_text will be treated as column names. CSV is another built-in Rails helper class
        csv.each do |sample_data|
          @idr = IDR.new(sample_source: sample_data["Sample Source"], disease: sample_data["Disease"], #creates an in-memory Sample object using the parsed csv data
          indigo_id: sample_data["INDIGO_ID"], gender: sample_data["Gender"], ethnicity: sample_data["Ethnicity"],
          age_at_sample: sample_data["Age at Sample"], sample_source_identifier: sample_data["Sample Source ID"],
          age_of_onset: sample_data["Age Of Onset"])

          #this section is concerned with updating existing IDR and Sample records that have missing data.
          if IDR.find_by(indigo_id: sample_data["INDIGO_ID"]) != nil #checks if an IDR with this INDIGO_ID is already in the database.
            @existingidr = IDR.find_by(indigo_id: sample_data["INDIGO_ID"])
            @existingsample = Sample.find_by(indigo_id: sample_data["INDIGO_ID"])
            if @existingidr.ethnicity == nil && @idr.ethnicity != nil
              @existingidr.update_attributes(ethnicity:@idr.ethnicity)
            end
            if @existingidr.gender == nil && @idr.gender != nil
              @existingidr.update_attributes(gender:@idr.gender)
            end
            if @existingidr.age_at_sample == nil && @idr.age_at_sample != nil
              @existingidr.update_attributes(age_at_sample:@idr.age_at_sample)
            end
            if @existingidr.age_of_onset == nil && @idr.age_of_onset != nil
              @existingidr.update_attributes(age_of_onset:@idr.age_of_onset)
            end
            if @existingsample.ethnicity == nil && @idr.ethnicity != nil
              @existingsample.update_attributes(ethnicity:@idr.ethnicity)
            end
            if @existingsample.gender == nil && @idr.gender != nil
              @existingsample.update_attributes(gender:@idr.gender)
            end
            if @existingsample.age_at_sample == nil && @idr.age_at_sample != nil
              @existingsample.update_attributes(age_at_sample:@idr.age_at_sample)
            end
            if @existingsample.age_of_onset == nil && @idr.age_of_onset != nil
              @existingsample.update_attributes(age_of_onset:@idr.age_of_onset)
            end

          else #if a sample with this INDIGO_ID doesn't exist in the db the code below creates and saves the csv row in the db.

            if @idr.save #attempts to save the idr model to the db

              @dataset = Dataset.find_by(source:sample_data["Sample Source"], disease:sample_data["Disease"])

              if @dataset == nil
                @dataset = Dataset.create(source:sample_data["Sample Source"], disease:sample_data["Disease"])
              end

              @current_dataset_id = @dataset.id

              @batch = Batch.find_by(dataset_id: @current_dataset_id, samples_received_at_ucsf: sample_data["Date Samples Received"], samples_sent_to_stanford: sample_data["Date to Stanford"])

              if @batch == nil
                @batch = Batch.create(dataset_id: @current_dataset_id, samples_received_at_ucsf: sample_data["Date Samples Received"], samples_sent_to_stanford: sample_data["Date to Stanford"])
              end
              @current_batch_id = @batch.id

              @sample = Sample.new(sample_source: sample_data["Sample Source"], disease: sample_data["Disease"],
              indigo_id: sample_data["INDIGO_ID"], gender: sample_data["Gender"], ethnicity: sample_data["Ethnicity"],
              age_at_sample: sample_data["Age at Sample"],site_sample_id: sample_data["Sample Source ID"], batch_id: @current_batch_id,
              age_of_onset: sample_data["Age of Onset"])

              if @sample.save
                @number_samples_added += 1
              else# If a sample fails to be saved (for whatever reason) we let the user know.
                @failed_samples.add(sample_data["INDIGO_ID"])
              end #ends the if..else block
            end #ends if @idr.save block
          end #ends the if exists? block
        end #ends the csv.each block
      elsif @key[:keyfile].split(".")[1] == 'xlsx' #checks for excel spreadsheet file type
        excel_spreadsheet = Roo::Spreadsheet.open("#{Rails.root}/indigo_keys/#{@key.created_at.to_date}/#{@key[:keyfile]}")
        excel_spreadsheet.drop(1).each do |row| #excel_spreadsheet is an array of arrays. the first array(row) are the header names which are not needed, so the .each iteration starts with the second row
          if IDR.where(indigo_id: row[1]).exists?
          else
            @idr = IDR.new(sample_source: row[2], disease: row[3], indigo_id: row[1], age_at_sample: row[6],
                                gender: row[7], ethnicity: row[5])
            if @idr.save
              sample = Sample.new(sample_source: row[2], disease: row[3], indigo_id: row[1], age_at_sample: row[6],
                                  gender: row[7], ethnicity: row[5])

              if sample.save
                @number_samples_added += 1
              else
                @failed_samples.add(row[1])
              end
            end
          end
        end
      end #ends the if @key[:keyfile].split block
      if @failed_samples.size > 0
        # :gflash => {:notice => "#{@failed_samples.size} samples failed to load and were not saved"}
      end
      redirect_to new_key_path
    end #ends the if @key.save block.

  end #ends the create method

  def destroy
  end

  private

    def key_params
      params.require(:key).permit(:keyfile)
    end

    def set_key
      @key = Key.find(params[:id])
    end

end
