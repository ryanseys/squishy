class Squishy
  def self.squish(site_dir)
    jar_file_path = File.join(File.dirname(__FILE__), *%w"htmlcompressor.jar")
    puts "\nSquishing..."
    html_options = [
      '--type html', # squish html files
      '--remove-intertag-spaces', # squish moar!
      '--compress-js', # squish inline js (yui)
      '--compress-css' # squish inline css (yui)
    ]

    xml_options = [
      '--type xml' # and squish xml files
    ]

    options = [
      "#{jar_file_path}", # path to squisher jar
      '-r', # recursivly find and squish all files
      "#{site_dir}", # the directory we read from
      "-o #{site_dir}" # output directory
    ]

    system("java -jar #{[options, html_options].flatten.join(' ')}")
    system("java -jar #{[options, xml_options].flatten.join(' ')}")
    puts "Squished!"
  end
end
