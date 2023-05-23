# First passing solution

def matchingStrings(stringList, queries)
  stringListMap = {}
  stringList.map do |string|
      if stringListMap[string].nil?
          stringListMap[string] = 1
      else
          stringListMap[string] += 1
      end
  end

  queries.map do |query|
      (stringListMap[query].nil? ? 0 : stringListMap[query])
  end
end
