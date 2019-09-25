require 'open-uri'
require 'Fileutils'


uri = "https://tblg.k-img.com/resize/660x370c/restaurant/images/Rvw/114600/114600340.jpg"

fileName = File.basename(uri.jpg)
dirName = "public/store/"
filePath = dirName + fileName

FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

open(filePath, 'wb') do |output|
    open(uri) do |data|
        output.write(data.read)
    end
end


