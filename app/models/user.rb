class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :affiliation

   def select_affiliations
     return ["Aberdeen University",
       "Guthy-Jackson Foundation",
       "Kyushu University",
       "M.J. Fox Foundation",
       "Mayo Clinic",
       "NIA/NIH",
       "NIMH",
       "Oslo University Hospital",
       "Oxford University",
       "UCLA",
       "UCSF",
       "University of Bonn",
       "University of Highland and Islands",
       "University of London",
       "University of Pittsburgh",
       "University of Toronto",
       "Universtiy of Miami",
       "UT Southwestern",
       "Virginia Commonwealth University"]
   end
end
