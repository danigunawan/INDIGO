class NmdpApisController < ApplicationController

  respond_to :html


  def test_gfe
    @urlstring_to_post
    @result = HTTParty.post("http://sandypoint.ucsf.edu:8080/gfe",
                            :body => {
                                :locus => 'HLA-A',
                                :sequence => 'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnnnnngcataAAAAGTTTACAACAACAAGATAAAAAATAAGAAGT
GTYTTTATAGTGTGAGGATAAGTTTAGATTTATTTTTTCCTACGTGTAACCCTATGGTCC
TGTGTTATTTRTTGAGAAAATATTCTATTCCACCTTAAACTACATGGCAGCCTTTGTCAA
CTATAAAGGGACTGTGTATCCACAGATGTATTTTAGACACAGTTTTCTGCCCAGTGGTTC
TCTGTATCCCCTCTCATGAGGATGCTGCATTTCATATAAACTTATAGAACCCCTTAAAAT
TTGGTAACCTGAGTTCTCTGATTTGTTATTATAGGTTATTTAGTTTGCTTTTTTTTTTCT
TTCTTGAGACAGACTCTTCCTCGGTCACCCAAGCTGGAGTTCAGTGGCTTGAGCTCAGCT
CACTGCAGCCTCCGCCTCCCAGGTTCAAGCAATTCTCGTGCCTCAGGTTTAGTACTAGAA
ACTCATCAGGAAAATTAGAATGGCTTTTTGTCACAATTACTCTGATAATGTTAATAATAC
CTCTTAGATATTTTGCACATTACACATGAAGAAAAGTTTGAATCTCAGATAAAAACAAAA
ATACATCAAAAGTCTTTAATGTAAGCACAGAATTCAATCACCTCATGTGTGAGAGGTTGG
ATCTGAGACGTCTTTTGAGTCTGGTCATAGTGAAGGATGCAAGGTGGCAATTGTAGTCAC
AACAATTTCCAGGAAGCCATGTTCCGCTCTTGAGCGAGCACCCACTGGGCCTCATGCAAG
GTAGAAAGAGCCTGCGTACGTCACCCTCCCATGATGTGGTCAACATGTAAACTGCATGGG
CAGGGCGCCAAATAACATCCTGTGCGCTGCTGAGCTGAGCTGGGGCGCGGCCTCCTGTCT
GCACCGGCAGCACCATGTCGCTCACKGTCGTCAGCATGGCGTGCGTTGGTGAGTCCTGGA
AGGGAATAGAGGGAGGGAGAGTGGGGATGGAGATCTCGGCCTAGAGGTAAAGATATGGGC
CTGGAGTGGAGATATGGGCCTGGAGTGGAGATATGGGCCTGGGTGTGGAGATAtgggcct
ggaggtgtaaatatgggcctggagtggagatatgggcnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
nnnnnnnnnnnnnnnnATATGGGCCTGGAGTGGAGATAGGGGCCTGGAGTGGAGATATGG
GCCTGGAGTGGAGATCTGGGCCAGGAAGTGTTGATCTGGGCCTGGAGCCTGGGTCTCTCC
ACAGCTGAGAGCCCTGTTCTTGGCAGCAGGTAGCAGGGAGGCTAAGTTTACCTTCAGCCC
AGCAAGGGCCTGGCTGCCAAGACACACAGTGCAGTGGGGGCAGCAGGGTGCCCTGGTTTG
CCTGCAGTTGGATCGTCTATCATGATCTTTCTTTCCAGGGTTCTTCTTGCTGCAGGGGGC
CTGGCCACTCATGGGTGAGTCCKTCCCCAAACCTTAGGGTGTCATCTCCCCACATAAGAG
GATTTTTCTGAAACAGGAGGGAAGTCCTGTCGGGGAGTCTCTCATAAACTAGGAAGAGGG
GACCCTTGGATACTCGGCCCACATTTCTGACCTCGCCCTCCCYGGCCTTTCTTTCCCTTT
CCTGAGTCAAGCTCTGTGAAGACTGGGGTGAGACTGGGGTGCTCCAAGCTGGGGTGTGCA
GGGAGGAAGTGGTGTCAGCAGCAGAGAAAGAGAGGGAWGCAGTGCTAGGAACAGCAGGTC
CTCTGAGGACAAAGGTATAACTGACACCCTCCAGCGTTTCCGTGACGGTAGGGRCTGCAG
TGTGGCTGCGGTCTTTCTACCAGAAGAGGGGGGAAACCACAGCCATGGCCCTGACATTCC
AAATCCTCTGAGGGGGCTCAGTTCATGAATTGGCTGATATTCCATTCACATAGGACATGC
CCTCCATGCCGTGTCTACTTTGTGTTGTTTTATGTGAGTAATTTTGCAGTATTAAAATCT
AGTAAGAGTCACTTATTCAGCACTTGCTCAAAGTTCTCAGCTGACACTTGTTGTAGGGAG
ACGCCATGTCTATGTGGGGTGGGTCCTTCCTGTAGCCCTGGGCACCCAGGTGTGGTAGGA
GCCTTAGAAAGYGGAAATGGGAGAATCTTCTGAGCACAGGGAGGGAGGGGYGGCTCCACA
TCCTCCTCTCTAAGGCAGTGCCTCCTTCTCCCCCAGGTGGTCAGGACAAACCCTTCCTGT
CTGCCCGGCCCAGCACTGTGGTGCCTCGAGGAGGACACGTGGCTCTTCAGTGTCACTATC
GTCGTGGGTTTAACAATTTCATGCTGTACAAAGAAGACAGAAGCCACGTTCCCATCTTCC
ACGGCAGAATATTCCAGGAGAGCTTCATCATGGGCCCTGTGACCCCAGCACATGCAGGGA
CCTACAGATGTCGGGGTTCACGCCCACACTCCCTCACTGGGTGGTCGGCACCCAGCAACC
CCCTGGTGATCATGGTCACAGGTCAGAGGCTTTCTGTCTGGGCTTCTCACTGTCCCACCT
CCTGAATCCCAGAGCTTCTGGTGGGGGTGTCCATCAGGGTCCCATCACCCAGGCCCCAAC
TGTATTTGGGGTCAAGGGGGATTGAATACAGGGGAAATGGGYGCTGTGGTGGGAAGAATM
ACTGTCGCCAATGATGGCTACATTGTAAWCCCTGGAGCCTGTGACTATTTATGTTATAGG
GCAGGGGACTGAAGGGGAAGGTGGAGCTCAGGTTGTTGATGAGTTGACCTTGAGATGGGG
AGACAGCCTGGACTGTCCTGCTGGGCTCAGTGTAATCACAAGGGTCCGCGTGAGAGGTGG
AGGAAGAGGGGAGTGGGGATTAGAGCAGTGTAGTGGGAGGGAGACGCTATCAGCCACTGT
GGGCTTTGAAGGTGGAGGAAGGCCACTAGTCACAGAATGCAGGTGGCCTCTAAGGGCTGG
AGAAGTCAAGAGAACTGATTCGCTGAKTCTCCAGAGGGAACGCAGCCCTGCAGATGCCTT
GATTTCAGCACAGGGAGAACTGGATCCAATTTCTGTCCCCAGAAGTGGAAGGGGTCAGTG
TGTTCTCTCCTGCTGCCATGTTTGTGATAATTTTCTGCAGCAGCAACAGGAAACCGACAC
AGGAACCCAGGTCAAGGACAAGCTAGGAAACCAAACAAGGATAGCCAGGTGTGGTGGTGG
GCACGAGTAATCCAACGACTGGGGAGGCTGAGGCAAGATAATCACTTGAACCGGGGAGGC
AGAGGTTGCAGTGAGCCAAGACAACACCACTGCACTCCAGCCTGGGTGAAAAAGTGACTG
TCTCAAAAATAAATTAATTAATCAATTAATTAAAGAAACCAAACAAGGAGAAGGTTGGCT
ACCGTGGGATCAGCAAGGGTGGGATGCTGATGCCACCACCAGGCTCCATCCACATAGGAA
GGGGTTGATGCTCCTGGAACCAGCACCAGGGACCACCCTATGGAAGCTGGGGCCATGGAG
AAGGCACAGACATGGCAGGAGAGGCTCCCAATCCCCATCAGGAACAGGGTGTGTGGACAC
TGATGTCTGCCTTACTGATGAGTTGATACCTCTGCCAGAGACTCCAATTTGTTCAAAAGA
GATTGATTCAGGCTGCTGAGAGCCTGGACATGCAGCCTGTCCTCTTCCACCCCCACATAG
ACAGCAGGAAAGAGACTAGTGGGAAAGAGATACAACAGCCCAAGAGATGAGGCTCTCTTC
ACAGTGGGAAGGGAGTCAGGGGCTACTGGAGACAGAGGGACAGAGAAGAGGGAGGAAGAC
AAATGGAGGGACCTGCACCAGGGGATATGGGCACAGAAAAGACACGGAGACACAGAGAGG
GAGGAGAGAGACAGACCTCTGGGAGGGGAACCCTCACTCATTCCAGGTGCCATGGATGGG
ATGATAAAGAGAGATGCCTTCTAAACTCACAACTTCTCTTTCTAGGAAACCACAGAAAAC
CTTCCCTCCTGGCCCACCCAGGGCCCCTGCTGAAATCAGGAGAGACAGTCATCCTGCAAT
GTTGGTCAGATGTCATGTTTGAGCAYTTCTTTCTGCACAGAGAGGGGATCTCTGAGGACC
CCTCACGCCTCGTTGGACAGATCCATGATGGGGTCTCCAAGGCCAACTTCTCCATCGGTC
CCTTGATGCCTGTCCTTGCAGGAACCTACAGATGTTATGGTTCTGTTCCTCACTCCCCCT
ATCAGTTGTCAGCTCCCAGTGACCCCCTGGACATCGTGATCACAGGTGAGAGTGTCCAGA
CATTCTTCTCATTGTCATTGGGACACAGAGTGAATGATCCAGGACTTGGAACCCCCAGGT
GGTCATGAGGAAGATAAGCGTGGGATTCTTATGGAGAGAGACTGACTCGGTGAGGTCTGT
ACCAACAGAGACAGGGAAACAGGAGACATAAGTACAGACCAGGTGTCATAACAGAGGACA
GACACAGGGGCCATACGGGGAAGTAGAAAAGAGAGAAAGAGGTAAAGGAGACACTCAGAC
AGACAGACATGTGCCAGAGAGAAGTGTCCTTCCATGCTGACTTTGCTCAGAGACCTGGCA
CAGGTTAGAAGTTTCATTTCTGTTTTGTCTCCACAAAGTGCTTCTACGAGGAGAACCCAA
GGACACCCATATTTCTGACCTGAGTTGGGCCCTGTGGCCTCAGGCCTTGTGGCATCTACA
GATGCCATGTTTATTCTGACACCTCTGCCTTCCATGCAGTGGAGCCATAATTATCCCAGG
ATATCATGGCCCCAGAACACCAACCCCTAAATACTGTGTGTACTTGGTGTCCCCAGACTA
GATTCTGAGGCTCATATTCCAAATAATCCTACATATAATAGGATCACTGAGAGACACAGA
GATAAATCAGGGACTTCAAAAAGCAAAGGCATAAACACACAGAGAATGAGCCAGAGGAAG
GGGATTGAGAGACTCACAGACACACAAAAAGAAAGAAAAGAGGGCAGAGGAGTGGAGAGA
ATGCTGGAAGGGAGGAGAGAAAAGCCCCAAAATCAGAACCCTGAGGGAGGGGCACAAAGA
CAGAGAAAGATAAAGATGTGGGGATGGATTGCAGAGATTCCAAATAGAACTAGAGAGACT
GAGAGGCAGAGAAAGACAAGGAGATGGAGAGAGACAGATGATAGATGGATAGATAGATAT
AGATAGATGATAAATAGGTAGATGATAGATAATGGATAGGTTATAGATACATAGATGATG
ATTGATAGATGATACatagagatgatgatgatgatgatgaagatagATAGAAGACACATA
TATAAATATATAGATACATAGATGATACATAGAGACTGACAGGCAGACAGAGAGGTAATA
GAGAGAGAGAGAGATGATACATAGATACAGATAATACATAGATGATTGATGGATAGACAG
ATAGACAATTGATAGATAAATGATACATAGATATAGATGACAGATAATTTGTAGATAGAC
ACAAAATAGATAGATAGATAATAGATAGAAATATGCAGAAAGTTATGAACAAGACAGAAA
GTGAGAGACTCAGAATTATAGAAAAAGGAAGATCAAGTCAACCAATCCAAGGAGAGTCAG
AGAGAATAAAACAATYCAAAAAGGGAAAGCATACCCAGGGGTGGGGAAGTGAGGTCAGAG
ACCTAGAGAGACAGAGAAGGCGGAAGGAGGAAATAGACATGAAGAGAGTTGGGGTGGAGG
GTGAGAGAGAGAGAGAGCATTAGGTCATAGAGCAGGGGAGTGAGTTCTCAGCTCAGGTAT
GAGGGGAGCTGTGACAAGGAAGAACCTCCCTGAGGAAACTGCCTCTTCTCCTTCCAGGTC
TATATGAGAAACCTTCTCTCTCAGCCCAGCCGGGCCCCACGGTTCAGGCAGGAGAGAACG
TGACCTTGTCCTGTAGCTCCTGGAGCTCCTATGACATCTACCATCTGTCCAGGGAAGGGG'
                            }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )
  end



end
