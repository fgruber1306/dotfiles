require('luasnip.session.snippet_collection').clear_snippets 'html'

local ls = require 'luasnip'

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('html', {
  s('fd', fmt('<f:debug maxDepth="20">{{{}}}</f:debug>{}', { i(1), i(0) })),
  s('fda', fmt('<f:debug maxDepth="20">{{_all}}</f:debug>{}', { i(0) })),
  s('fimage', fmt('<f:image src="{}" alt="{}" {}/>{}', { i(1), i(2), i(3), i(0) })),
  s('fformat', fmt('<f:format.html>{}</f:format.html>{}', { i(1), i(0) })),
  s('flink', fmt('<f:link pageUid="{{{}}}" class="{}">\n\t{}\n</f:link>{}', { i(1), i(2), i(3), i(0) })),
  s('ftrans', fmt('<f:translate id="{}" extensionName="{}" />{}', { i(1), i(2), i(0) })),
  s('frender', fmt('<f:render partial="{}" arguments="{{{}}}" />{}', { i(1), i(2), i(0) })),
  s('ffor', fmt('<f:for each="{{{}}}" as="{{{}}}">\n\t{}\n</f:for>{}', { i(1), i(2), i(3), i(0) })),
  s('fif', fmt('<f:if condition="{{{}}}">\n\t{}\n</f:if>{}', { i(1), i(2), i(0) })),
  s('fifelse', fmt('<f:if condition="{{{}}}">\n\t<f:then>\n\t\t{}\n\t</f:then>\n\t<f:else>\n\t\t{}\n\t</f:else>\n</f:if>{}', { i(1), i(2), i(3), i(0) })),
  s('fvar', fmt('<f:variable name="{}" value="{}" />{}', { i(1), i(2), i(0) })),
  s('fxvar', fmt('<f:variable name="xData" value="{{\n\tinit() {{\n\t\t{}\n\t}}\n}}" />{}', { i(1), i(0) })),
})

