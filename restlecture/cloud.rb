require 'rubygems'
require 'httparty'
require 'pp'
require 'Base64'

class FortuneCookieStore
  include HTTParty
  base_uri 'https://www.digitalbucket.net/api/rest'
  headers 'User-Authentication' => Base64.encode64("rps@salas.com:daniel")
  
  def initialize
    get_root_folder
  end
  
  def get_root_folder
    rt = self.class.get('/getrootfolder.axd')
    @root = Crack::XML.parse(rt.parsed_response)['Folder']['FolderID']

  end
  
  def create_folder_for_parent(parent, name)
    options = {:query => {'parentid' => parent, 'foldername' => name}}
    self.class.get('/createfolder.axd', options)
  end
  
  def create_folder(name)
    create_folder_for_parent(@root, name)
  end
  
end

fc = FortuneCookieStore.new
fc.create_folder("hello world341")


