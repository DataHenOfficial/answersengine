module AnswersEngine
  module Client
    class Job < AnswersEngine::Client::Base
      def all(opts={})
        self.class.get("/jobs", @options)
      end

      def update(job_id, opts={})
        body = {}

        body[:status] = opts[:status] if opts[:status]
        @options.merge!({body: body.to_json})

        self.class.put("/jobs/#{job_id}", @options)
      end

      def cancel(job_id, opts={})
        opts[:status] = 'cancelled'
        update(job_id, opts)
      end

      def resume(job_id, opts={})
        opts[:status] = 'active'
        update(job_id, opts)
      end

      def pause(job_id, opts={})
        opts[:status] = 'paused'
        update(job_id, opts)
      end


    end

  end
end

