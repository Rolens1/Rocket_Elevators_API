class PollyController < ApplicationController
    def index
        Synthesizer.synthesize
    end
end
