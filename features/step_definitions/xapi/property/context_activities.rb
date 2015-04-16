# encoding: UTF-8
module Property
  class ContextActivities

    def self.build(type)
      context = {}

      case type
        when 'categoryOnly'
          context['category'] = [Property::Activity.build('typical')]
        when 'parentOnly'
          context['parent'] = [Property::Activity.build('typical')]
        when 'groupingOnly'
          context['grouping'] = [Property::Activity.build('typical')]
        when 'otherOnly'
          context['other'] = [Property::Activity.build('typical')]
        when 'allPropertiesEmpty'
          context['category'] = []
          context['parent'] = []
          context['grouping'] = []
          context['other'] = []
        when 'allProperties'
          context['category'] = [Property::Activity.build('typical')]
          context['parent'] = [Property::Activity.build('typical')]
          context['grouping'] = [Property::Activity.build('typical')]
          context['other'] = [Property::Activity.build('typical')]
      end

      context
    end
  end
end