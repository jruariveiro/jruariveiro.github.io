# _plugins/pathutil_patch.rb
# Monkey-patch Pathutil#read to handle incorrect call signatures

require 'pathutil'

module PathutilPatch
  def read(*args, **kwargs)
    # Ignore accidental hash argument (caused by Liquid filters)
    if args.length == 1 && args.first.is_a?(Hash)
      super()
    else
      super(*args, **kwargs)
    end
  end
end

Pathutil.prepend(PathutilPatch)

