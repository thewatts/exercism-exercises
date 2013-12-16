class DNA

  attr_reader :dna

  def initialize(input)
    @dna = input
  end

  def nucleotide_counts
    counts = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    split_dna.each_with_object(counts) do |c|
      counts[c] += 1
    end
  end

  def count(something)
    if dna_nucleotides.include?(something)
      nucleotide_counts[something]
    else
      unless rna_nucleotides.include?(something)
        raise ArgumentError
      else
        0
      end
    end
  end

  def split_dna
    dna.chars
  end
  
  def dna_nucleotides
    ['A', 'T', 'C', 'G']
  end
  
  def rna_nucleotides
    ['U']
  end
end
