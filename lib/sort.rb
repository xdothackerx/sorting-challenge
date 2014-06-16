class Array
  def radix_sort
    arr = self
    pass = 1
    largest = arr.max_by(&:magnitude)
    max_digits = (largest == 0) ? 1 : Math.log10(largest.abs) + 1
    while pass <= max_digits
      buckets = Array.new(20) {[]}
      place = 10 ** pass
      arr.each do |n|
        bucket_indx = 10 + n.remainder(place)/(place/10)
        if n < 0
          bucket_indx = n%place/(place/10)
        end
        buckets[bucket_indx] << n
      end
      pass += 1
      arr = buckets.flatten
    end
    arr
  end
end
