module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups.
    module Placeholders
      def placeholder(wrapper_options = nil)
        input_html_options[:placeholder] ||= placeholder_text
        nil
      end

      def placeholder_text
        placeholder = options[:placeholder]
        placeholder.is_a?(String) ? placeholder : placeholder_translation
      end

      protected

      def placeholder_translation #:nodoc:
        if SimpleForm.translate_labels && (translated_placeholder = translate_from_namespace(:placeholders))
          translated_placeholder
        elsif object.class.respond_to?(:human_attribute_name)
          object.class.human_attribute_name(reflection_or_attribute_name.to_s)
        else
          attribute_name.to_s.humanize
        end
      end

    end
  end
end
