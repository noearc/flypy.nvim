  local source = {}
  local item = require('cmp_flypy.item')

  source.new = function()
    local self = setmetatable({}, { __index = source })
    self.commit_items = nil
    self.insert_items = nil
    return self
  end

  ---Return whether this source is available in the current context or not (optional).
  ---@return boolean
  function source:is_available()
    return true
  end

  ---Return the debug name of this source (optional).
  ---@return string
  function source:get_debug_name()
    return 'debug name'
  end

  ---Return LSP's PositionEncodingKind.
  ---@NOTE: If this method is ommited, the default value will be `utf-16`.
  ---@return lsp.PositionEncodingKind
  function source:get_position_encoding_kind()
    return 'utf-16'
  end

  ---Invoke completion (required).
  ---@param params cmp.SourceCompletionApiParams
  ---@param callback fun(response: lsp.CompletionResponse|nil)
  function source:complete(params, callback)
    callback(item)
  end
  ---Resolve completion item (optional). This is called right before the completion is about to be displayed.
  ---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
  ---@param completion_item lsp.CompletionItem
  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  function source:resolve(completion_item, callback)
    callback(completion_item)
  end

  ---Executed after the item was selected.
  ---@param completion_item lsp.CompletionItem
  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  function source:execute(completion_item, callback)
    callback(completion_item)
  end

require('cmp').register_source('flypy', source)
print(vim.inspect(source))
return source
