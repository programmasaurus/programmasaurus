class WikiDumpWorker
  include Sidekiq::Worker

  def perform(synset_id)
    synset = Synset.from_id(synset_id)
    WikiDump.new(synset).create_suggestions!
  end
end
