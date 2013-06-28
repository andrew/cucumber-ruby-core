# encoding: UTF-8¬
module Cucumber
  module Core
    module Test
      module Result
        Unknown = Struct.new(:subject) do
          def describe_to(visitor, *args)
            self
          end
        end

        Passed = Struct.new(:subject) do
          def describe_to(visitor, *args)
            visitor.passed(*args)
            self
          end

          def to_s
            "✓"
          end
        end

        Failed = Struct.new(:subject, :exception) do
          def describe_to(visitor, *args)
            visitor.failed(*args)
            visitor.exception(exception, *args)
            self
          end

          def to_s
            "✗"
          end
        end

        Skipped = Struct.new(:subject) do
          def describe_to(visitor, *args)
            visitor.skipped(*args)
            self
          end

          def to_s
            "-"
          end
        end

      end
    end
  end
end
