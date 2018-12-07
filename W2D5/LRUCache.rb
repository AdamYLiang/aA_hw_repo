
  
  class LRUCache
    def initialize(page_no = 4)
        @pages = page_no
        @cache = []
    end

    def count
        @cache.count
    end

    def add(el)
        puts "This is pages #{@pages}"
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif count >= @pages
        @cache.shift
        @cache << el 
      else
        @cache << el
      end
    end

    def show
      p @cache
    end

    private
    # helper methods go here!
    attr_reader :pages, :cache

  end