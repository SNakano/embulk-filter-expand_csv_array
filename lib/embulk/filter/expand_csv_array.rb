require 'csv'

module Embulk
  module Filter
    class ExpandCsvArray < FilterPlugin
      Plugin.register_filter("expand_csv_array", self)

      def self.transaction(config, in_schema, &control)
        # configuration code:
        task = {
          "csv_column_name" => config.param("csv_column_name", :string),
          "column_names" => config.param("column_names", :array, default: [])
        }

        task["target"] = in_schema.find {|c| c.name == task['csv_column_name']}
        task["columns"] = in_schema.select {|c| task["column_names"].include?(c.name) }

        out_columns = []
        task["column_names"].each_with_index do |name, idx|
          out_columns << Column.new(idx, name, :string)
        end

        yield(task, out_columns)
      end

      def init
        # initialization code:
        @csv_column_name = task["csv_column_name"]
        @columns = task["columns"]
        @target = task["target"]
      end

      def close
      end

      def add(page)
        # filtering code:
        page.each do |record|
          record[@target["index"]].to_s.parse_csv.to_a.each do |val|
            data = @columns.map do |f|
              if f["index"] == @target["index"]
                val
              else
                record[f["index"]]
              end
            end
            page_builder.add(data)
          end
        end
      end

      def finish
        page_builder.finish
      end
    end
  end
end
