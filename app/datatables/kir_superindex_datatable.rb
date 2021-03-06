class KirSuperindexDatatable
  delegate :params, :h, to: :@view

  def initialize(view, disease)
    @view = view
    @disease = disease
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Kir.count,
      iTotalDisplayRecords: kirs.total_entries,
      aaData:data
    }
  end

  private

    def data
      kirs.map do |kir|

        [
          kir.indigo_id,
          kir.KIR2DL1,
          kir.KIR2DL2,
          kir.KIR2DL3,
          kir.KIR2DL4,
          kir.KIR2DL5A,
          kir.KIR2DL5B,
          kir.KIR2DP1,
          kir.KIR2DS1,
          kir.KIR2DS2,
          kir.KIR2DS3,
          kir.KIR2DS4,
          kir.KIR2DS5,
          kir.KIR3DL1,
          kir.KIR3DL2,
          kir.KIR3DL3,
          kir.KIR3DS1
        ]
      end
    end

    def kirs
      @kirs ||= fetch_kirs
    end

    def fetch_kirs
      samples = Sample.where(disease:@disease).pluck(:id)
      kirs = Kir.where(sample_id:samples).order("#{sort_column} #{sort_direction}")
      kirs = kirs.paginate(:page => page, :per_page => per_page) #per_page == limit(value) page == offset
      if params[:search][:value].present?
        kirs = kirs.where("indigo_id like :search", search:"%#{params[:search][:value]}%")
      end
      kirs
    end

    def page
      params[:start].to_i/per_page + 1
    end

    def per_page
      params[:length].to_i > 0 ? params[:length].to_i : 100
    end

    def sort_column
      columns = %w(indigo_id)
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:order]["0"]["dir"] == "desc" ? "desc" : "asc"
    end
end
