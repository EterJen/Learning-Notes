 总结一下Jsoup提供的方法：
获取元素的有：
getElementById(String id)
getElementsByTag(String tag)
getElementsByClass(String className)
getElementsByAttribute(String key)
siblingElements(), firstElementSibling(), lastElementSibling(); nextElementSibling(), previousElementSibling()
parent(), children(), child(int index)
获取元素数据：
attr(String key) 获取属性
attr(String key, String value) 设置属性
attributes() 获取所有属性
id(), className() and classNames()
text() 获取文字内容
text(String value) 设置文字内容
html() 获取html内容
html(String value) 设置html内容
outerHtml()
data() 获取类似script，style的数据内容
tag() and tagName()
操作HTML内容：
append(String html), prepend(String html)
appendText(String text), prependText(String text)
appendElement(String tagName), prependElement(String tagName)
html(String value) 